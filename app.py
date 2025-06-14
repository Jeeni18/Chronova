# from flask import Flask, request, jsonify
# from recommendation import ChronovaRecommendationEngine
# import logging
# import json
# from flask_cors import CORS  # ← Step 1: Import CORS
# import requests
# import re

# import os
# from typing import Dict, List, Optional
# from datetime import datetime

# # Set up logging
# logging.basicConfig(level=logging.DEBUG)
# logger = logging.getLogger(__name__)

# app = Flask(__name__)
# CORS(app)  # ← Step 2: Enable CORS for the entire app

# # Initialize the recommendation engine
# try:
#     engine = ChronovaRecommendationEngine()
#     logger.info("Recommendation engine initialized successfully")
# except Exception as e:
#     logger.error(f"Failed to initialize recommendation engine: {e}")
#     engine = None

# @app.route('/recommendations', methods=['POST'])
# def get_recommendations():
#     try:
#         # Log the incoming request
#         logger.info("Received recommendation request")
#         logger.info(f"Request headers: {dict(request.headers)}")
        
#         # Get user preferences
#         user_preferences = request.json
#         logger.info(f"User preferences: {json.dumps(user_preferences, indent=2)}")
        
#         # Validate that we have preferences
#         if not user_preferences:
#             logger.error("No user preferences received")
#             return jsonify({
#                 'status': 'error',
#                 'message': 'No user preferences provided'
#             }), 400
        
#         # Check if engine is initialized
#         if engine is None:
#             logger.error("Recommendation engine not initialized")
#             return jsonify({
#                 'status': 'error',
#                 'message': 'Recommendation engine not available'
#             }), 500
        
#         # Get recommendations
#         logger.info("Getting recommendations...")
#         recommendations = engine.get_recommendations(user_preferences, limit=5)
#         logger.info(f"Generated recommendations: {json.dumps(recommendations, indent=2)}")
        
#         # Check if we have any recommendations
#         total_recommendations = (len(recommendations.get('historical_sites', [])) + 
#                                len(recommendations.get('food_places', [])) + 
#                                len(recommendations.get('services', [])))
        
#         if total_recommendations == 0:
#             logger.warning("No recommendations generated")
#             return jsonify({
#                 'status': 'success',
#                 'data': recommendations,
#                 'message': 'No recommendations found for your preferences. Try adjusting your criteria.'
#             })
        
#         logger.info(f"Returning {total_recommendations} total recommendations")
#         return jsonify({
#             'status': 'success',
#             'data': recommendations
#         })
        
#     except Exception as e:
#         logger.error(f"Error in get_recommendations: {str(e)}", exc_info=True)
#         return jsonify({
#             'status': 'error',
#             'message': f'Internal server error: {str(e)}'
#         }), 500

# @app.route('/itinerary', methods=['POST'])
# def get_itinerary():
#     try:
#         logger.info("Received itinerary request")
#         data = request.json
#         logger.info(f"Itinerary request data: {json.dumps(data, indent=2)}")
        
#         user_preferences = data.get('preferences', {})
#         days = data.get('days', 1)
        
#         if engine is None:
#             return jsonify({
#                 'status': 'error',
#                 'message': 'Recommendation engine not available'
#             }), 500
        
#         itinerary = engine.get_itinerary_suggestions(user_preferences, days)
#         logger.info(f"Generated itinerary: {json.dumps(itinerary, indent=2)}")
        
#         return jsonify({
#             'status': 'success',
#             'data': itinerary
#         })
        
#     except Exception as e:
#         logger.error(f"Error in get_itinerary: {str(e)}", exc_info=True)
#         return jsonify({
#             'status': 'error',
#             'message': f'Internal server error: {str(e)}'
#         }), 500

# # Add a simple test route to verify server is running
# @app.route('/', methods=['GET'])
# def home():
#     return jsonify({
#         'message': 'Chronova API is running!',
#         'endpoints': ['/recommendations', '/itinerary'],
#         'engine_status': 'initialized' if engine else 'failed'
#     })

# # Add a test route to check data loading
# @app.route('/test-data', methods=['GET'])
# def test_data():
#     if engine is None:
#         return jsonify({
#             'status': 'error',
#             'message': 'Engine not initialized'
#         })
    
#     return jsonify({
#         'historical_sites_count': len(engine.historical_sites),
#         'food_places_count': len(engine.food_places),
#         'services_count': len(engine.services),
#         'sample_site': engine.historical_sites[0] if engine.historical_sites else None,
#         'sample_food': engine.food_places[0] if engine.food_places else None
#     })

# if __name__ == '__main__':
#     app.run(debug=True, host='0.0.0.0', port=5000)



##recommendation + map 
from flask import Flask, request, jsonify
from recommendation import ChronovaRecommendationEngine
import logging
import json
from flask_cors import CORS
import requests
import re

import os
from typing import Dict, List, Optional
from datetime import datetime

# Import Firebase handler
from firebase_handler import(
    update_user_location,
    get_user_location,
    get_nearby_users,
    delete_user_location,
    get_all_locations
)

# Set up logging
logging.basicConfig(level=logging.DEBUG)
logger = logging.getLogger(__name__)

app = Flask(__name__)
CORS(app)  # Enable CORS for the entire app

# Initialize the recommendation engine
try:
    engine = ChronovaRecommendationEngine()
    logger.info("Recommendation engine initialized successfully")
except Exception as e:
    logger.error(f"Failed to initialize recommendation engine: {e}")
    engine = None

# ============= EXISTING RECOMMENDATION ENDPOINTS =============

@app.route('/recommendations', methods=['POST'])
def get_recommendations():
    try:
        # Log the incoming request
        logger.info("Received recommendation request")
        logger.info(f"Request headers: {dict(request.headers)}")
        
        # Get user preferences
        user_preferences = request.json
        logger.info(f"User preferences: {json.dumps(user_preferences, indent=2)}")
        
        # Validate that we have preferences
        if not user_preferences:
            logger.error("No user preferences received")
            return jsonify({
                'status': 'error',
                'message': 'No user preferences provided'
            }), 400
        
        # Check if engine is initialized
        if engine is None:
            logger.error("Recommendation engine not initialized")
            return jsonify({
                'status': 'error',
                'message': 'Recommendation engine not available'
            }), 500
        
        # Get recommendations
        logger.info("Getting recommendations...")
        recommendations = engine.get_recommendations(user_preferences, limit=5)
        logger.info(f"Generated recommendations: {json.dumps(recommendations, indent=2)}")
        
        # Check if we have any recommendations
        total_recommendations = (len(recommendations.get('historical_sites', [])) + 
                               len(recommendations.get('food_places', [])) + 
                               len(recommendations.get('services', [])))
        
        if total_recommendations == 0:
            logger.warning("No recommendations generated")
            return jsonify({
                'status': 'success',
                'data': recommendations,
                'message': 'No recommendations found for your preferences. Try adjusting your criteria.'
            })
        
        logger.info(f"Returning {total_recommendations} total recommendations")
        return jsonify({
            'status': 'success',
            'data': recommendations
        })
        
    except Exception as e:
        logger.error(f"Error in get_recommendations: {str(e)}", exc_info=True)
        return jsonify({
            'status': 'error',
            'message': f'Internal server error: {str(e)}'
        }), 500

@app.route('/itinerary', methods=['POST'])
def get_itinerary():
    try:
        logger.info("Received itinerary request")
        data = request.json
        logger.info(f"Itinerary request data: {json.dumps(data, indent=2)}")
        
        user_preferences = data.get('preferences', {})
        days = data.get('days', 1)
        
        if engine is None:
            return jsonify({
                'status': 'error',
                'message': 'Recommendation engine not available'
            }), 500
        
        itinerary = engine.get_itinerary_suggestions(user_preferences, days)
        logger.info(f"Generated itinerary: {json.dumps(itinerary, indent=2)}")
        
        return jsonify({
            'status': 'success',
            'data': itinerary
        })
        
    except Exception as e:
        logger.error(f"Error in get_itinerary: {str(e)}", exc_info=True)
        return jsonify({
            'status': 'error',
            'message': f'Internal server error: {str(e)}'
        }), 500

# ============= NEW MAP FEATURE ENDPOINTS =============

@app.route('/map/update-location', methods=['POST'])
def update_location():
    """
    Update user's current location on the map
    Expected JSON: {
        "user_id": "user123",
        "latitude": 27.7172,
        "longitude": 85.3240
    }
    """
    try:
        logger.info("Received location update request")
        data = request.json
        
        # Validate required fields
        if not data:
            return jsonify({
                'status': 'error',
                'message': 'No data provided'
            }), 400
        
        user_id = data.get('user_id')
        latitude = data.get('latitude')
        longitude = data.get('longitude')
        
        if not all([user_id, latitude is not None, longitude is not None]):
            return jsonify({
                'status': 'error',
                'message': 'user_id, latitude, and longitude are required'
            }), 400
        
        # Validate coordinate ranges
        if not (-90 <= latitude <= 90):
            return jsonify({
                'status': 'error',
                'message': 'Invalid latitude. Must be between -90 and 90'
            }), 400
        
        if not (-180 <= longitude <= 180):
            return jsonify({
                'status': 'error',
                'message': 'Invalid longitude. Must be between -180 and 180'
            }), 400
        
        # Update location in Firebase
        success = update_user_location(user_id, float(latitude), float(longitude))
        
        if success:
            logger.info(f"Successfully updated location for user {user_id}")
            return jsonify({
                'status': 'success',
                'message': 'Location updated successfully',
                'data': {
                    'user_id': user_id,
                    'latitude': latitude,
                    'longitude': longitude
                }
            })
        else:
            return jsonify({
                'status': 'error',
                'message': 'Failed to update location'
            }), 500
        
    except Exception as e:
        logger.error(f"Error in update_location: {str(e)}", exc_info=True)
        return jsonify({
            'status': 'error',
            'message': f'Internal server error: {str(e)}'
        }), 500

@app.route('/map/get-location/<user_id>', methods=['GET'])
def get_location(user_id):
    """
    Get a specific user's current location
    """
    try:
        logger.info(f"Received location request for user {user_id}")
        
        location_data = get_user_location(user_id)
        
        if location_data:
            return jsonify({
                'status': 'success',
                'data': {
                    'user_id': user_id,
                    'latitude': location_data.get('latitude'),
                    'longitude': location_data.get('longitude'),
                    'timestamp': location_data.get('timestamp')
                }
            })
        else:
            return jsonify({
                'status': 'error',
                'message': 'User location not found'
            }), 404
        
    except Exception as e:
        logger.error(f"Error in get_location: {str(e)}", exc_info=True)
        return jsonify({
            'status': 'error',
            'message': f'Internal server error: {str(e)}'
        }), 500

@app.route('/map/nearby-users', methods=['POST'])
def get_nearby_users_endpoint():
    """
    Get users near a specific user
    Expected JSON: {
        "user_id": "user123",
        "radius_km": 5.0  # optional, defaults to 5km
    }
    """
    try:
        logger.info("Received nearby users request")
        data = request.json
        
        if not data or 'user_id' not in data:
            return jsonify({
                'status': 'error',
                'message': 'user_id is required'
            }), 400
        
        user_id = data['user_id']
        radius_km = data.get('radius_km', 5.0)
        
        # Validate radius
        if radius_km <= 0 or radius_km > 100:
            return jsonify({
                'status': 'error',
                'message': 'radius_km must be between 0 and 100'
            }), 400
        
        nearby_users = get_nearby_users(user_id, radius_km)
        
        return jsonify({
            'status': 'success',
            'data': {
                'user_id': user_id,
                'radius_km': radius_km,
                'nearby_users': nearby_users,
                'count': len(nearby_users)
            }
        })
        
    except Exception as e:
        logger.error(f"Error in get_nearby_users_endpoint: {str(e)}", exc_info=True)
        return jsonify({
            'status': 'error',
            'message': f'Internal server error: {str(e)}'
        }), 500

@app.route('/map/all-locations', methods=['GET'])
def get_all_locations_endpoint():
    """
    Get all user locations (for admin/debugging or showing all users on map)
    """
    try:
        logger.info("Received all locations request")
        
        locations = get_all_locations()
        
        # Format the data for frontend consumption
        formatted_locations = []
        for user_id, location_data in locations.items():
            if 'latitude' in location_data and 'longitude' in location_data:
                formatted_locations.append({
                    'user_id': user_id,
                    'latitude': location_data['latitude'],
                    'longitude': location_data['longitude'],
                    'timestamp': location_data.get('timestamp')
                })
        
        return jsonify({
            'status': 'success',
            'data': {
                'locations': formatted_locations,
                'count': len(formatted_locations)
            }
        })
        
    except Exception as e:
        logger.error(f"Error in get_all_locations_endpoint: {str(e)}", exc_info=True)
        return jsonify({
            'status': 'error',
            'message': f'Internal server error: {str(e)}'
        }), 500

@app.route('/map/delete-location/<user_id>', methods=['DELETE'])
def delete_location(user_id):
    """
    Delete a user's location from the map
    """
    try:
        logger.info(f"Received delete location request for user {user_id}")
        
        success = delete_user_location(user_id)
        
        if success:
            return jsonify({
                'status': 'success',
                'message': f'Location deleted for user {user_id}'
            })
        else:
            return jsonify({
                'status': 'error',
                'message': 'Failed to delete location'
            }), 500
        
    except Exception as e:
        logger.error(f"Error in delete_location: {str(e)}", exc_info=True)
        return jsonify({
            'status': 'error',
            'message': f'Internal server error: {str(e)}'
        }), 500

# ============= EXISTING TEST ENDPOINTS =============

@app.route('/', methods=['GET'])
def home():
    return jsonify({
        'message': 'Chronova API is running!',
        'endpoints': {
            'recommendations': '/recommendations',
            'itinerary': '/itinerary',
            'map': {
                'update_location': '/map/update-location',
                'get_location': '/map/get-location/<user_id>',
                'nearby_users': '/map/nearby-users',
                'all_locations': '/map/all-locations',
                'delete_location': '/map/delete-location/<user_id>'
            }
        },
        'engine_status': 'initialized' if engine else 'failed'
    })

@app.route('/test-data', methods=['GET'])
def test_data():
    if engine is None:
        return jsonify({
            'status': 'error',
            'message': 'Engine not initialized'
        })
    
    return jsonify({
        'historical_sites_count': len(engine.historical_sites),
        'food_places_count': len(engine.food_places),
        'services_count': len(engine.services),
        'sample_site': engine.historical_sites[0] if engine.historical_sites else None,
        'sample_food': engine.food_places[0] if engine.food_places else None
    })

if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0', port=5000)