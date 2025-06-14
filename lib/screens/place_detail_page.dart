import 'package:flutter/material.dart';
import '../models/place.dart';
import '../utils/colors.dart';

class PlaceDetailPage extends StatelessWidget {
  final Place place;

  const PlaceDetailPage({required this.place});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.softGray,
      appBar: AppBar(
        backgroundColor: AppColors.primaryBrown,
        title: Text(
          place.name,
          style: TextStyle(
            fontFamily: 'Cinzel', // Make sure this font is declared in pubspec.yaml
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white, // White text color
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(
              place.image,
              width: double.infinity,
              height: 250,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    place.name,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textDark,
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Icon(Icons.star, color: AppColors.goldAccent),
                      SizedBox(width: 5),
                      Text(
                        place.rating.toString(),
                        style: TextStyle(color: AppColors.textLight),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Text(
                    place.description,
                    style: TextStyle(fontSize: 16, color: AppColors.textDark),
                  ),
                  SizedBox(height: 20),
                  Wrap(
                    spacing: 10,
                    children: place.tags
                        .map((tag) => Chip(
                      label: Text(tag),
                      backgroundColor:
                      AppColors.primaryBrown.withOpacity(0.1),
                    ))
                        .toList(),
                  ),
                  SizedBox(height: 30),

                  // Buttons Row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: ElevatedButton.icon(
                          onPressed: () {
                            // TODO: Start AR Experience
                          },
                          icon: Icon(Icons.view_in_ar),
                          label: Text("AR Experience"),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.primaryBrown,
                            foregroundColor: Colors.white,
                            padding: EdgeInsets.symmetric(vertical: 14),
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: ElevatedButton.icon(
                          onPressed: () {
                            // TODO: Play Audio Guide
                          },
                          icon: Icon(Icons.play_circle),
                          label: Text("Audio Guide"),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.primaryBrown,
                            foregroundColor: Colors.white,
                            padding: EdgeInsets.symmetric(vertical: 14),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
