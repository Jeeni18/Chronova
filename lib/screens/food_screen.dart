import 'package:flutter/material.dart';

class FoodScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Food')),
      body: Center(child: Text('Welcome to the Food Page')),
    );
  }
}


// import 'package:flutter/material.dart';
//
// import '../utils/colors.dart';
// import '../data/places_data.dart';
// import '../models/place.dart';
//
// class HomeScreen extends StatefulWidget {
//   @override
//   _HomeScreenState createState() => _HomeScreenState();
// }

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
//             Expanded(child: _buildCategoryContent()),
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
//                       fontWeight:
//                       isSelected ? FontWeight.w600 : FontWeight.normal,
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
//   Widget _buildCategoryContent() {
//     switch (_selectedCategory) {
//       case 0:
//         return _buildPlacesGrid();
//       case 1:
//         return _buildFoodList();
//       case 2:
//         return _buildEventsList();
//       default:
//         return Center(child: Text('No content available'));
//     }
//   }
//
//   Widget _buildPlacesGrid() {
//     return Padding(
//       padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//       child: GridView.builder(
//         physics: BouncingScrollPhysics(),
//         itemCount: _places.length,
//         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//           crossAxisCount: 2,
//           crossAxisSpacing: 12,
//           mainAxisSpacing: 12,
//           childAspectRatio: 0.75,
//         ),
//         itemBuilder: (context, index) {
//           return _buildPlaceCard(_places[index]);
//         },
//       ),
//     );
//   }
//
//   Widget _buildPlaceCard(Place place) {
//     return Container(
//       clipBehavior: Clip.hardEdge,
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
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           ClipRRect(
//             borderRadius: BorderRadius.only(
//               topLeft: Radius.circular(20),
//               topRight: Radius.circular(20),
//             ),
//             child: Image.asset(
//               place.image,
//               fit: BoxFit.cover,
//               height: 120,
//               width: double.infinity,
//             ),
//           ),
//           Padding(
//             padding: EdgeInsets.all(12),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 Text(
//                   place.name,
//                   style: TextStyle(
//                     fontSize: 14,
//                     fontWeight: FontWeight.w600,
//                     color: AppColors.textDark,
//                   ),
//                   maxLines: 2,
//                   overflow: TextOverflow.ellipsis,
//                 ),
//                 SizedBox(height: 4),
//                 Row(
//                   children: [
//                     Icon(Icons.star, color: AppColors.goldAccent, size: 16),
//                     SizedBox(width: 4),
//                     Text(
//                       place.rating.toString(),
//                       style: TextStyle(
//                         fontSize: 12,
//                         color: AppColors.textLight,
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildFoodList() {
//     return ListView(
//       padding: EdgeInsets.all(20),
//       children: [
//         _buildCard('Momo', 'Nepali dumplings', Icons.ramen_dining),
//         _buildCard('Sel Roti', 'Traditional rice bread', Icons.breakfast_dining),
//         _buildCard('Chatamari', 'Newari-style pizza', Icons.local_pizza),
//       ],
//     );
//   }
//
//   Widget _buildEventsList() {
//     return ListView(
//       padding: EdgeInsets.all(20),
//       children: [
//         _buildCard('Indra Jatra', 'Festival celebrated in Kathmandu', Icons.celebration),
//         _buildCard('Dashain', 'The biggest Hindu festival in Nepal', Icons.festival),
//         _buildCard('Tihar', 'Festival of lights and dogs', Icons.light_mode),
//       ],
//     );
//   }
//
//   Widget _buildCard(String title, String subtitle, IconData icon) {
//     return Container(
//       margin: EdgeInsets.only(bottom: 15),
//       padding: EdgeInsets.all(15),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(15),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.grey.withOpacity(0.1),
//             blurRadius: 8,
//             offset: Offset(0, 3),
//           ),
//         ],
//       ),
//       child: Row(
//         children: [
//           Icon(icon, size: 30, color: AppColors.primaryBrown),
//           SizedBox(width: 15),
//           Expanded(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(title,
//                     style: TextStyle(
//                         fontSize: 16,
//                         fontWeight: FontWeight.bold,
//                         color: AppColors.textDark)),
//                 SizedBox(height: 5),
//                 Text(subtitle,
//                     style: TextStyle(fontSize: 13, color: AppColors.textLight)),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
