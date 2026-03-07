"""
Data Storage and Deduplication Utilities
Handles saving data to CSV, Excel, and JSON formats with deduplication
"""

import os
import json
import logging
import hashlib
import re
from typing import List, Dict, Any, Set
from datetime import datetime

import pandas as pd

# Ensure logs directory exists
os.makedirs('logs', exist_ok=True)

# Configure logging
logging.basicConfig(
    level=logging.INFO,
    format='%(asctime)s - %(name)s - %(levelname)s - %(message)s',
    handlers=[
        logging.FileHandler('logs/data_utils.log'),
        logging.StreamHandler()
    ]
)
logger = logging.getLogger(__name__)


class DataDeduplicator:
    """Handles deduplication of healthcare data"""
    
    def __init__(self):
        self.seen_hashes: Set[str] = set()
    
    def _generate_hash(self, item: Dict) -> str:
        """Generate a unique hash for an item based on key fields"""
        # Use multiple fields for deduplication
        key_fields = []
        
        # For Google Maps facilities
        if 'clinic_name' in item and item['clinic_name']:
            key_fields.append(str(item['clinic_name']).strip().lower())
        if 'address' in item and item['address']:
            key_fields.append(str(item['address']).strip().lower())
        if 'phone_number' in item and item['phone_number']:
            # Normalize phone number
            phone = re.sub(r'\D', '', str(item['phone_number']))
            key_fields.append(phone[-7:])  # Use last 7 digits
        
        # For website doctor profiles
        if 'doctor_name' in item and item['doctor_name']:
            key_fields.append(str(item['doctor_name']).strip().lower())
        if 'hospital' in item and item['hospital']:
            key_fields.append(str(item['hospital']).strip().lower())
        if 'specialty' in item and item['specialty']:
            key_fields.append(str(item['specialty']).strip().lower())
        
        # If no key fields found, use all non-empty string values
        if not key_fields:
            for key, value in item.items():
                if value and isinstance(value, str):
                    key_fields.append(f"{key}:{value.strip().lower()}")
        
        hash_input = '|'.join(key_fields) if key_fields else json.dumps(item, sort_keys=True)
        return hashlib.md5(hash_input.encode()).hexdigest()
    
    def deduplicate(self, data: List[Dict]) -> List[Dict]:
        """Remove duplicate entries from data"""
        unique_items = []
        
        for item in data:
            item_hash = self._generate_hash(item)
            
            if item_hash not in self.seen_hashes:
                self.seen_hashes.add(item_hash)
                unique_items.append(item)
            else:
                logger.debug(f"Removed duplicate: {item.get('clinic_name') or item.get('doctor_name', 'Unknown')}")
        
        logger.info(f"Deduplication: {len(data)} items -> {len(unique_items)} unique items")
        return unique_items
    
    def merge_datasets(
        self, 
        google_maps_data: List[Dict], 
        website_data: List[Dict]
    ) -> Dict[str, List[Dict]]:
        """Merge and deduplicate data from multiple sources"""
        # Deduplicate each dataset separately first
        unique_gmaps = self.deduplicate(google_maps_data)
        
        # Reset hashes for website data
        self.seen_hashes = set()
        unique_website = self.deduplicate(website_data)
        
        # Combine and final deduplication
        self.seen_hashes = set()
        all_facilities = self.deduplicate(unique_gmaps + unique_website)
        
        # Separate facilities and doctors
        facilities = [item for item in all_facilities if item.get('source') == 'google_maps']
        doctors = [item for item in all_facilities if item.get('source') == 'hospital_website']
        
        # Also include items with doctor_name from Google Maps data
        doctor_facilities = [item for item in all_facilities 
                           if item.get('doctor_name') and item.get('source') == 'google_maps']
        
        return {
            'all_facilities': all_facilities,
            'facilities': facilities,
            'doctors': doctors + doctor_facilities,
            'google_maps_only': unique_gmaps,
            'website_only': unique_website
        }


class DataStorage:
    """Handles saving data to multiple formats"""
    
    def __init__(self, output_dir: str = 'data'):
        self.output_dir = output_dir
        self._ensure_directory()
    
    def _ensure_directory(self):
        """Ensure output directory exists"""
        if not os.path.exists(self.output_dir):
            os.makedirs(self.output_dir)
            logger.info(f"Created directory: {self.output_dir}")
    
    def _get_timestamp(self) -> str:
        """Get current timestamp for filenames"""
        return datetime.now().strftime('%Y%m%d_%H%M%S')
    
    def save_json(self, data: List[Dict], filename: str = None) -> str:
        """Save data to JSON file"""
        if not filename:
            filename = f"healthcare_data_{self._get_timestamp()}.json"
        
        filepath = os.path.join(self.output_dir, filename)
        
        # Create metadata
        output = {
            'metadata': {
                'timestamp': datetime.now().isoformat(),
                'total_records': len(data),
                'sources': list(set(item.get('source', 'unknown') for item in data))
            },
            'data': data
        }
        
        with open(filepath, 'w', encoding='utf-8') as f:
            json.dump(output, f, indent=2, ensure_ascii=False)
        
        logger.info(f"Saved JSON: {filepath} ({len(data)} records)")
        return filepath
    
    def save_csv(self, data: List[Dict], filename: str = None) -> str:
        """Save data to CSV file"""
        if not filename:
            filename = f"healthcare_data_{self._get_timestamp()}.csv"
        
        filepath = os.path.join(self.output_dir, filename)
        
        if not data:
            logger.warning("No data to save to CSV")
            return filepath
        
        # Normalize data - ensure all items have the same keys
        all_keys = set()
        for item in data:
            all_keys.update(item.keys())
        
        normalized_data = []
        for item in data:
            normalized_item = {key: item.get(key, '') for key in all_keys}
            normalized_data.append(normalized_item)
        
        df = pd.DataFrame(normalized_data)
        df.to_csv(filepath, index=False, encoding='utf-8-sig')
        
        logger.info(f"Saved CSV: {filepath} ({len(data)} records, {len(all_keys)} columns)")
        return filepath
    
    def save_excel(
        self, 
        data: Dict[str, List[Dict]], 
        filename: str = None
    ) -> str:
        """Save data to Excel file with multiple sheets"""
        if not filename:
            filename = f"healthcare_data_{self._get_timestamp()}.xlsx"
        
        filepath = os.path.join(self.output_dir, filename)
        
        with pd.ExcelWriter(filepath, engine='openpyxl') as writer:
            # Summary sheet
            summary_data = {
                'Metric': [
                    'Total Facilities',
                    'Google Maps Facilities',
                    'Hospital Websites',
                    'Doctors',
                    'Timestamp'
                ],
                'Value': [
                    len(data.get('all_facilities', [])),
                    len(data.get('facilities', [])),
                    len(data.get('website_only', [])),
                    len(data.get('doctors', [])),
                    datetime.now().isoformat()
                ]
            }
            summary_df = pd.DataFrame(summary_data)
            summary_df.to_excel(writer, sheet_name='Summary', index=False)
            
            # All facilities sheet
            if data.get('all_facilities'):
                df_all = pd.DataFrame(data['all_facilities'])
                df_all.to_excel(writer, sheet_name='All Facilities', index=False)
            
            # Google Maps facilities sheet
            if data.get('facilities'):
                df_gmaps = pd.DataFrame(data['facilities'])
                df_gmaps.to_excel(writer, sheet_name='Google Maps', index=False)
            
            # Doctors sheet
            if data.get('doctors'):
                df_doctors = pd.DataFrame(data['doctors'])
                df_doctors.to_excel(writer, sheet_name='Doctors', index=False)
            
            # Hospital website data sheet
            if data.get('website_only'):
                df_web = pd.DataFrame(data['website_only'])
                df_web.to_excel(writer, sheet_name='Hospital Websites', index=False)
        
        logger.info(f"Saved Excel: {filepath}")
        return filepath
    
    def save_all_formats(
        self, 
        merged_data: Dict[str, List[Dict]],
        timestamp: str = None
    ) -> Dict[str, str]:
        """Save data in all formats"""
        if not timestamp:
            timestamp = self._get_timestamp()
        
        saved_files = {}
        
        try:
            # Save combined JSON
            saved_files['json'] = self.save_json(
                merged_data['all_facilities'],
                f'healthcare_maldives_{timestamp}.json'
            )
            
            # Save combined CSV
            saved_files['csv'] = self.save_csv(
                merged_data['all_facilities'],
                f'healthcare_maldives_{timestamp}.csv'
            )
            
            # Save Excel with multiple sheets
            saved_files['excel'] = self.save_excel(
                merged_data,
                f'healthcare_maldives_{timestamp}.xlsx'
            )
            
            # Save separate files for each source
            if merged_data.get('facilities'):
                saved_files['csv_gmaps'] = self.save_csv(
                    merged_data['facilities'],
                    f'facilities_google_maps_{timestamp}.csv'
                )
            
            if merged_data.get('doctors'):
                saved_files['csv_doctors'] = self.save_csv(
                    merged_data['doctors'],
                    f'doctors_{timestamp}.csv'
                )
            
            logger.info(f"All files saved successfully: {list(saved_files.values())}")
            
        except Exception as e:
            logger.error(f"Error saving files: {e}")
            raise
        
        return saved_files


# Import re for phone normalization
import re


def process_and_save(
    google_maps_results: List[Dict],
    website_results: List[Dict],
    output_dir: str = 'data'
) -> Dict[str, Any]:
    """
    Main function to process, deduplicate and save all data
    
    Args:
        google_maps_results: Raw results from Google Maps scraper
        website_results: Raw results from website scraper
        output_dir: Directory to save output files
    
    Returns:
        Dictionary with statistics and saved file paths
    """
    logger.info("=" * 60)
    logger.info("Processing and Saving Healthcare Data")
    logger.info("=" * 60)
    
    # Initialize processors
    deduplicator = DataDeduplicator()
    storage = DataStorage(output_dir)
    
    # Merge and deduplicate data
    merged_data = deduplicator.merge_datasets(google_maps_results, website_results)
    
    # Save all formats
    timestamp = datetime.now().strftime('%Y%m%d_%H%M%S')
    saved_files = storage.save_all_formats(merged_data, timestamp)
    
    # Statistics
    stats = {
        'timestamp': timestamp,
        'total_unique_facilities': len(merged_data['all_facilities']),
        'google_maps_facilities': len(merged_data['facilities']),
        'website_doctors': len(merged_data['doctors']),
        'google_maps_raw': len(google_maps_results),
        'website_raw': len(website_results),
        'duplicates_removed': (
            len(google_maps_results) + len(website_results) - 
            len(merged_data['all_facilities'])
        ),
        'saved_files': saved_files
    }
    
    # Save statistics
    stats_file = os.path.join(output_dir, f'scraping_stats_{timestamp}.json')
    with open(stats_file, 'w', encoding='utf-8') as f:
        json.dump(stats, f, indent=2)
    
    logger.info("=" * 60)
    logger.info("Processing Complete!")
    logger.info(f"Total unique facilities: {stats['total_unique_facilities']}")
    logger.info(f"Google Maps facilities: {stats['google_maps_facilities']}")
    logger.info(f"Doctor profiles: {stats['website_doctors']}")
    logger.info(f"Duplicates removed: {stats['duplicates_removed']}")
    logger.info("=" * 60)
    
    return stats


if __name__ == "__main__":
    # Test with sample data
    sample_gmaps = [
        {
            'clinic_name': 'Test Clinic',
            'address': 'Test Street, Male',
            'city': 'Male',
            'source': 'google_maps'
        }
    ]
    
    sample_web = [
        {
            'doctor_name': 'Dr. Test',
            'hospital': 'Test Hospital',
            'specialty': 'General Medicine',
            'source': 'hospital_website'
        }
    ]
    
    stats = process_and_save(sample_gmaps, sample_web)
    print(json.dumps(stats, indent=2))
