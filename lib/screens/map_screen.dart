import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:location/location.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  final MapController _mapController = MapController();
  LocationData? _currentLocation;
  final List<LatLng> _routePoints = [];
  final List<Marker> _markers = [];

  final String _orsApiKey = '5b3ce3597851110001cf624822a2c9301433415889356c2c851a3ca3';
  final String _firebaseDbUrl =
      'https://chronova-c675c-default-rtdb.asia-southeast1.firebasedatabase.app/';

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  Future<void> _getCurrentLocation() async {
    final location = Location();

    try {
      final userLocation = await location.getLocation();
      setState(() {
        _currentLocation = userLocation;
        _markers.add(
          Marker(
            width: 80.0,
            height: 80.0,
            point: LatLng(userLocation.latitude!, userLocation.longitude!),
            child: const Icon(Icons.my_location, color: Colors.blue, size: 40.0),
          ),
        );
      });

      location.onLocationChanged.listen((newLoc) {
        setState(() {
          _currentLocation = newLoc;
        });
        _sendLocationToFriend(newLoc.latitude!, newLoc.longitude!);
      });
    } catch (e) {
      setState(() {
        _currentLocation = null;
      });
    }
  }

  Future<void> _sendLocationToFriend(double lat, double lng) async {
    final locationData = {
      'latitude': lat,
      'longitude': lng,
      'timestamp': DateTime.now().toIso8601String(),
    };

    final response = await http.put(
      Uri.parse('$_firebaseDbUrl/users/user123/location.json'),
      body: json.encode(locationData),
    );

    if (response.statusCode == 200) {
      print("📡 Location sent successfully!");
    } else {
      print("❌ Failed to send location: ${response.body}");
    }
  }

  Future<void> _getRoute(LatLng destination) async {
    if (_currentLocation == null) return;

    final start = LatLng(_currentLocation!.latitude!, _currentLocation!.longitude!);
    final url =
        'https://api.openrouteservice.org/v2/directions/driving-car?api_key=$_orsApiKey&start=${start.longitude},${start.latitude}&end=${destination.longitude},${destination.latitude}';

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final coords = data['features'][0]['geometry']['coordinates'] as List<dynamic>;
      setState(() {
        _routePoints.clear();
        _routePoints.addAll(coords.map((c) => LatLng(c[1], c[0])));
      });
    } else {
      print('❌ Failed to fetch route: ${response.statusCode}');
    }
  }

  void _addDestinationMarker(LatLng point) {
    setState(() {
      _markers.add(
        Marker(
          width: 80.0,
          height: 80.0,
          point: point,
          child: const Icon(Icons.location_on, color: Colors.red, size: 40.0),
        ),
      );
    });
    _getRoute(point);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Find Your Way',
          style: TextStyle(
            fontFamily: 'Cinzel',
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFF8B4513),
        elevation: 4,
      ),
      body: _currentLocation == null
          ? const Center(child: CircularProgressIndicator())
          : FlutterMap(
        mapController: _mapController,
        options: MapOptions(
          initialCenter: LatLng(
            _currentLocation!.latitude!,
            _currentLocation!.longitude!,
          ),
          initialZoom: 15.0,
          onTap: (tapPosition, point) => _addDestinationMarker(point),
        ),
        children: [
          TileLayer(
            urlTemplate: 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
            subdomains: const ['a', 'b', 'c'],
          ),
          MarkerLayer(markers: _markers),
          PolylineLayer(
            polylines: [
              Polyline(
                points: _routePoints,
                strokeWidth: 4.0,
                color: Colors.blue,
              ),
            ],
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFF8B4513),
        onPressed: () {
          if (_currentLocation != null) {
            _mapController.move(
              LatLng(_currentLocation!.latitude!, _currentLocation!.longitude!),
              15.0,
            );
          }
        },
        child: const Icon(Icons.my_location, color: Colors.white),
      ),
    );
  }
}
