#app.py
from flask import Flask, request, jsonify
from recommendation import ChronovaRecommendationEngine

app = Flask(__name__)

# Initialize the recommendation engine
engine = ChronovaRecommendationEngine()

@app.route('/recommendations', methods=['POST'])
def get_recommendations():
    try:
        user_preferences = request.json
        recommendations = engine.get_recommendations(user_preferences, limit=5)
        return jsonify({
            'status': 'success',
            'data': recommendations
        })
    except Exception as e:
        return jsonify({
            'status': 'error',
            'message': str(e)
        }), 400

@app.route('/itinerary', methods=['POST'])
def get_itinerary():
    try:
        data = request.json
        user_preferences = data.get('preferences', {})
        days = data.get('days', 1)
        
        itinerary = engine.get_itinerary_suggestions(user_preferences, days)
        return jsonify({
            'status': 'success',
            'data': itinerary
        })
    except Exception as e:
        return jsonify({
            'status': 'error',
            'message': str(e)
        }), 400

# Add a simple test route to verify server is running
@app.route('/', methods=['GET'])
def home():
    return jsonify({
        'message': 'Chronova API is running!',
        'endpoints': ['/recommendations', '/itinerary']
    })

if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0', port=5000)