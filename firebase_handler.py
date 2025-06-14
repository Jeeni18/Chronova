import firebase_admin
from firebase_admin import credentials, db
import logging
from datetime import datetime
from typing import Dict, List, Optional, Tuple

# Set up logging
logger = logging.getLogger(__name__)

# Initialize Firebase (only if not already initialized)
if not firebase_admin._apps:
    try:
        # Load your Firebase service account key
        cred = credentials.Certificate("firebase-cred.json")
        
        # Initialize the Firebase app with your database URL
        firebase_admin.initialize_app(cred, {
            'databaseURL': 'https://chronova-c675c-default-rtdb.asia-southeast1.firebasedatabase.app/'
        })
        logger.info("Firebase initialized successfully")
    except Exception as e:
        logger.error(f"Failed to initialize Firebase: {e}")
        raise

def update_user_location(user_id: str, latitude: float, longitude: float) -> bool:
    """
    Updates the user's location in Firebase Realtime Database.
    
    Args:
        user_id (str): Unique ID of the user (e.g. email, UID, username)
        latitude (float): Current latitude
        longitude (float): Current longitude
        
    Returns:
        bool: True if successful, False otherwise
    """
    try:
        ref = db.reference(f'/locations/{user_id}')
        ref.set({
            'latitude': latitude,
            'longitude': longitude,
            'timestamp': datetime.now().isoformat()
        })
        logger.info(f"Updated location for user {user_id}: ({latitude}, {longitude})")
        return True
    except Exception as e:
        logger.error(f"Failed to update location for user {user_id}: {e}")
        return False

def get_user_location(user_id: str) -> Optional[Dict]:
    """
    Retrieves the user's current location from Firebase.
    
    Args:
        user_id (str): Unique ID of the user
        
    Returns:
        dict: Location data with latitude, longitude, and timestamp
        None: If user not found or error occurred
    """
    try:
        ref = db.reference(f'/locations/{user_id}')
        location_data = ref.get()
        
        if location_data:
            logger.info(f"Retrieved location for user {user_id}")
            return location_data
        else:
            logger.warning(f"No location data found for user {user_id}")
            return None
            
    except Exception as e:
        logger.error(f"Failed to get location for user {user_id}: {e}")
        return None

def get_nearby_users(user_id: str, radius_km: float = 5.0) -> List[Dict]:
    """
    Get users within a certain radius of the given user.
    Note: This is a simple implementation. For production, consider using 
    Firebase Functions or a more sophisticated geospatial query.
    
    Args:
        user_id (str): The reference user ID
        radius_km (float): Search radius in kilometers
        
    Returns:
        List[Dict]: List of nearby users with their locations
    """
    try:
        # Get the reference user's location
        user_location = get_user_location(user_id)
        if not user_location:
            return []
        
        user_lat = user_location['latitude']
        user_lon = user_location['longitude']
        
        # Get all locations
        ref = db.reference('/locations')
        all_locations = ref.get() or {}
        
        nearby_users = []
        
        for uid, location_data in all_locations.items():
            if uid == user_id:  # Skip self
                continue
                
            if 'latitude' in location_data and 'longitude' in location_data:
                distance = calculate_distance(
                    user_lat, user_lon,
                    location_data['latitude'], location_data['longitude']
                )
                
                if distance <= radius_km:
                    nearby_users.append({
                        'user_id': uid,
                        'latitude': location_data['latitude'],
                        'longitude': location_data['longitude'],
                        'distance_km': round(distance, 2),
                        'timestamp': location_data.get('timestamp')
                    })
        
        # Sort by distance
        nearby_users.sort(key=lambda x: x['distance_km'])
        logger.info(f"Found {len(nearby_users)} nearby users for {user_id}")
        
        return nearby_users
        
    except Exception as e:
        logger.error(f"Failed to get nearby users for {user_id}: {e}")
        return []

def calculate_distance(lat1: float, lon1: float, lat2: float, lon2: float) -> float:
    """
    Calculate the great circle distance between two points on Earth.
    
    Args:
        lat1, lon1: Latitude and longitude of first point
        lat2, lon2: Latitude and longitude of second point
        
    Returns:
        float: Distance in kilometers
    """
    import math
    
    # Convert latitude and longitude from degrees to radians
    lat1, lon1, lat2, lon2 = map(math.radians, [lat1, lon1, lat2, lon2])
    
    # Haversine formula
    dlat = lat2 - lat1
    dlon = lon2 - lon1
    a = math.sin(dlat/2)**2 + math.cos(lat1) * math.cos(lat2) * math.sin(dlon/2)**2
    c = 2 * math.asin(math.sqrt(a))
    
    # Radius of Earth in kilometers
    r = 6371
    
    return c * r

def delete_user_location(user_id: str) -> bool:
    """
    Deletes a user's location data from Firebase.
    
    Args:
        user_id (str): Unique ID of the user
        
    Returns:
        bool: True if successful, False otherwise
    """
    try:
        ref = db.reference(f'/locations/{user_id}')
        ref.delete()
        logger.info(f"Deleted location data for user {user_id}")
        return True
    except Exception as e:
        logger.error(f"Failed to delete location for user {user_id}: {e}")
        return False

def get_all_locations() -> Dict:
    """
    Retrieves all user locations from Firebase.
    
    Returns:
        dict: All location data
    """
    try:
        ref = db.reference('/locations')
        locations = ref.get() or {}
        logger.info(f"Retrieved {len(locations)} user locations")
        return locations
    except Exception as e:
        logger.error(f"Failed to get all locations: {e}")
        return {}