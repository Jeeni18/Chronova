# import json
# import os
# from typing import Dict, List, Any, Optional
# from collections import defaultdict

# class ChronovaRecommendationEngine:
#     """
#     Content-based recommendation system for Chronova app
#     Uses weighted scoring based on user preferences from questionnaire
#     """
    
#     def __init__(self, data_dir: str = "data"):
#         self.data_dir = data_dir
#         self.historical_sites = []
#         self.food_places = []
#         self.services = []
        
#         # Mapping questionnaire responses to data attributes
#         self.interest_type_mapping = {
#             "temples_religious": ["temple", "religious_heritage", "monastery"],
#             "ancient_architecture": ["palace_complex", "ancient_architecture", "palace", "durbar"],
#             "old_towns": ["old_town", "settlement", "heritage_area"],
#             "cultural_museums": ["museum", "gallery", "cultural_center"],
#             "archaeological_ruins": ["archaeological", "monument", "pillar", "ruins"]
#         }
        
#         self.food_type_mapping = {
#             "local_snacks": ["street_food", "snacks", "local_food"],
#             "traditional_meals": ["traditional_meals", "full_course"],
#             "high_end": ["fine_dining", "upscale", "luxury"]
#         }
        
#         self.service_type_mapping = {
#             "homestays": ["homestay", "heritage_hotel", "accommodation"],
#             "traditional_shops": ["handicrafts", "antiques", "traditional_shop"],
#             "guided_tours": ["tour_guide", "storyteller", "guide"]
#         }
        
#         self.region_mapping = {
#             "kathmandu_valley": ["Kathmandu Valley", "Kathmandu", "Patan", "Bhaktapur"],
#             "lumbini": ["Lumbini", "Kapilvastu"],
#             "gorkha_bandipur": ["Gorkha", "Bandipur", "Palpa"],
#             "janakpur": ["Janakpur", "Mithila"]
#         }
        
#         self.load_data()
    
#     def load_data(self):
#         """Load data from JSON files"""
#         try:
#             # Load historical sites
#             with open(os.path.join(self.data_dir, "historical_sites.json"), 'r', encoding='utf-8') as f:
#                 self.historical_sites = json.load(f)
            
#             # Load food places
#             with open(os.path.join(self.data_dir, "food_places.json"), 'r', encoding='utf-8') as f:
#                 self.food_places = json.load(f)
            
#             # Load services
#             with open(os.path.join(self.data_dir, "services.json"), 'r', encoding='utf-8') as f:
#                 self.services = json.load(f)
                
#             print(f"Loaded {len(self.historical_sites)} sites, {len(self.food_places)} food places, {len(self.services)} services")
            
#         except FileNotFoundError as e:
#             print(f"Data file not found: {e}")
#         except json.JSONDecodeError as e:
#             print(f"Error parsing JSON: {e}")
    
#     def calculate_site_score(self, site: Dict, user_preferences: Dict) -> float:
#         """Calculate relevance score for a historical site"""
#         score = 0.0
#         max_score = 0.0
        
#         # Interest type matching (40% weight)
#         interest_weight = 0.4
#         max_score += interest_weight
        
#         interest_type = user_preferences.get('interest_type')
#         if interest_type and interest_type in self.interest_type_mapping:
#             keywords = self.interest_type_mapping[interest_type]
#             site_text = f"{site.get('site_type', '')} {site.get('description', '')} {site.get('name', '')}".lower()
            
#             for keyword in keywords:
#                 if keyword.lower() in site_text:
#                     score += interest_weight
#                     break
        
#         # Region preference matching (30% weight)
#         region_weight = 0.3
#         max_score += region_weight
        
#         location_pref = user_preferences.get('location_preference')
#         if location_pref and location_pref in self.region_mapping:
#             preferred_regions = self.region_mapping[location_pref]
#             site_region = site.get('region', '')
#             site_location = site.get('location', '')
            
#             if any(region.lower() in site_region.lower() or region.lower() in site_location.lower() 
#                    for region in preferred_regions):
#                 score += region_weight
        
#         # UNESCO status bonus (20% weight)
#         unesco_weight = 0.2
#         max_score += unesco_weight
        
#         if site.get('unesco_status', False):
#             score += unesco_weight
        
#         # Accessibility bonus (10% weight)
#         access_weight = 0.1
#         max_score += access_weight
        
#         if site.get('visiting_hours') and site.get('entry_fee'):
#             score += access_weight
        
#         return score / max_score if max_score > 0 else 0
    
#     def calculate_food_score(self, food_place: Dict, user_preferences: Dict) -> float:
#         """Calculate relevance score for a food place"""
#         score = 0.0
#         max_score = 0.0
        
#         # Dietary preference matching (40% weight)
#         dietary_weight = 0.4
#         max_score += dietary_weight
        
#         user_diet = user_preferences.get('dietary_preference')
#         place_diets = food_place.get('dietary_options', [])
        
#         if user_diet in place_diets:
#             score += dietary_weight
        
#         # Food type matching (35% weight)
#         food_type_weight = 0.35
#         max_score += food_type_weight
        
#         food_type = user_preferences.get('food_type')
#         if food_type and food_type in self.food_type_mapping:
#             keywords = self.food_type_mapping[food_type]
#             place_food_type = food_place.get('food_type', '').lower()
            
#             for keyword in keywords:
#                 if keyword.lower() in place_food_type:
#                     score += food_type_weight
#                     break
        
#         # Region preference matching (15% weight)
#         region_weight = 0.15
#         max_score += region_weight
        
#         location_pref = user_preferences.get('location_preference')
#         if location_pref and location_pref in self.region_mapping:
#             preferred_regions = self.region_mapping[location_pref]
#             place_location = food_place.get('location', '')
            
#             if any(region.lower() in place_location.lower() for region in preferred_regions):
#                 score += region_weight
        
#         # Rating bonus (10% weight)
#         rating_weight = 0.1
#         max_score += rating_weight
        
#         rating = food_place.get('rating', 0)
#         if rating >= 4.0:
#             score += rating_weight
#         elif rating >= 3.5:
#             score += rating_weight * 0.7
#         elif rating >= 3.0:
#             score += rating_weight * 0.4
        
#         return score / max_score if max_score > 0 else 0
    
#     def calculate_service_score(self, service: Dict, user_preferences: Dict) -> float:
#         """Calculate relevance score for a service"""
#         score = 0.0
#         max_score = 0.0
        
#         # Service interest matching (50% weight)
#         service_weight = 0.5
#         max_score += service_weight
        
#         b2b_interests = user_preferences.get('b2b_interest', [])
#         if not isinstance(b2b_interests, list):
#             b2b_interests = [b2b_interests] if b2b_interests else []
        
#         service_type = service.get('service_type', '').lower()
#         service_desc = service.get('description', '').lower()
        
#         for interest in b2b_interests:
#             if interest in self.service_type_mapping:
#                 keywords = self.service_type_mapping[interest]
#                 for keyword in keywords:
#                     if keyword.lower() in service_type or keyword.lower() in service_desc:
#                         score += service_weight
#                         break
#                 if score > 0:
#                     break
        
#         # Region preference matching (30% weight)
#         region_weight = 0.3
#         max_score += region_weight
        
#         location_pref = user_preferences.get('location_preference')
#         if location_pref and location_pref in self.region_mapping:
#             preferred_regions = self.region_mapping[location_pref]
#             service_location = service.get('location', '')
            
#             if any(region.lower() in service_location.lower() for region in preferred_regions):
#                 score += region_weight
        
#         # Specialties bonus (20% weight)
#         specialty_weight = 0.2
#         max_score += specialty_weight
        
#         if service.get('specialties') and len(service.get('specialties', [])) > 0:
#             score += specialty_weight
        
#         return score / max_score if max_score > 0 else 0
    
#     def get_recommendations(self, user_preferences: Dict, limit: int = 5) -> Dict[str, List[Dict]]:
#         """
#         Generate personalized recommendations based on user preferences
        
#         Args:
#             user_preferences: Dictionary containing user's questionnaire responses
#             limit: Maximum number of recommendations per category
            
#         Returns:
#             Dictionary with recommended sites, food places, and services
#         """
#         recommendations = {
#             'historical_sites': [],
#             'food_places': [],
#             'services': []
#         }
        
#         # Score and sort historical sites
#         site_scores = []
#         for site in self.historical_sites:
#             score = self.calculate_site_score(site, user_preferences)
#             site_scores.append((site, score))
        
#         site_scores.sort(key=lambda x: x[1], reverse=True)
#         recommendations['historical_sites'] = []
#         for site, score in site_scores[:limit]:
#             ordered_site = {'name': site['name']}
#             ordered_site.update({k: v for k, v in site.items() if k != 'name'})
#             ordered_site['relevance_score'] = round(score, 3)
#             recommendations['historical_sites'].append(ordered_site)
        
#         # Score and sort food places
#         food_scores = []
#         for food_place in self.food_places:
#             score = self.calculate_food_score(food_place, user_preferences)
#             food_scores.append((food_place, score))
        
#         food_scores.sort(key=lambda x: x[1], reverse=True)
#         recommendations['food_places'] = []
#         for place, score in food_scores[:limit]:
#             ordered_place = {'name': place['name']}
#             # Add all fields except name and contact_info
#             for k, v in place.items():
#                 if k not in ['name', 'contact_info']:
#                     ordered_place[k] = v
#             ordered_place['relevance_score'] = round(score, 3)
#             # Add contact_info last if it exists
#             if 'contact_info' in place:
#                 ordered_place['contact_info'] = place['contact_info']
#             recommendations['food_places'].append(ordered_place)
        
#         # Score and sort services (only if user is interested in B2B services)
#         if user_preferences.get('b2b_interest') and user_preferences['b2b_interest'] != 'none':
#             service_scores = []
#             for service in self.services:
#                 score = self.calculate_service_score(service, user_preferences)
#                 service_scores.append((service, score))
            
#             service_scores.sort(key=lambda x: x[1], reverse=True)
#             recommendations['services'] = []
#             for service, score in service_scores[:limit]:
#                 ordered_service = {'name': service['name']}
#                 # Add all fields except name and contact_info
#                 for k, v in service.items():
#                     if k not in ['name', 'contact_info']:
#                         ordered_service[k] = v
#                 ordered_service['relevance_score'] = round(score, 3)
#                 # Add contact_info last if it exists
#                 if 'contact_info' in service:
#                     ordered_service['contact_info'] = service['contact_info']
#                 recommendations['services'].append(ordered_service)
        
#         return recommendations
    
#     def get_itinerary_suggestions(self, user_preferences: Dict, days: int = 1) -> List[Dict]:
#         """
#         Generate day-wise itinerary suggestions
        
#         Args:
#             user_preferences: User's questionnaire responses
#             days: Number of days for the itinerary
            
#         Returns:
#             List of daily itineraries with sites, food, and activities
#         """
#         recommendations = self.get_recommendations(user_preferences, limit=10)
        
#         itinerary = []
#         sites_per_day = max(2, len(recommendations['historical_sites']) // days)
        
#         for day in range(days):
#             start_idx = day * sites_per_day
#             end_idx = min(start_idx + sites_per_day, len(recommendations['historical_sites']))
            
#             daily_plan = {
#                 'day': day + 1,
#                 'sites': recommendations['historical_sites'][start_idx:end_idx],
#                 'recommended_food': recommendations['food_places'][:2],
#                 'services': recommendations['services'][:1] if recommendations['services'] else []
#             }
            
#             itinerary.append(daily_plan)
        
#         return itinerary



import json
import os
from typing import Dict, List, Any, Optional
from collections import defaultdict

class ChronovaRecommendationEngine:
    """
    Content-based recommendation system for Chronova app
    Uses weighted scoring based on user preferences from questionnaire
    """
    
    def __init__(self, data_dir: str = "data"):
        self.data_dir = data_dir
        self.historical_sites = []
        self.food_places = []
        self.services = []
        
        # Mapping questionnaire responses to data attributes
        self.interest_type_mapping = {
            "temples_religious": ["temple", "religious_heritage", "monastery"],
            "ancient_architecture": ["palace_complex", "ancient_architecture", "palace", "durbar"],
            "old_towns": ["old_town", "settlement", "heritage_area"],
            "cultural_museums": ["museum", "gallery", "cultural_center"],
            "archaeological_ruins": ["archaeological", "monument", "pillar", "ruins"]
        }
        
        self.food_type_mapping = {
            "local_snacks": ["street_food", "snacks", "local_food"],
            "traditional_meals": ["traditional_meals", "full_course"],
            "high_end": ["fine_dining", "upscale", "luxury"]
        }
        
        self.service_type_mapping = {
            "homestays": ["homestay", "heritage_hotel", "accommodation"],
            "traditional_shops": ["handicrafts", "antiques", "traditional_shop"],
            "guided_tours": ["tour_guide", "storyteller", "guide"]
        }
        
        self.region_mapping = {
            "kathmandu_valley": ["Kathmandu Valley", "Kathmandu", "Patan", "Bhaktapur"],
            "lumbini": ["Lumbini", "Kapilvastu"],
            "gorkha_bandipur": ["Gorkha", "Bandipur", "Palpa"],
            "janakpur": ["Janakpur", "Mithila"]
        }
        
        self.load_data()
    
    def load_data(self):
        """Load data from JSON files"""
        try:
            # Load historical sites
            with open(os.path.join(self.data_dir, "historical_sites.json"), 'r', encoding='utf-8') as f:
                self.historical_sites = json.load(f)
            
            # Load food places
            with open(os.path.join(self.data_dir, "food_places.json"), 'r', encoding='utf-8') as f:
                self.food_places = json.load(f)
            
            # Load services
            with open(os.path.join(self.data_dir, "services.json"), 'r', encoding='utf-8') as f:
                self.services = json.load(f)
                
            print(f"Loaded {len(self.historical_sites)} sites, {len(self.food_places)} food places, {len(self.services)} services")
            
        except FileNotFoundError as e:
            print(f"Data file not found: {e}")
        except json.JSONDecodeError as e:
            print(f"Error parsing JSON: {e}")
    
    def format_images(self, images_data):
        """
        Format images data for frontend consumption
        
        Args:
            images_data: Can be a list of URLs, a single URL string, or None
            
        Returns:
            List of image URLs or ["No image found"] if none available
        """
        if not images_data:
            return ["No image found"]
        
        if isinstance(images_data, str):
            return [images_data]
        
        if isinstance(images_data, list) and len(images_data) > 0:
            # Filter out any empty strings or None values
            valid_images = [img for img in images_data if img and isinstance(img, str)]
            return valid_images if valid_images else ["No image found"]
        
        return ["No image found"]
    
    def format_coordinates(self, coordinates_data):
        """
        Format coordinates data for frontend consumption
        
        Args:
            coordinates_data: Dictionary with latitude and longitude or None
            
        Returns:
            Dictionary with latitude and longitude or None if not available
        """
        if not coordinates_data:
            return None
        
        if isinstance(coordinates_data, dict):
            lat = coordinates_data.get('latitude')
            lng = coordinates_data.get('longitude')
            
            if lat is not None and lng is not None:
                return {
                    "latitude": float(lat),
                    "longitude": float(lng)
                }
        
        return None
    
    def calculate_site_score(self, site: Dict, user_preferences: Dict) -> float:
        """Calculate relevance score for a historical site"""
        score = 0.0
        max_score = 0.0
        
        # Interest type matching (40% weight)
        interest_weight = 0.4
        max_score += interest_weight
        
        interest_type = user_preferences.get('interest_type')
        if interest_type and interest_type in self.interest_type_mapping:
            keywords = self.interest_type_mapping[interest_type]
            site_text = f"{site.get('site_type', '')} {site.get('description', '')} {site.get('name', '')}".lower()
            
            for keyword in keywords:
                if keyword.lower() in site_text:
                    score += interest_weight
                    break
        
        # Region preference matching (30% weight)
        region_weight = 0.3
        max_score += region_weight
        
        location_pref = user_preferences.get('location_preference')
        if location_pref and location_pref in self.region_mapping:
            preferred_regions = self.region_mapping[location_pref]
            site_region = site.get('region', '')
            site_location = site.get('location', '')
            
            if any(region.lower() in site_region.lower() or region.lower() in site_location.lower() 
                   for region in preferred_regions):
                score += region_weight
        
        # UNESCO status bonus (20% weight)
        unesco_weight = 0.2
        max_score += unesco_weight
        
        if site.get('unesco_status', False):
            score += unesco_weight
        
        # Accessibility bonus (10% weight)
        access_weight = 0.1
        max_score += access_weight
        
        if site.get('visiting_hours') and site.get('entry_fee'):
            score += access_weight
        
        return score / max_score if max_score > 0 else 0
    
    def calculate_food_score(self, food_place: Dict, user_preferences: Dict) -> float:
        """Calculate relevance score for a food place"""
        score = 0.0
        max_score = 0.0
        
        # Dietary preference matching (40% weight)
        dietary_weight = 0.4
        max_score += dietary_weight
        
        user_diet = user_preferences.get('dietary_preference')
        place_diets = food_place.get('dietary_options', [])
        
        if user_diet in place_diets:
            score += dietary_weight
        
        # Food type matching (35% weight)
        food_type_weight = 0.35
        max_score += food_type_weight
        
        food_type = user_preferences.get('food_type')
        if food_type and food_type in self.food_type_mapping:
            keywords = self.food_type_mapping[food_type]
            place_food_type = food_place.get('food_type', '').lower()
            
            for keyword in keywords:
                if keyword.lower() in place_food_type:
                    score += food_type_weight
                    break
        
        # Region preference matching (15% weight)
        region_weight = 0.15
        max_score += region_weight
        
        location_pref = user_preferences.get('location_preference')
        if location_pref and location_pref in self.region_mapping:
            preferred_regions = self.region_mapping[location_pref]
            place_location = food_place.get('location', '')
            
            if any(region.lower() in place_location.lower() for region in preferred_regions):
                score += region_weight
        
        # Rating bonus (10% weight)
        rating_weight = 0.1
        max_score += rating_weight
        
        rating = food_place.get('rating', 0)
        if rating >= 4.0:
            score += rating_weight
        elif rating >= 3.5:
            score += rating_weight * 0.7
        elif rating >= 3.0:
            score += rating_weight * 0.4
        
        return score / max_score if max_score > 0 else 0
    
    def calculate_service_score(self, service: Dict, user_preferences: Dict) -> float:
        """Calculate relevance score for a service"""
        score = 0.0
        max_score = 0.0
        
        # Service interest matching (50% weight)
        service_weight = 0.5
        max_score += service_weight
        
        b2b_interests = user_preferences.get('b2b_interest', [])
        if not isinstance(b2b_interests, list):
            b2b_interests = [b2b_interests] if b2b_interests else []
        
        service_type = service.get('service_type', '').lower()
        service_desc = service.get('description', '').lower()
        
        for interest in b2b_interests:
            if interest in self.service_type_mapping:
                keywords = self.service_type_mapping[interest]
                for keyword in keywords:
                    if keyword.lower() in service_type or keyword.lower() in service_desc:
                        score += service_weight
                        break
                if score > 0:
                    break
        
        # Region preference matching (30% weight)
        region_weight = 0.3
        max_score += region_weight
        
        location_pref = user_preferences.get('location_preference')
        if location_pref and location_pref in self.region_mapping:
            preferred_regions = self.region_mapping[location_pref]
            service_location = service.get('location', '')
            
            if any(region.lower() in service_location.lower() for region in preferred_regions):
                score += region_weight
        
        # Specialties bonus (20% weight)
        specialty_weight = 0.2
        max_score += specialty_weight
        
        if service.get('specialties') and len(service.get('specialties', [])) > 0:
            score += specialty_weight
        
        return score / max_score if max_score > 0 else 0
    
    def get_recommendations(self, user_preferences: Dict, limit: int = 5) -> Dict[str, List[Dict]]:
        """
        Generate personalized recommendations based on user preferences
        
        Args:
            user_preferences: Dictionary containing user's questionnaire responses
            limit: Maximum number of recommendations per category
            
        Returns:
            Dictionary with recommended sites, food places, and services including images and coordinates
        """
        recommendations = {
            'historical_sites': [],
            'food_places': [],
            'services': []
        }
        
        # Score and sort historical sites
        site_scores = []
        for site in self.historical_sites:
            score = self.calculate_site_score(site, user_preferences)
            site_scores.append((site, score))
        
        site_scores.sort(key=lambda x: x[1], reverse=True)
        recommendations['historical_sites'] = []
        for site, score in site_scores[:limit]:
            ordered_site = {'name': site['name']}
            
            # Add all fields except name, images, and coordinates first
            for k, v in site.items():
                if k not in ['name', 'images', 'coordinates']:
                    ordered_site[k] = v
            
            # Add relevance score
            ordered_site['relevance_score'] = round(score, 3)
            
            # Format and add images
            ordered_site['images'] = self.format_images(site.get('images'))
            
            # Format and add coordinates for map integration
            coordinates = self.format_coordinates(site.get('coordinates'))
            if coordinates:
                ordered_site['coordinates'] = coordinates
                ordered_site['map_data'] = {
                    "can_show_on_map": True,
                    "latitude": coordinates['latitude'],
                    "longitude": coordinates['longitude'],
                    "location_name": site['name']
                }
            else:
                ordered_site['coordinates'] = None
                ordered_site['map_data'] = {
                    "can_show_on_map": False,
                    "message": "Location coordinates not available"
                }
            
            recommendations['historical_sites'].append(ordered_site)
        
        # Score and sort food places
        food_scores = []
        for food_place in self.food_places:
            score = self.calculate_food_score(food_place, user_preferences)
            food_scores.append((food_place, score))
        
        food_scores.sort(key=lambda x: x[1], reverse=True)
        recommendations['food_places'] = []
        for place, score in food_scores[:limit]:
            ordered_place = {'name': place['name']}
            
            # Add all fields except name, contact_info, images, and coordinates
            for k, v in place.items():
                if k not in ['name', 'contact_info', 'images', 'coordinates']:
                    ordered_place[k] = v
            
            # Add relevance score
            ordered_place['relevance_score'] = round(score, 3)
            
            # Format and add images
            ordered_place['images'] = self.format_images(place.get('images'))
            
            # Format and add coordinates for map integration
            coordinates = self.format_coordinates(place.get('coordinates'))
            if coordinates:
                ordered_place['coordinates'] = coordinates
                ordered_place['map_data'] = {
                    "can_show_on_map": True,
                    "latitude": coordinates['latitude'],
                    "longitude": coordinates['longitude'],
                    "location_name": place['name']
                }
            else:
                ordered_place['coordinates'] = None
                ordered_place['map_data'] = {
                    "can_show_on_map": False,
                    "message": "Location coordinates not available"
                }
            
            # Add contact_info last if it exists
            if 'contact_info' in place:
                ordered_place['contact_info'] = place['contact_info']
            
            recommendations['food_places'].append(ordered_place)
        
        # Score and sort services (only if user is interested in B2B services)
        if user_preferences.get('b2b_interest') and user_preferences['b2b_interest'] != 'none':
            service_scores = []
            for service in self.services:
                score = self.calculate_service_score(service, user_preferences)
                service_scores.append((service, score))
            
            service_scores.sort(key=lambda x: x[1], reverse=True)
            recommendations['services'] = []
            for service, score in service_scores[:limit]:
                ordered_service = {'name': service['name']}
                
                # Add all fields except name, contact_info, images, and coordinates
                for k, v in service.items():
                    if k not in ['name', 'contact_info', 'images', 'coordinates']:
                        ordered_service[k] = v
                
                # Add relevance score
                ordered_service['relevance_score'] = round(score, 3)
                
                # Format and add images
                ordered_service['images'] = self.format_images(service.get('images'))
                
                # Format and add coordinates for map integration
                coordinates = self.format_coordinates(service.get('coordinates'))
                if coordinates:
                    ordered_service['coordinates'] = coordinates
                    ordered_service['map_data'] = {
                        "can_show_on_map": True,
                        "latitude": coordinates['latitude'],
                        "longitude": coordinates['longitude'],
                        "location_name": service['name']
                    }
                else:
                    ordered_service['coordinates'] = None
                    ordered_service['map_data'] = {
                        "can_show_on_map": False,
                        "message": "Location coordinates not available"
                    }
                
                # Add contact_info last if it exists
                if 'contact_info' in service:
                    ordered_service['contact_info'] = service['contact_info']
                
                recommendations['services'].append(ordered_service)
        
        return recommendations
    
    def get_itinerary_suggestions(self, user_preferences: Dict, days: int = 1) -> List[Dict]:
        """
        Generate day-wise itinerary suggestions with images and coordinates
        
        Args:
            user_preferences: User's questionnaire responses
            days: Number of days for the itinerary
            
        Returns:
            List of daily itineraries with sites, food, and activities including map data
        """
        recommendations = self.get_recommendations(user_preferences, limit=10)
        
        itinerary = []
        sites_per_day = max(2, len(recommendations['historical_sites']) // days)
        
        for day in range(days):
            start_idx = day * sites_per_day
            end_idx = min(start_idx + sites_per_day, len(recommendations['historical_sites']))
            
            # Extract map coordinates for the day's locations
            day_coordinates = []
            daily_sites = recommendations['historical_sites'][start_idx:end_idx]
            
            for site in daily_sites:
                if site.get('coordinates'):
                    day_coordinates.append({
                        'name': site['name'],
                        'latitude': site['coordinates']['latitude'],
                        'longitude': site['coordinates']['longitude'],
                        'type': 'historical_site'
                    })
            
            # Add food place coordinates
            for food_place in recommendations['food_places'][:2]:
                if food_place.get('coordinates'):
                    day_coordinates.append({
                        'name': food_place['name'],
                        'latitude': food_place['coordinates']['latitude'],
                        'longitude': food_place['coordinates']['longitude'],
                        'type': 'food_place'
                    })
            
            daily_plan = {
                'day': day + 1,
                'sites': daily_sites,
                'recommended_food': recommendations['food_places'][:2],
                'services': recommendations['services'][:1] if recommendations['services'] else [],
                'map_overview': {
                    'total_locations': len(day_coordinates),
                    'coordinates': day_coordinates,
                    'can_show_route': len(day_coordinates) > 1
                }
            }
            
            itinerary.append(daily_plan)
        
        return itinerary