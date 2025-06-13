import 'package:flutter/material.dart';
import '../models/place.dart';
import '../utils/colors.dart';

class PlaceDetailScreen extends StatelessWidget {
  final Place place;

  PlaceDetailScreen({required this.place});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryBrown,
        title: Text(place.name),
      ),
      body: Column(
        children: [
          Image.asset(place.imagePath, width: double.infinity, height: 250, fit: BoxFit.cover),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  place.name,
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Icon(Icons.star, color: AppColors.goldAccent),
                    SizedBox(width: 5),
                    Text(
                      place.rating.toString(),
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Text(
                  'Here goes more info about ${place.name}.\nAdd some interesting stories, history, or guide!',
                  style: TextStyle(fontSize: 16, color: Colors.grey[800]),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
