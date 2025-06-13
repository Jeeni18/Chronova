// // // // import 'package:flutter/material.dart';
// // // // import 'package:flutter_map/flutter_map.dart';
// // // // import 'package:latlong2/latlong.dart';
// // // //
// // // // class MapScreen extends StatefulWidget {
// // // //   const MapScreen({Key? key}) : super(key: key);
// // // //
// // // //   @override
// // // //   State<MapScreen> createState() => _MapScreenState();
// // // // }
// // // //
// // // // class _MapScreenState extends State<MapScreen> {
// // // //   final MapController mapController = MapController();
// // // //   final LatLng center = LatLng(27.7172, 85.3240); // Kathmandu
// // // //   List<Marker> markers = [];
// // // //
// // // //   void _addMarker() {
// // // //     setState(() {
// // // //       markers.add(
// // // //         Marker(
// // // //           point: center,
// // // //           child: const Icon(
// // // //             Icons.location_pin,
// // // //             color: Colors.red,
// // // //             size: 40,
// // // //           ),
// // // //         ),
// // // //       );
// // // //     });
// // // //   }
// // // //
// // // //   @override
// // // //   Widget build(BuildContext context) {
// // // //     return Scaffold(
// // // //       appBar: AppBar(
// // // //         title: const Text('Chronova'),
// // // //         backgroundColor: Colors.brown,
// // // //       ),
// // // //       body: FlutterMap(
// // // //         mapController: mapController,
// // // //         options: MapOptions(
// // // //           initialCenter: center,
// // // //           initialZoom: 14.0,
// // // //         ),
// // // //         children: [
// // // //           TileLayer(
// // // //             urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
// // // //             userAgentPackageName: 'com.example.app',
// // // //           ),
// // // //           MarkerLayer(markers: markers),
// // // //         ],
// // // //       ),
// // // //       floatingActionButton: FloatingActionButton(
// // // //         onPressed: _addMarker,
// // // //         backgroundColor: Colors.white,
// // // //         child: const Icon(Icons.add_location),
// // // //       ),
// // // //     );
// // // //   }
// // // // }
// // //
// // // import 'package:flutter/material.dart';
// // // import 'package:flutter_map/flutter_map.dart';
// // // import 'package:latlong2/latlong.dart';
// // //
// // // class MapScreen extends StatefulWidget {
// // //   const MapScreen({Key? key}) : super(key: key);
// // //
// // //   @override
// // //   State<MapScreen> createState() => _MapScreenState();
// // // }
// // //
// // // class _MapScreenState extends State<MapScreen> {
// // //   final MapController mapController = MapController();
// // //   final LatLng center = LatLng(27.7172, 85.3240); // Kathmandu
// // //   List<Marker> markers = [];
// // //
// // //   void _addMarker() {
// // //     setState(() {
// // //       markers.add(
// // //         Marker(
// // //           point: center,
// // //           child: const Icon(
// // //             Icons.location_pin,
// // //             color: Colors.red,
// // //             size: 40,
// // //           ),
// // //         ),
// // //       );
// // //     });
// // //   }
// // //
// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return Scaffold(
// // //       appBar: AppBar(
// // //         title: const Text('Chronova'),
// // //         backgroundColor: Colors.brown,
// // //       ),
// // //       body: FlutterMap(
// // //         mapController: mapController,
// // //         options: MapOptions(
// // //           initialCenter: center,
// // //           initialZoom: 14.0,
// // //         ),
// // //         children: [
// // //           TileLayer(
// // //             urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
// // //             userAgentPackageName: 'com.example.app',
// // //           ),
// // //           MarkerLayer(markers: markers),
// // //         ],
// // //       ),
// // //       floatingActionButton: FloatingActionButton(
// // //         onPressed: _addMarker,
// // //         backgroundColor: Colors.white,
// // //         child: const Icon(Icons.add_location),
// // //       ),
// // //     );
// // //   }
// // // }
// // //
// // // import 'package:flutter/material.dart';
// // // import 'package:flutter_map/flutter_map.dart';
// // // import 'package:latlong2/latlong.dart';
// // //
// // // class MapScreen extends StatefulWidget {
// // //   const MapScreen({Key? key}) : super(key: key);
// // //
// // //   @override
// // //   State<MapScreen> createState() => _MapScreenState();
// // // }
// // //
// // // class _MapScreenState extends State<MapScreen> {
// // //   final MapController mapController = MapController();
// // //   final LatLng center = LatLng(27.7172, 85.3240); // Kathmandu
// // //   List<Marker> markers = [];
// // //
// // //   void _addMarker() {
// // //     setState(() {
// // //       markers.add(
// // //         Marker(
// // //           point: center,
// // //           child: const Icon(
// // //             Icons.location_pin,
// // //             color: Colors.red,
// // //             size: 40,
// // //           ),
// // //         ),
// // //       );
// // //     });
// // //   }
// // //
// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return Scaffold(
// // //       appBar: AppBar(
// // //         title: const Text('Simple Map'),
// // //         backgroundColor: Colors.blue,
// // //       ),
// // //       body: FlutterMap(
// // //         mapController: mapController,
// // //         options: MapOptions(
// // //           initialCenter: center,
// // //           initialZoom: 14.0,
// // //         ),
// // //         children: [
// // //           TileLayer(
// // //             urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
// // //             userAgentPackageName: 'com.example.app',
// // //           ),
// // //           MarkerLayer(markers: markers),
// // //         ],
// // //       ),
// // //       floatingActionButton: FloatingActionButton(
// // //         onPressed: _addMarker,
// // //         backgroundColor: Colors.blue,
// // //         child: const Icon(Icons.add_location),
// // //       ),
// // //     );
// // //   }
// // // }
// // //
// // // import 'package:flutter/material.dart';
// // // import 'package:flutter_map/flutter_map.dart';
// // // import 'package:latlong2/latlong.dart';
// // //
// // // class MapScreen extends StatefulWidget {
// // //   const MapScreen({Key? key}) : super(key: key);
// // //
// // //   @override
// // //   State<MapScreen> createState() => _MapScreenState();
// // // }
// // //
// // // class _MapScreenState extends State<MapScreen> {
// // //   final MapController mapController = MapController();
// // //   final LatLng center = LatLng(27.7172, 85.3240); // Kathmandu
// // //   List<Marker> markers = [];
// // //
// // //   void _addMarker() {
// // //     setState(() {
// // //       markers.add(
// // //         Marker(
// // //           point: center,
// // //           child: const Icon(
// // //             Icons.location_pin,
// // //             color: Colors.red,
// // //             size: 40,
// // //           ),
// // //         ),
// // //       );
// // //     });
// // //   }
// // //
// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return Scaffold(
// // //       appBar: AppBar(
// // //         title: const Text('Simple Map'),
// // //         backgroundColor: Colors.blue,
// // //       ),
// // //       body: FlutterMap(
// // //         mapController: mapController,
// // //         options: MapOptions(
// // //           initialCenter: center,
// // //           initialZoom: 14.0,
// // //         ),
// // //         children: [
// // //           TileLayer(
// // //             urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
// // //             userAgentPackageName: 'com.example.app',
// // //           ),
// // //           MarkerLayer(markers: markers),
// // //         ],
// // //       ),
// // //       floatingActionButton: FloatingActionButton(
// // //         onPressed: _addMarker,
// // //         backgroundColor: Colors.blue,
// // //         child: const Icon(Icons.add_location),
// // //       ),
// // //     );
// // //   }
// // // }
// // //
// // // import 'package:flutter/material.dart';
// // // import 'package:flutter_map/flutter_map.dart';
// // // import 'package:latlong2/latlong.dart';
// // //
// // // class MapScreen extends StatefulWidget {
// // //   const MapScreen({Key? key}) : super(key: key);
// // //
// // //   @override
// // //   State<MapScreen> createState() => _MapScreenState();
// // // }
// // //
// // // class _MapScreenState extends State<MapScreen> {
// // //   final MapController mapController = MapController();
// // //   final LatLng center = LatLng(27.7172, 85.3240); // Kathmandu
// // //   List<Marker> markers = [];
// // //
// // //   void _addMarker() {
// // //     setState(() {
// // //       markers.add(
// // //         Marker(
// // //           point: center,
// // //           child: const Icon(
// // //             Icons.location_pin,
// // //             color: Colors.red,
// // //             size: 40,
// // //           ),
// // //         ),
// // //       );
// // //     });
// // //   }
// // //
// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return Scaffold(
// // //       appBar: AppBar(
// // //         title: const Text('Simple Map'),
// // //         backgroundColor: Colors.blue,
// // //       ),
// // //       body: FlutterMap(
// // //         mapController: mapController,
// // //         options: MapOptions(
// // //           initialCenter: center,
// // //           initialZoom: 14.0,
// // //         ),
// // //         children: [
// // //           TileLayer(
// // //             urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
// // //             userAgentPackageName: 'com.example.app',
// // //           ),
// // //           MarkerLayer(markers: markers),
// // //         ],
// // //       ),
// // //       floatingActionButton: FloatingActionButton(
// // //         onPressed: _addMarker,
// // //         backgroundColor: Colors.blue,
// // //         child: const Icon(Icons.add_location),
// // //       ),
// // //     );
// // //   }
// // // }
// //
// // import 'package:flutter/material.dart';
// // import 'package:flutter_map/flutter_map.dart';
// // import 'package:latlong2/latlong.dart';
// //
// // class MapScreen extends StatefulWidget {
// //   const MapScreen({Key? key}) : super(key: key);
// //
// //   @override
// //   State<MapScreen> createState() => _MapScreenState();
// // }
// //
// // class _MapScreenState extends State<MapScreen> {
// //   final MapController mapController = MapController();
// //   final LatLng center = LatLng(27.7172, 85.3240); // Kathmandu
// //   List<Marker> markers = [];
// //
// //   void _addMarker() {
// //     setState(() {
// //       markers.add(
// //         Marker(
// //           point: center,
// //           width: 60,
// //           height: 60,
// //           child: const Icon(
// //             Icons.location_on,
// //             color: Colors.brown,
// //             size: 40,
// //           ),
// //         ),
// //       );
// //     });
// //   }
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       backgroundColor: const Color(0xFFFDF6EC), // soft beige background
// //       appBar: AppBar(
// //         title: const Text(
// //           'Chronova',
// //           style: TextStyle(
// //             fontFamily: 'Cinzel',
// //             fontSize: 24,
// //             fontWeight: FontWeight.bold,
// //             letterSpacing: 1.2,
// //           ),
// //         ),
// //         centerTitle: true,
// //         backgroundColor: Colors.brown.shade700,
// //         elevation: 4,
// //       ),
// //       body: Padding(
// //         padding: const EdgeInsets.all(8.0),
// //         child: ClipRRect(
// //           borderRadius: BorderRadius.circular(16),
// //           child: FlutterMap(
// //             mapController: mapController,
// //             options: MapOptions(
// //               initialCenter: center,
// //               initialZoom: 14.0,
// //             ),
// //             children: [
// //               TileLayer(
// //                 urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
// //                 userAgentPackageName: 'com.example.app',
// //               ),
// //               MarkerLayer(markers: markers),
// //             ],
// //           ),
// //         ),
// //       ),
// //       floatingActionButton: FloatingActionButton(
// //         onPressed: _addMarker,
// //         backgroundColor: Colors.brown,
// //         child: const Icon(Icons.add_location, color: Colors.white),
// //       ),
// //     );
// //   }
// // }
//
// import 'package:flutter/material.dart';
// import 'package:flutter_map/flutter_map.dart';
// import 'package:latlong2/latlong.dart';
//
// class MapScreen extends StatefulWidget {
//   const MapScreen({Key? key}) : super(key: key);
//
//   @override
//   State<MapScreen> createState() => _MapScreenState();
// }
//
// class _MapScreenState extends State<MapScreen> {
//   final MapController mapController = MapController();
//   final LatLng center = LatLng(27.7172, 85.3240); // Kathmandu
//   List<Marker> markers = [];
//
//   void _addMarker() {
//     setState(() {
//       markers.add(
//         Marker(
//           point: center,
//           width: 60,
//           height: 60,
//           child: const Icon(
//             Icons.location_on,
//             color: Colors.red,
//             size: 40,
//           ),
//         ),
//       );
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xFFFDF6EC), // soft background
//       appBar: AppBar(
//         title: const Text(
//           'Chronova',
//           style: TextStyle(
//             fontFamily: 'Cinzel',
//             fontSize: 24,
//             fontWeight: FontWeight.bold,
//             letterSpacing: 1.2,
//             color: Colors.white, // white text
//           ),
//         ),
//         centerTitle: true,
//         backgroundColor: Colors.brown.shade700,
//         elevation: 4,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(10.0),
//         child: ClipRRect(
//           borderRadius: BorderRadius.circular(16),
//           child: FlutterMap(
//             mapController: mapController,
//             options: MapOptions(
//               initialCenter: center,
//               initialZoom: 14.0,
//             ),
//             children: [
//               TileLayer(
//                 urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
//                 userAgentPackageName: 'com.example.app',
//               ),
//               MarkerLayer(markers: markers),
//             ],
//           ),
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _addMarker,
//         backgroundColor: Colors.brown,
//         child: const Icon(Icons.add_location, color: Colors.white),
//       ),
//     );
//   }
// }
//
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  final MapController mapController = MapController();
  final LatLng center = LatLng(27.7172, 85.3240); // Kathmandu
  List<Marker> markers = [];

  final Color themeBrown = const Color(0xFF8B4513); // Saddle Brown

  void _addMarker() {
    setState(() {
      markers.add(
        Marker(
          point: center,
          width: 60,
          height: 60,
          child: Icon(
            Icons.location_on,
            color: Colors.red,
            size: 40,
          ),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFDF6EC), // soft background
      appBar: AppBar(
        title: const Text(
          'Find Your Way',
          style: TextStyle(
            fontFamily: 'Cinzel',
            fontSize: 24,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.2,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: themeBrown,
        elevation: 4,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: FlutterMap(
            mapController: mapController,
            options: MapOptions(
              initialCenter: center,
              initialZoom: 14.0,
            ),
            children: [
              TileLayer(
                urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                userAgentPackageName: 'com.example.app',
              ),
              MarkerLayer(markers: markers),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addMarker,
        backgroundColor: themeBrown,
        child: const Icon(Icons.add_location, color: Colors.white),
      ),
    );
  }
}
