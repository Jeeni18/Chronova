// import 'package:flutter/material.dart';
// import '../utils/colors.dart';
// import '../utils/styles.dart';
// import '../data/places_data.dart';
// import '../models/place.dart';
//
// class HomeScreen extends StatefulWidget {
//   @override
//   _HomeScreenState createState() => _HomeScreenState();
// }
//
// class _HomeScreenState extends State<HomeScreen> {
//   int _selectedCategory = 0;
//   final List<String> _categories = ['Places', 'Food', 'Events'];
//   final List<Place> _places = PlacesData.getPlaces();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColors.softGray,
//       body: SafeArea(
//         child: Column(
//           children: [
//             _buildHeader(),
//             _buildSearchBar(),
//             _buildCategoryTabs(),
//             Expanded(
//               child: _buildPlacesGrid(),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget _buildHeader() {
//     return Container(
//       padding: EdgeInsets.all(20),
//       decoration: BoxDecoration(
//         gradient: LinearGradient(
//           begin: Alignment.topLeft,
//           end: Alignment.bottomRight,
//           colors: [
//             AppColors.primaryBrown,
//             AppColors.darkBrown,
//           ],
//         ),
//         borderRadius: BorderRadius.only(
//           bottomLeft: Radius.circular(30),
//           bottomRight: Radius.circular(30),
//         ),
//       ),
//       child: Row(
//         children: [
//           Expanded(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Row(
//                   children: [
//                     Text(
//                       'CHRONOVA',
//                       style: TextStyle(
//                         fontSize: 28,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.white,
//                         letterSpacing: 2,
//                       ),
//                     ),
//                     SizedBox(width: 10),
//                     Container(
//                       padding: EdgeInsets.all(8),
//                       decoration: BoxDecoration(
//                         color: AppColors.goldAccent,
//                         borderRadius: BorderRadius.circular(8),
//                       ),
//                       child: Icon(
//                         Icons.account_balance,
//                         color: Colors.white,
//                         size: 20,
//                       ),
//                     ),
//                   ],
//                 ),
//                 SizedBox(height: 8),
//                 Text(
//                   'Discover the stories behind ancient places',
//                   style: TextStyle(
//                     color: Colors.white.withOpacity(0.9),
//                     fontSize: 14,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           Container(
//             padding: EdgeInsets.all(12),
//             decoration: BoxDecoration(
//               color: Colors.white.withOpacity(0.2),
//               borderRadius: BorderRadius.circular(15),
//             ),
//             child: Icon(
//               Icons.menu,
//               color: Colors.white,
//               size: 24,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildSearchBar() {
//     return Container(
//       margin: EdgeInsets.all(20),
//       padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(25),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.grey.withOpacity(0.1),
//             blurRadius: 10,
//             offset: Offset(0, 2),
//           ),
//         ],
//       ),
//       child: Row(
//         children: [
//           Icon(Icons.search, color: AppColors.textLight),
//           SizedBox(width: 15),
//           Expanded(
//             child: Text(
//               'Search',
//               style: TextStyle(
//                 color: AppColors.textLight,
//                 fontSize: 16,
//               ),
//             ),
//           ),
//           Container(
//             padding: EdgeInsets.all(8),
//             decoration: BoxDecoration(
//               color: AppColors.primaryBrown,
//               borderRadius: BorderRadius.circular(12),
//             ),
//             child: Icon(
//               Icons.tune,
//               color: Colors.white,
//               size: 20,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildCategoryTabs() {
//     return Container(
//       height: 50,
//       margin: EdgeInsets.symmetric(horizontal: 20),
//       child: Row(
//         children: _categories.asMap().entries.map((entry) {
//           int index = entry.key;
//           String category = entry.value;
//           bool isSelected = _selectedCategory == index;
//
//           return Expanded(
//             child: GestureDetector(
//               onTap: () {
//                 setState(() {
//                   _selectedCategory = index;
//                 });
//               },
//               child: Container(
//                 margin: EdgeInsets.symmetric(horizontal: 5),
//                 decoration: BoxDecoration(
//                   color: isSelected ? AppColors.primaryBrown : Colors.white,
//                   borderRadius: BorderRadius.circular(25),
//                   boxShadow: [
//                     BoxShadow(
//                       color: Colors.grey.withOpacity(0.1),
//                       blurRadius: 5,
//                       offset: Offset(0, 2),
//                     ),
//                   ],
//                 ),
//                 child: Center(
//                   child: Text(
//                     category,
//                     style: TextStyle(
//                       color: isSelected ? Colors.white : AppColors.textLight,
//                       fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           );
//         }).toList(),
//       ),
//     );
//   }
//
//   Widget _buildPlacesGrid() {
//     return Container(
//       padding: EdgeInsets.all(20),
//       child: GridView.builder(
//         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//           crossAxisCount: 2,
//           crossAxisSpacing: 15,
//           mainAxisSpacing: 15,
//           childAspectRatio: 0.85,
//         ),
//         itemCount: _places.length,
//         itemBuilder: (context, index) {
//           return _buildPlaceCard(_places[index]);
//         },
//       ),
//     );
//   }
//
//   Widget _buildPlaceCard(Place place) {
//     return Container(
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(20),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.grey.withOpacity(0.1),
//             blurRadius: 10,
//             offset: Offset(0, 5),
//           ),
//         ],
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Expanded(
//             flex: 3,
//             child: Container(
//               decoration: BoxDecoration(
//                 color: AppColors.lightBrown.withOpacity(0.3),
//                 borderRadius: BorderRadius.only(
//                   topLeft: Radius.circular(20),
//                   topRight: Radius.circular(20),
//                 ),
//               ),
//               child: Center(
//                 child: Icon(
//                   Icons.account_balance,
//                   size: 50,
//                   color: AppColors.primaryBrown,
//                 ),
//               ),
//             ),
//           ),
//           Expanded(
//             flex: 2,
//             child: Padding(
//               padding: EdgeInsets.all(12),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     place.name,
//                     style: TextStyle(
//                       fontSize: 14,
//                       fontWeight: FontWeight.w600,
//                       color: AppColors.textDark,
//                     ),
//                     maxLines: 2,
//                     overflow: TextOverflow.ellipsis,
//                   ),
//                   SizedBox(height: 4),
//                   Row(
//                     children: [
//                       Icon(Icons.star, color: AppColors.goldAccent, size: 16),
//                       SizedBox(width: 4),
//                       Text(
//                         place.rating.toString(),
//                         style: TextStyle(
//                           fontSize: 12,
//                           color: AppColors.textLight,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import '../utils/colors.dart';
import '../utils/styles.dart';
import '../data/places_data.dart';
import '../models/place.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedCategory = 0;
  final List<String> _categories = ['Places', 'Food', 'Events'];
  final List<Place> _places = PlacesData.getPlaces();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.softGray,
      body: SafeArea(
        child: Column(
          children: [
            _buildHeader(),
            _buildSearchBar(),
            _buildCategoryTabs(),
            Expanded(
              child: _buildPlacesGrid(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 25),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: ShaderMask(
              shaderCallback: (bounds) => LinearGradient(
                colors: [AppColors.primaryBrown, AppColors.goldAccent],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ).createShader(bounds),
              child: Text(
                '_ CHRONOVA _',
                style: TextStyle(
                  fontFamily: 'Cinzel',
                  fontSize: 25,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 2,
                  color: Colors.white, // overridden by shader
                  overflow: TextOverflow.ellipsis,
                ),
                maxLines: 1,
                softWrap: false,
              ),
            ),
          ),
          SizedBox(width: 10),
          Image.asset(
            'assets/img.png',
            height: 80,
            width: 80,
            fit: BoxFit.contain,
          ),
        ],
      ),
    );
  }

  //
  // Widget _buildHeader() {
  //   return Container(
  //     padding: EdgeInsets.symmetric(horizontal: 20, vertical: 25),
  //     decoration: BoxDecoration(
  //       color: Colors.white,
  //       borderRadius: BorderRadius.only(
  //         bottomLeft: Radius.circular(30),
  //         bottomRight: Radius.circular(30),
  //       ),
  //       boxShadow: [
  //         BoxShadow(
  //           color: Colors.black.withOpacity(0.05),
  //           blurRadius: 10,
  //           offset: Offset(0, 4),
  //         ),
  //       ],
  //     ),
  //     child: Row(
  //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //       children: [
  //         ShaderMask(
  //           shaderCallback: (bounds) => LinearGradient(
  //             colors: [AppColors.primaryBrown, AppColors.goldAccent],
  //             begin: Alignment.topLeft,
  //             end: Alignment.bottomRight,
  //           ).createShader(bounds),
  //           child: Text(
  //             'CHRONOVA',
  //             style: TextStyle(
  //               fontFamily: 'Cinzel',
  //               fontSize: 22,
  //               fontWeight: FontWeight.w600,
  //               letterSpacing: 2,
  //               color: Colors.white, // will be masked by shader
  //             ),
  //           ),
  //         ),
  //         ClipRRect(
  //           borderRadius: BorderRadius.circular(12),
  //           child: Image.asset(
  //             'assets/logo.png',
  //             height: 32,
  //             width: 32,
  //             fit: BoxFit.cover,
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }

  //
  // Widget _buildHeader() {
  //   return Container(
  //     padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
  //     alignment: Alignment.center,
  //     decoration: BoxDecoration(
  //       color: Colors.white,
  //       borderRadius: BorderRadius.only(
  //         bottomLeft: Radius.circular(30),
  //         bottomRight: Radius.circular(30),
  //       ),
  //       boxShadow: [
  //         BoxShadow(
  //           color: Colors.black.withOpacity(0.05),
  //           blurRadius: 10,
  //           offset: Offset(0, 4),
  //         ),
  //       ],
  //     ),
  //     child: ShaderMask(
  //       shaderCallback: (bounds) => LinearGradient(
  //         colors: [AppColors.primaryBrown, AppColors.goldAccent],
  //         begin: Alignment.topLeft,
  //         end: Alignment.bottomRight,
  //       ).createShader(bounds),
  //       child: Text(
  //         'CHRONOVA',
  //         style: TextStyle(
  //           fontSize: 32,
  //           fontWeight: FontWeight.bold,
  //           letterSpacing: 4,
  //           color: Colors.white, // Gradient applied by ShaderMask
  //         ),
  //       ),
  //     ),
  //   );
  // }

  Widget _buildSearchBar() {
    return Container(
      margin: EdgeInsets.all(20),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 10,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Icon(Icons.search, color: AppColors.textLight),
          SizedBox(width: 15),
          Expanded(
            child: Text(
              'Search',
              style: TextStyle(
                color: AppColors.textLight,
                fontSize: 16,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: AppColors.primaryBrown,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              Icons.tune,
              color: Colors.white,
              size: 20,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryTabs() {
    return Container(
      height: 50,
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: _categories.asMap().entries.map((entry) {
          int index = entry.key;
          String category = entry.value;
          bool isSelected = _selectedCategory == index;

          return Expanded(
            child: GestureDetector(
              onTap: () {
                setState(() {
                  _selectedCategory = index;
                });
              },
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 5),
                decoration: BoxDecoration(
                  color: isSelected ? AppColors.primaryBrown : Colors.white,
                  borderRadius: BorderRadius.circular(25),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.1),
                      blurRadius: 5,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: Center(
                  child: Text(
                    category,
                    style: TextStyle(
                      color: isSelected ? Colors.white : AppColors.textLight,
                      fontWeight:
                      isSelected ? FontWeight.w600 : FontWeight.normal,
                    ),
                  ),
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildPlacesGrid() {
    return Container(
      padding: EdgeInsets.all(20),
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 15,
          mainAxisSpacing: 15,
          childAspectRatio: 0.85,
        ),
        itemCount: _places.length,
        itemBuilder: (context, index) {
          return _buildPlaceCard(_places[index]);
        },
      ),
    );
  }

  Widget _buildPlaceCard(Place place) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 10,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 3,
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.lightBrown.withOpacity(0.3),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: Center(
                child: Icon(
                  Icons.account_balance,
                  size: 50,
                  color: AppColors.primaryBrown,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Padding(
              padding: EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    place.name,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: AppColors.textDark,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 4),
                  Row(
                    children: [
                      Icon(Icons.star, color: AppColors.goldAccent, size: 16),
                      SizedBox(width: 4),
                      Text(
                        place.rating.toString(),
                        style: TextStyle(
                          fontSize: 12,
                          color: AppColors.textLight,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
