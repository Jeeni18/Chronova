// // // // import 'package:flutter/material.dart';
// // // // import '../utils/colors.dart';
// // // // import '../utils/styles.dart';
// // // //
// // // // class FavoritesScreen extends StatelessWidget {
// // // //   @override
// // // //   Widget build(BuildContext context) {
// // // //     return Scaffold(
// // // //       backgroundColor: AppColors.softGray,
// // // //       body: SafeArea(
// // // //         child: Column(
// // // //           children: [
// // // //             _buildHeader(),
// // // //             Expanded(
// // // //               child: _buildFavoritesList(),
// // // //             ),
// // // //           ],
// // // //         ),
// // // //       ),
// // // //     );
// // // //   }
// // // //
// // // //   Widget _buildHeader() {
// // // //     return Container(
// // // //       padding: EdgeInsets.all(20),
// // // //       decoration: BoxDecoration(
// // // //         gradient: LinearGradient(
// // // //           colors: [AppColors.primaryBrown, AppColors.darkBrown],
// // // //         ),
// // // //         borderRadius: BorderRadius.only(
// // // //           bottomLeft: Radius.circular(30),
// // // //           bottomRight: Radius.circular(30),
// // // //         ),
// // // //       ),
// // // //       child: Row(
// // // //         children: [
// // // //           Icon(Icons.favorite, color: Colors.white, size: 28),
// // // //           SizedBox(width: 15),
// // // //           Text(
// // // //             'My Favorites',
// // // //             style: TextStyle(
// // // //               fontSize: 24,
// // // //               fontWeight: FontWeight.bold,
// // // //               color: Colors.white,
// // // //             ),
// // // //           ),
// // // //         ],
// // // //       ),
// // // //     );
// // // //   }
// // // //
// // // //   Widget _buildFavoritesList() {
// // // //     return ListView.builder(
// // // //       padding: EdgeInsets.all(20),
// // // //       itemCount: 4,
// // // //       itemBuilder: (context, index) {
// // // //         return Container(
// // // //           margin: EdgeInsets.only(bottom: 15),
// // // //           padding: EdgeInsets.all(15),
// // // //           decoration: BoxDecoration(
// // // //             color: Colors.white,
// // // //             borderRadius: BorderRadius.circular(15),
// // // //             boxShadow: [
// // // //               BoxShadow(
// // // //                 color: Colors.grey.withOpacity(0.1),
// // // //                 blurRadius: 5,
// // // //                 offset: Offset(0, 2),
// // // //               ),
// // // //             ],
// // // //           ),
// // // //           child: Row(
// // // //             children: [
// // // //               Container(
// // // //                 width: 60,
// // // //                 height: 60,
// // // //                 decoration: BoxDecoration(
// // // //                   color: AppColors.lightBrown.withOpacity(0.3),
// // // //                   borderRadius: BorderRadius.circular(10),
// // // //                 ),
// // // //                 child: Icon(
// // // //                   Icons.account_balance,
// // // //                   color: AppColors.primaryBrown,
// // // //                   size: 30,
// // // //                 ),
// // // //               ),
// // // //               SizedBox(width: 15),
// // // //               Expanded(
// // // //                 child: Column(
// // // //                   crossAxisAlignment: CrossAxisAlignment.start,
// // // //                   children: [
// // // //                     Text(
// // // //                       'Historical Place ${index + 1}',
// // // //                       style: AppStyles.headingMedium.copyWith(fontSize: 16),
// // // //                     ),
// // // //                     SizedBox(height: 5),
// // // //                     Text(
// // // //                       'Ancient temple with rich history',
// // // //                       style: AppStyles.bodyText.copyWith(fontSize: 14),
// // // //                     ),
// // // //                   ],
// // // //                 ),
// // // //               ),
// // // //               Icon(
// // // //                 Icons.favorite,
// // // //                 color: Colors.red,
// // // //                 size: 24,
// // // //               ),
// // // //             ],
// // // //           ),
// // // //         );
// // // //       },
// // // //     );
// // // //   }
// // // // }
// // //
// // // import 'package:flutter/material.dart';
// // // import 'package:http/http.dart' as http;
// // // import 'dart:convert';
// // //
// // // class QuestionnaireScreen extends StatefulWidget {
// // //   @override
// // //   _QuestionnaireScreenState createState() => _QuestionnaireScreenState();
// // // }
// // //
// // // class _QuestionnaireScreenState extends State<QuestionnaireScreen> {
// // //   final PageController _pageController = PageController();
// // //   int _currentPage = 0;
// // //
// // //   // Form data
// // //   String? _interestType;
// // //   String? _locationPreference;
// // //   String? _dietaryPreference;
// // //   String? _foodType;
// // //   List<String> _b2bInterests = [];
// // //
// // //   bool _isLoading = false;
// // //
// // //   final List<String> _pages = [
// // //     'Historical Interests',
// // //     'Location Preference',
// // //     'Food Preferences',
// // //     'Services'
// // //   ];
// // //
// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return Scaffold(
// // //       appBar: AppBar(
// // //         title: Text('Plan Your Journey'),
// // //         backgroundColor: Colors.orange[700],
// // //         elevation: 0,
// // //       ),
// // //       body: Column(
// // //         children: [
// // //           // Progress indicator
// // //           Container(
// // //             padding: EdgeInsets.all(16),
// // //             child: Row(
// // //               children: List.generate(_pages.length, (index) {
// // //                 return Expanded(
// // //                   child: Container(
// // //                     height: 4,
// // //                     margin: EdgeInsets.symmetric(horizontal: 2),
// // //                     decoration: BoxDecoration(
// // //                       color: index <= _currentPage
// // //                           ? Colors.orange[700]
// // //                           : Colors.grey[300],
// // //                       borderRadius: BorderRadius.circular(2),
// // //                     ),
// // //                   ),
// // //                 );
// // //               }),
// // //             ),
// // //           ),
// // //
// // //           // Page indicator text
// // //           Padding(
// // //             padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
// // //             child: Text(
// // //               '${_currentPage + 1} of ${_pages.length}: ${_pages[_currentPage]}',
// // //               style: TextStyle(
// // //                 fontSize: 16,
// // //                 fontWeight: FontWeight.w500,
// // //                 color: Colors.grey[600],
// // //               ),
// // //             ),
// // //           ),
// // //
// // //           // Page content
// // //           Expanded(
// // //             child: PageView(
// // //               controller: _pageController,
// // //               onPageChanged: (page) {
// // //                 setState(() {
// // //                   _currentPage = page;
// // //                 });
// // //               },
// // //               children: [
// // //                 _buildInterestTypePage(),
// // //                 _buildLocationPage(),
// // //                 _buildFoodPreferencesPage(),
// // //                 _buildServicesPage(),
// // //               ],
// // //             ),
// // //           ),
// // //
// // //           // Navigation buttons
// // //           Container(
// // //             padding: EdgeInsets.all(16),
// // //             child: Row(
// // //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
// // //               children: [
// // //                 _currentPage > 0
// // //                     ? ElevatedButton(
// // //                   onPressed: _previousPage,
// // //                   child: Text('Previous'),
// // //                   style: ElevatedButton.styleFrom(
// // //                     backgroundColor: Colors.grey[300],
// // //                     foregroundColor: Colors.black87,
// // //                   ),
// // //                 )
// // //                     : SizedBox(width: 80),
// // //
// // //                 ElevatedButton(
// // //                   onPressed: _isLoading ? null : (_currentPage == _pages.length - 1
// // //                       ? _submitQuestionnaire
// // //                       : _nextPage),
// // //                   child: _isLoading
// // //                       ? SizedBox(
// // //                     width: 20,
// // //                     height: 20,
// // //                     child: CircularProgressIndicator(strokeWidth: 2),
// // //                   )
// // //                       : Text(_currentPage == _pages.length - 1
// // //                       ? 'Get Recommendations'
// // //                       : 'Next'),
// // //                   style: ElevatedButton.styleFrom(
// // //                     backgroundColor: Colors.orange[700],
// // //                     foregroundColor: Colors.white,
// // //                     minimumSize: Size(120, 45),
// // //                   ),
// // //                 ),
// // //               ],
// // //             ),
// // //           ),
// // //         ],
// // //       ),
// // //     );
// // //   }
// // //
// // //   Widget _buildInterestTypePage() {
// // //     return SingleChildScrollView(
// // //       padding: EdgeInsets.all(16),
// // //       child: Column(
// // //         crossAxisAlignment: CrossAxisAlignment.start,
// // //         children: [
// // //           Text(
// // //             'What type of historical sites interest you most?',
// // //             style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
// // //           ),
// // //           SizedBox(height: 24),
// // //           ..._buildRadioOptions(
// // //             value: _interestType,
// // //             options: [
// // //               {'value': 'temples_religious', 'label': 'Temples & Religious Heritage'},
// // //               {'value': 'ancient_architecture', 'label': 'Ancient Architecture & Palaces'},
// // //               {'value': 'old_towns', 'label': 'Old Towns & Heritage Areas'},
// // //               {'value': 'cultural_museums', 'label': 'Cultural Museums & Galleries'},
// // //               {'value': 'archaeological_ruins', 'label': 'Archaeological Sites & Monuments'},
// // //             ],
// // //             onChanged: (value) => setState(() => _interestType = value),
// // //           ),
// // //         ],
// // //       ),
// // //     );
// // //   }
// // //
// // //   Widget _buildLocationPage() {
// // //     return SingleChildScrollView(
// // //       padding: EdgeInsets.all(16),
// // //       child: Column(
// // //         crossAxisAlignment: CrossAxisAlignment.start,
// // //         children: [
// // //           Text(
// // //             'Which region would you like to explore?',
// // //             style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
// // //           ),
// // //           SizedBox(height: 24),
// // //           ..._buildRadioOptions(
// // //             value: _locationPreference,
// // //             options: [
// // //               {'value': 'kathmandu_valley', 'label': 'Kathmandu Valley\n(Kathmandu, Patan, Bhaktapur)'},
// // //               {'value': 'lumbini', 'label': 'Lumbini & Kapilvastu'},
// // //               {'value': 'gorkha_bandipur', 'label': 'Gorkha, Bandipur & Palpa'},
// // //               {'value': 'janakpur', 'label': 'Janakpur & Mithila Region'},
// // //             ],
// // //             onChanged: (value) => setState(() => _locationPreference = value),
// // //           ),
// // //         ],
// // //       ),
// // //     );
// // //   }
// // //
// // //   Widget _buildFoodPreferencesPage() {
// // //     return SingleChildScrollView(
// // //       padding: EdgeInsets.all(16),
// // //       child: Column(
// // //         crossAxisAlignment: CrossAxisAlignment.start,
// // //         children: [
// // //           Text(
// // //             'Food Preferences',
// // //             style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
// // //           ),
// // //           SizedBox(height: 24),
// // //
// // //           Text(
// // //             'Dietary Preference:',
// // //             style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
// // //           ),
// // //           SizedBox(height: 12),
// // //           ..._buildRadioOptions(
// // //             value: _dietaryPreference,
// // //             options: [
// // //               {'value': 'vegetarian', 'label': 'Vegetarian'},
// // //               {'value': 'vegan', 'label': 'Vegan'},
// // //               {'value': 'non_vegetarian', 'label': 'Non-Vegetarian'},
// // //               {'value': 'all', 'label': 'No specific restrictions'},
// // //             ],
// // //             onChanged: (value) => setState(() => _dietaryPreference = value),
// // //           ),
// // //
// // //           SizedBox(height: 32),
// // //
// // //           Text(
// // //             'Food Experience Type:',
// // //             style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
// // //           ),
// // //           SizedBox(height: 12),
// // //           ..._buildRadioOptions(
// // //             value: _foodType,
// // //             options: [
// // //               {'value': 'local_snacks', 'label': 'Street Food & Local Snacks'},
// // //               {'value': 'traditional_meals', 'label': 'Traditional Full-Course Meals'},
// // //               {'value': 'high_end', 'label': 'Fine Dining & Upscale Restaurants'},
// // //             ],
// // //             onChanged: (value) => setState(() => _foodType = value),
// // //           ),
// // //         ],
// // //       ),
// // //     );
// // //   }
// // //
// // //   Widget _buildServicesPage() {
// // //     return SingleChildScrollView(
// // //       padding: EdgeInsets.all(16),
// // //       child: Column(
// // //         crossAxisAlignment: CrossAxisAlignment.start,
// // //         children: [
// // //           Text(
// // //             'Are you interested in any of these services?',
// // //             style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
// // //           ),
// // //           SizedBox(height: 8),
// // //           Text(
// // //             'Select all that apply (optional)',
// // //             style: TextStyle(fontSize: 14, color: Colors.grey[600]),
// // //           ),
// // //           SizedBox(height: 24),
// // //           ..._buildCheckboxOptions(
// // //             selectedValues: _b2bInterests,
// // //             options: [
// // //               {'value': 'homestays', 'label': 'Homestays & Heritage Hotels'},
// // //               {'value': 'traditional_shops', 'label': 'Handicrafts & Traditional Shopping'},
// // //               {'value': 'guided_tours', 'label': 'Guided Tours & Storytelling'},
// // //             ],
// // //             onChanged: (value, isSelected) {
// // //               setState(() {
// // //                 if (isSelected) {
// // //                   _b2bInterests.add(value);
// // //                 } else {
// // //                   _b2bInterests.remove(value);
// // //                 }
// // //               });
// // //             },
// // //           ),
// // //
// // //           SizedBox(height: 16),
// // //           Container(
// // //             padding: EdgeInsets.all(12),
// // //             decoration: BoxDecoration(
// // //               color: Colors.orange[50],
// // //               borderRadius: BorderRadius.circular(8),
// // //               border: Border.all(color: Colors.orange[200]!),
// // //             ),
// // //             child: Row(
// // //               children: [
// // //                 Icon(Icons.info_outline, color: Colors.orange[700], size: 20),
// // //                 SizedBox(width: 8),
// // //                 Expanded(
// // //                   child: Text(
// // //                     'If none selected, we\'ll focus on historical sites and food recommendations.',
// // //                     style: TextStyle(fontSize: 12, color: Colors.orange[800]),
// // //                   ),
// // //                 ),
// // //               ],
// // //             ),
// // //           ),
// // //         ],
// // //       ),
// // //     );
// // //   }
// // //
// // //   List<Widget> _buildRadioOptions({
// // //     required String? value,
// // //     required List<Map<String, String>> options,
// // //     required ValueChanged<String?> onChanged,
// // //   }) {
// // //     return options.map((option) {
// // //       return Container(
// // //         margin: EdgeInsets.only(bottom: 8),
// // //         child: InkWell(
// // //           onTap: () => onChanged(option['value']),
// // //           borderRadius: BorderRadius.circular(8),
// // //           child: Container(
// // //             padding: EdgeInsets.all(12),
// // //             decoration: BoxDecoration(
// // //               border: Border.all(
// // //                 color: value == option['value']
// // //                     ? Colors.orange[700]!
// // //                     : Colors.grey[300]!,
// // //                 width: value == option['value'] ? 2 : 1,
// // //               ),
// // //               borderRadius: BorderRadius.circular(8),
// // //               color: value == option['value']
// // //                   ? Colors.orange[50]
// // //                   : Colors.white,
// // //             ),
// // //             child: Row(
// // //               children: [
// // //                 Radio<String>(
// // //                   value: option['value']!,
// // //                   groupValue: value,
// // //                   onChanged: onChanged,
// // //                   activeColor: Colors.orange[700],
// // //                 ),
// // //                 SizedBox(width: 8),
// // //                 Expanded(
// // //                   child: Text(
// // //                     option['label']!,
// // //                     style: TextStyle(
// // //                       fontSize: 14,
// // //                       fontWeight: value == option['value']
// // //                           ? FontWeight.w600
// // //                           : FontWeight.normal,
// // //                     ),
// // //                   ),
// // //                 ),
// // //               ],
// // //             ),
// // //           ),
// // //         ),
// // //       );
// // //     }).toList();
// // //   }
// // //
// // //   List<Widget> _buildCheckboxOptions({
// // //     required List<String> selectedValues,
// // //     required List<Map<String, String>> options,
// // //     required Function(String, bool) onChanged,
// // //   }) {
// // //     return options.map((option) {
// // //       bool isSelected = selectedValues.contains(option['value']);
// // //       return Container(
// // //         margin: EdgeInsets.only(bottom: 8),
// // //         child: InkWell(
// // //           onTap: () => onChanged(option['value']!, !isSelected),
// // //           borderRadius: BorderRadius.circular(8),
// // //           child: Container(
// // //             padding: EdgeInsets.all(12),
// // //             decoration: BoxDecoration(
// // //               border: Border.all(
// // //                 color: isSelected
// // //                     ? Colors.orange[700]!
// // //                     : Colors.grey[300]!,
// // //                 width: isSelected ? 2 : 1,
// // //               ),
// // //               borderRadius: BorderRadius.circular(8),
// // //               color: isSelected
// // //                   ? Colors.orange[50]
// // //                   : Colors.white,
// // //             ),
// // //             child: Row(
// // //               children: [
// // //                 Checkbox(
// // //                   value: isSelected,
// // //                   onChanged: (bool? value) => onChanged(option['value']!, value!),
// // //                   activeColor: Colors.orange[700],
// // //                 ),
// // //                 SizedBox(width: 8),
// // //                 Expanded(
// // //                   child: Text(
// // //                     option['label']!,
// // //                     style: TextStyle(
// // //                       fontSize: 14,
// // //                       fontWeight: isSelected
// // //                           ? FontWeight.w600
// // //                           : FontWeight.normal,
// // //                     ),
// // //                   ),
// // //                 ),
// // //               ],
// // //             ),
// // //           ),
// // //         ),
// // //       );
// // //     }).toList();
// // //   }
// // //
// // //   void _nextPage() {
// // //     if (_canProceed()) {
// // //       _pageController.nextPage(
// // //         duration: Duration(milliseconds: 300),
// // //         curve: Curves.easeInOut,
// // //       );
// // //     } else {
// // //       _showValidationError();
// // //     }
// // //   }
// // //
// // //   void _previousPage() {
// // //     _pageController.previousPage(
// // //       duration: Duration(milliseconds: 300),
// // //       curve: Curves.easeInOut,
// // //     );
// // //   }
// // //
// // //   bool _canProceed() {
// // //     switch (_currentPage) {
// // //       case 0:
// // //         return _interestType != null;
// // //       case 1:
// // //         return _locationPreference != null;
// // //       case 2:
// // //         return _dietaryPreference != null && _foodType != null;
// // //       case 3:
// // //         return true; // Services page is optional
// // //       default:
// // //         return false;
// // //     }
// // //   }
// // //
// // //   void _showValidationError() {
// // //     String message = '';
// // //     switch (_currentPage) {
// // //       case 0:
// // //         message = 'Please select your historical interest type';
// // //         break;
// // //       case 1:
// // //         message = 'Please select your preferred location';
// // //         break;
// // //       case 2:
// // //         message = 'Please complete your food preferences';
// // //         break;
// // //     }
// // //
// // //     ScaffoldMessenger.of(context).showSnackBar(
// // //       SnackBar(
// // //         content: Text(message),
// // //         backgroundColor: Color(0xFF8B4513),
// // //         behavior: SnackBarBehavior.floating,
// // //       ),
// // //     );
// // //   }
// // //
// // //   Future<void> _submitQuestionnaire() async {
// // //     if (!_canProceed()) {
// // //       _showValidationError();
// // //       return;
// // //     }
// // //
// // //     setState(() {
// // //       _isLoading = true;
// // //     });
// // //
// // //     try {
// // //       // Prepare the data
// // //       Map<String, dynamic> preferences = {
// // //         'interest_type': _interestType,
// // //         'location_preference': _locationPreference,
// // //         'dietary_preference': _dietaryPreference,
// // //         'food_type': _foodType,
// // //       };
// // //
// // //       // Add b2b_interest only if something is selected
// // //       if (_b2bInterests.isNotEmpty) {
// // //         preferences['b2b_interest'] = _b2bInterests;
// // //       } else {
// // //         preferences['b2b_interest'] = 'none';
// // //       }
// // //
// // //       // Make API call
// // //       final response = await http.post(
// // //         Uri.parse('cfda-110-44-118-28.ngrok-free.app'), // Replace with your API URL
// // //         headers: {
// // //           'Content-Type': 'application/json',
// // //         },
// // //         body: json.encode(preferences),
// // //       );
// // //
// // //       if (response.statusCode == 200) {
// // //         final data = json.decode(response.body);
// // //
// // //         // Navigate to recommendations screen
// // //         Navigator.pushReplacement(
// // //           context,
// // //           MaterialPageRoute(
// // //             builder: (context) => RecommendationsScreen(
// // //               recommendations: data['data'],
// // //               userPreferences: preferences,
// // //             ),
// // //           ),
// // //         );
// // //       } else {
// // //         throw Exception('Failed to get recommendations');
// // //       }
// // //     } catch (e) {
// // //       ScaffoldMessenger.of(context).showSnackBar(
// // //         SnackBar(
// // //           content: Text('Error: ${e.toString()}'),
// // //           backgroundColor: Colors.red[600],
// // //           behavior: SnackBarBehavior.floating,
// // //         ),
// // //       );
// // //     } finally {
// // //       setState(() {
// // //         _isLoading = false;
// // //       });
// // //     }
// // //   }
// // // }
// // //
// // // // Placeholder for recommendations screen
// // // class RecommendationsScreen extends StatelessWidget {
// // //   final Map<String, dynamic> recommendations;
// // //   final Map<String, dynamic> userPreferences;
// // //
// // //   const RecommendationsScreen({
// // //     Key? key,
// // //     required this.recommendations,
// // //     required this.userPreferences,
// // //   }) : super(key: key);
// // //
// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return Scaffold(
// // //       appBar: AppBar(
// // //         title: Text('Your Recommendations'),
// // //         backgroundColor: Colors.orange[700],
// // //       ),
// // //       body: Center(
// // //         child: Text('Recommendations will be displayed here'),
// // //       ),
// // //     );
// // //   }
// // // }
// // import 'package:flutter/material.dart';
// // import 'package:http/http.dart' as http;
// // import 'dart:convert';
// // import '../utils/colors.dart'; // Assuming you have the AppColors class here
// //
// // class QuestionnaireScreen extends StatefulWidget {
// //   @override
// //   _QuestionnaireScreenState createState() => _QuestionnaireScreenState();
// // }
// //
// // class _QuestionnaireScreenState extends State<QuestionnaireScreen> {
// //   final PageController _pageController = PageController();
// //   int _currentPage = 0;
// //
// //   String? _interestType;
// //   String? _locationPreference;
// //   String? _dietaryPreference;
// //   String? _foodType;
// //   List<String> _b2bInterests = [];
// //
// //   bool _isLoading = false;
// //
// //   final List<String> _pages = [
// //     'Historical Interests',
// //     'Location Preference',
// //     'Food Preferences',
// //     'Services'
// //   ];
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       backgroundColor: AppColors.softGray,
// //       appBar: AppBar(
// //         title: Text(
// //             'Plan Your Journey',
// //           style: TextStyle(
// //             fontFamily: 'Cinzel',
// //             fontSize: 24,
// //             fontWeight: FontWeight.bold,
// //             letterSpacing: 1.2,
// //             color: Colors.white,
// //           ),
// //         ),
// //
// //         centerTitle: true,
// //         backgroundColor: AppColors.primaryBrown,
// //         elevation: 2,
// //       ),
// //       body: Column(
// //         children: [
// //           Container(
// //             padding: EdgeInsets.all(16),
// //             child: Row(
// //               children: List.generate(_pages.length, (index) {
// //                 return Expanded(
// //                   child: Container(
// //                     height: 5,
// //                     margin: EdgeInsets.symmetric(horizontal: 3),
// //                     decoration: BoxDecoration(
// //                       color: index <= _currentPage
// //                           ? AppColors.primaryBrown
// //                           : Colors.grey[300],
// //                       borderRadius: BorderRadius.circular(4),
// //                     ),
// //                   ),
// //                 );
// //               }),
// //             ),
// //           ),
// //
// //           Padding(
// //             padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
// //             child: Text(
// //               '${_currentPage + 1} of ${_pages.length}: ${_pages[_currentPage]}',
// //               style: TextStyle(
// //                 fontSize: 16,
// //                 fontWeight: FontWeight.w500,
// //                 color: AppColors.textLight,
// //               ),
// //             ),
// //           ),
// //
// //           Expanded(
// //             child: PageView(
// //               controller: _pageController,
// //               onPageChanged: (page) {
// //                 setState(() {
// //                   _currentPage = page;
// //                 });
// //               },
// //               children: [
// //                 _buildInterestTypePage(),
// //                 _buildLocationPage(),
// //                 _buildFoodPreferencesPage(),
// //                 _buildServicesPage(),
// //               ],
// //             ),
// //           ),
// //
// //           Container(
// //             padding: EdgeInsets.all(16),
// //             child: Row(
// //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //               children: [
// //                 _currentPage > 0
// //                     ? ElevatedButton(
// //                   onPressed: _previousPage,
// //                   style: ElevatedButton.styleFrom(
// //                     backgroundColor: Colors.white,
// //                     foregroundColor: AppColors.textDark,
// //                     side: BorderSide(color: AppColors.primaryBrown),
// //                   ),
// //                   child: Text('Previous'),
// //                 )
// //                     : SizedBox(width: 80),
// //                 ElevatedButton(
// //                   onPressed: _isLoading ? null : (_currentPage == _pages.length - 1
// //                       ? _submitQuestionnaire
// //                       : _nextPage),
// //                   child: _isLoading
// //                       ? SizedBox(
// //                     width: 20,
// //                     height: 20,
// //                     child: CircularProgressIndicator(strokeWidth: 2),
// //                   )
// //                       : Text(
// //                     _currentPage == _pages.length - 1
// //                         ? 'Get Recommendations'
// //                         : 'Next',
// //                   ),
// //                   style: ElevatedButton.styleFrom(
// //                     backgroundColor: AppColors.primaryBrown,
// //                     foregroundColor: Colors.white,
// //                     minimumSize: Size(120, 45),
// //                   ),
// //                 ),
// //               ],
// //             ),
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// //
// //   Widget _buildInterestTypePage() => _buildRadioForm(
// //     title: 'What type of historical sites interest you most?',
// //     options: [
// //       {'value': 'temples_religious', 'label': 'Temples & Religious Heritage'},
// //       {'value': 'ancient_architecture', 'label': 'Ancient Architecture & Palaces'},
// //       {'value': 'old_towns', 'label': 'Old Towns & Heritage Areas'},
// //       {'value': 'cultural_museums', 'label': 'Cultural Museums & Galleries'},
// //       {'value': 'archaeological_ruins', 'label': 'Archaeological Sites & Monuments'},
// //     ],
// //     groupValue: _interestType,
// //     onChanged: (val) => setState(() => _interestType = val),
// //   );
// //
// //   Widget _buildLocationPage() => _buildRadioForm(
// //     title: 'Which region would you like to explore?',
// //     options: [
// //       {'value': 'kathmandu_valley', 'label': 'Kathmandu Valley\n(Kathmandu, Patan, Bhaktapur)'},
// //       {'value': 'lumbini', 'label': 'Lumbini & Kapilvastu'},
// //       {'value': 'gorkha_bandipur', 'label': 'Gorkha, Bandipur & Palpa'},
// //       {'value': 'janakpur', 'label': 'Janakpur & Mithila Region'},
// //     ],
// //     groupValue: _locationPreference,
// //     onChanged: (val) => setState(() => _locationPreference = val),
// //   );
// //
// //   Widget _buildFoodPreferencesPage() => SingleChildScrollView(
// //     padding: EdgeInsets.all(16),
// //     child: Column(
// //       crossAxisAlignment: CrossAxisAlignment.start,
// //       children: [
// //         _buildRadioForm(
// //           title: 'Dietary Preference:',
// //           options: [
// //             {'value': 'vegetarian', 'label': 'Vegetarian'},
// //             {'value': 'vegan', 'label': 'Vegan'},
// //             {'value': 'non_vegetarian', 'label': 'Non-Vegetarian'},
// //             {'value': 'all', 'label': 'No specific restrictions'},
// //           ],
// //           groupValue: _dietaryPreference,
// //           onChanged: (val) => setState(() => _dietaryPreference = val),
// //         ),
// //         SizedBox(height: 24),
// //         _buildRadioForm(
// //           title: 'Food Experience Type:',
// //           options: [
// //             {'value': 'local_snacks', 'label': 'Street Food & Local Snacks'},
// //             {'value': 'traditional_meals', 'label': 'Traditional Full-Course Meals'},
// //             {'value': 'high_end', 'label': 'Fine Dining & Upscale Restaurants'},
// //           ],
// //           groupValue: _foodType,
// //           onChanged: (val) => setState(() => _foodType = val),
// //         ),
// //       ],
// //     ),
// //   );
// //
// //   Widget _buildServicesPage() => SingleChildScrollView(
// //     padding: EdgeInsets.all(16),
// //     child: Column(
// //       crossAxisAlignment: CrossAxisAlignment.start,
// //       children: [
// //         Text('Are you interested in any of these services?',
// //             style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
// //         Text('Select all that apply (optional)',
// //             style: TextStyle(color: AppColors.textLight)),
// //         SizedBox(height: 12),
// //         ...[
// //           {'value': 'homestays', 'label': 'Homestays & Heritage Hotels'},
// //           {'value': 'traditional_shops', 'label': 'Handicrafts & Traditional Shopping'},
// //           {'value': 'guided_tours', 'label': 'Guided Tours & Storytelling'},
// //         ].map((option) => CheckboxListTile(
// //           title: Text(option['label']!),
// //           value: _b2bInterests.contains(option['value']),
// //           activeColor: AppColors.primaryBrown,
// //           onChanged: (selected) {
// //             setState(() {
// //               if (selected!) {
// //                 _b2bInterests.add(option['value']!);
// //               } else {
// //                 _b2bInterests.remove(option['value']!);
// //               }
// //             });
// //           },
// //         )),
// //       ],
// //     ),
// //   );
// //
// //   Widget _buildRadioForm({
// //     required String title,
// //     required List<Map<String, String>> options,
// //     required String? groupValue,
// //     required ValueChanged<String?> onChanged,
// //   }) {
// //     return SingleChildScrollView(
// //       padding: EdgeInsets.all(16),
// //       child: Column(
// //         crossAxisAlignment: CrossAxisAlignment.start,
// //         children: [
// //           Text(title, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
// //           SizedBox(height: 12),
// //           ...options.map((option) => RadioListTile<String>(
// //             title: Text(option['label']!),
// //             value: option['value']!,
// //             groupValue: groupValue,
// //             onChanged: onChanged,
// //             activeColor: AppColors.primaryBrown,
// //           )),
// //         ],
// //       ),
// //     );
// //   }
// //
// //   void _nextPage() {
// //     if (_canProceed()) {
// //       _pageController.nextPage(
// //         duration: Duration(milliseconds: 300),
// //         curve: Curves.easeInOut,
// //       );
// //     } else {
// //       _showValidationError();
// //     }
// //   }
// //
// //   void _previousPage() {
// //     _pageController.previousPage(
// //       duration: Duration(milliseconds: 300),
// //       curve: Curves.easeInOut,
// //     );
// //   }
// //
// //   bool _canProceed() {
// //     switch (_currentPage) {
// //       case 0:
// //         return _interestType != null;
// //       case 1:
// //         return _locationPreference != null;
// //       case 2:
// //         return _dietaryPreference != null && _foodType != null;
// //       default:
// //         return true;
// //     }
// //   }
// //
// //   void _showValidationError() {
// //     final messages = [
// //       'Please select your historical interest type',
// //       'Please select your preferred location',
// //       'Please complete your food preferences'
// //     ];
// //
// //     ScaffoldMessenger.of(context).showSnackBar(
// //       SnackBar(
// //         content: Text(messages[_currentPage]),
// //         backgroundColor: AppColors.primaryBrown,
// //       ),
// //     );
// //   }
// //
// //   Future<void> _submitQuestionnaire() async {
// //     if (!_canProceed()) {
// //       _showValidationError();
// //       return;
// //     }
// //
// //     setState(() => _isLoading = true);
// //
// //     try {
// //       Map<String, dynamic> preferences = {
// //         'interest_type': _interestType,
// //         'location_preference': _locationPreference,
// //         'dietary_preference': _dietaryPreference,
// //         'food_type': _foodType,
// //         'b2b_interest': _b2bInterests.isNotEmpty ? _b2bInterests : 'none',
// //       };
// //
// //       final response = await http.post(
// //         Uri.parse('https://1a46-110-44-118-28.ngrok-free.app'),
// //         headers: {'Content-Type': 'application/json'},
// //         body: json.encode(preferences),
// //       );
// //
// //       if (response.statusCode == 200) {
// //         final data = json.decode(response.body);
// //         Navigator.pushReplacement(
// //           context,
// //           MaterialPageRoute(
// //             builder: (context) => RecommendationsScreen(
// //               recommendations: data['data'],
// //               userPreferences: preferences,
// //             ),
// //           ),
// //         );
// //       } else {
// //         throw Exception('Failed to get recommendations');
// //       }
// //     } catch (e) {
// //       ScaffoldMessenger.of(context).showSnackBar(
// //         SnackBar(
// //           content: Text('Error: ${e.toString()}'),
// //           backgroundColor: Colors.red,
// //         ),
// //       );
// //     } finally {
// //       setState(() => _isLoading = false);
// //     }
// //   }
// // }
// //
// // class RecommendationsScreen extends StatelessWidget {
// //   final Map<String, dynamic> recommendations;
// //   final Map<String, dynamic> userPreferences;
// //
// //   const RecommendationsScreen({
// //     Key? key,
// //     required this.recommendations,
// //     required this.userPreferences,
// //   }) : super(key: key);
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       backgroundColor: AppColors.softGray,
// //       appBar: AppBar(
// //         title: Text('Your Recommendations'),
// //         backgroundColor: AppColors.primaryBrown,
// //       ),
// //       body: Padding(
// //         padding: const EdgeInsets.all(16.0),
// //         child: Center(
// //           child: Text(
// //             'Recommendations will be displayed here.',
// //             style: TextStyle(color: AppColors.textDark),
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// // }
//
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';
//
// class QuestionnaireScreen extends StatefulWidget {
//   @override
//   _QuestionnaireScreenState createState() => _QuestionnaireScreenState();
// }
//
// class _QuestionnaireScreenState extends State<QuestionnaireScreen> {
//   final PageController _pageController = PageController();
//   int _currentPage = 0;
//
//   // Form data
//   String? _interestType;
//   String? _locationPreference;
//   String? _dietaryPreference;
//   String? _foodType;
//   List<String> _b2bInterests = [];
//
//   bool _isLoading = false;
//
//   final List<String> _pages = [
//     'Historical Interests',
//     'Location Preference',
//     'Food Preferences',
//     'Services'
//   ];
//
//   // API URL - UPDATED WITH YOUR NGROK URL
//   static const String API_URL = '4f18-110-44-118-28.ngrok-free.app';
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Plan Your Journey'),
//         backgroundColor: Colors.orange[700],
//         elevation: 0,
//         actions: [
//           // Add debug button
//           IconButton(
//             icon: Icon(Icons.bug_report),
//             onPressed: _testApiConnection,
//           ),
//         ],
//       ),
//       body: Column(
//         children: [
//           // Progress indicator
//           Container(
//             padding: EdgeInsets.all(16),
//             child: Row(
//               children: List.generate(_pages.length, (index) {
//                 return Expanded(
//                   child: Container(
//                     height: 4,
//                     margin: EdgeInsets.symmetric(horizontal: 2),
//                     decoration: BoxDecoration(
//                       color: index <= _currentPage
//                           ? Colors.orange[700]
//                           : Colors.grey[300],
//                       borderRadius: BorderRadius.circular(2),
//                     ),
//                   ),
//                 );
//               }),
//             ),
//           ),
//
//           // Page indicator text
//           Padding(
//             padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//             child: Text(
//               '${_currentPage + 1} of ${_pages.length}: ${_pages[_currentPage]}',
//               style: TextStyle(
//                 fontSize: 16,
//                 fontWeight: FontWeight.w500,
//                 color: Colors.grey[600],
//               ),
//             ),
//           ),
//
//           // Page content
//           Expanded(
//             child: PageView(
//               controller: _pageController,
//               onPageChanged: (page) {
//                 setState(() {
//                   _currentPage = page;
//                 });
//               },
//               children: [
//                 _buildInterestTypePage(),
//                 _buildLocationPage(),
//                 _buildFoodPreferencesPage(),
//                 _buildServicesPage(),
//               ],
//             ),
//           ),
//
//           // Navigation buttons
//           Container(
//             padding: EdgeInsets.all(16),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 _currentPage > 0
//                     ? ElevatedButton(
//                   onPressed: _previousPage,
//                   child: Text('Previous'),
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Colors.grey[300],
//                     foregroundColor: Colors.black87,
//                   ),
//                 )
//                     : SizedBox(width: 80),
//
//                 ElevatedButton(
//                   onPressed: _isLoading ? null : (_currentPage == _pages.length - 1
//                       ? _submitQuestionnaire
//                       : _nextPage),
//                   child: _isLoading
//                       ? SizedBox(
//                     width: 20,
//                     height: 20,
//                     child: CircularProgressIndicator(strokeWidth: 2),
//                   )
//                       : Text(_currentPage == _pages.length - 1
//                       ? 'Get Recommendations'
//                       : 'Next'),
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Colors.orange[700],
//                     foregroundColor: Colors.white,
//                     minimumSize: Size(120, 45),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   // Test API connection method
//   Future<void> _testApiConnection() async {
//     try {
//       print('Testing API connection...');
//       final response = await http.get(
//         Uri.parse('https://cfda-110-44-118-28.ngrok-free.app/'),
//         headers: {'ngrok-skip-browser-warning': 'true'},
//       );
//
//       print('Test Response Status: ${response.statusCode}');
//       print('Test Response Body: ${response.body}');
//
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Text('API Test: ${response.statusCode == 200 ? 'Success' : 'Failed'}'),
//           backgroundColor: response.statusCode == 200 ? Colors.green : Colors.red,
//         ),
//       );
//     } catch (e) {
//       print('Test API Error: $e');
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Text('API Test Failed: $e'),
//           backgroundColor: Colors.red,
//         ),
//       );
//     }
//   }
//
//   Widget _buildInterestTypePage() {
//     return SingleChildScrollView(
//       padding: EdgeInsets.all(16),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             'What type of historical sites interest you most?',
//             style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//           ),
//           SizedBox(height: 24),
//           ..._buildRadioOptions(
//             value: _interestType,
//             options: [
//               {'value': 'temples_religious', 'label': 'Temples & Religious Heritage'},
//               {'value': 'ancient_architecture', 'label': 'Ancient Architecture & Palaces'},
//               {'value': 'old_towns', 'label': 'Old Towns & Heritage Areas'},
//               {'value': 'cultural_museums', 'label': 'Cultural Museums & Galleries'},
//               {'value': 'archaeological_ruins', 'label': 'Archaeological Sites & Monuments'},
//             ],
//             onChanged: (value) => setState(() => _interestType = value),
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildLocationPage() {
//     return SingleChildScrollView(
//       padding: EdgeInsets.all(16),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             'Which region would you like to explore?',
//             style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//           ),
//           SizedBox(height: 24),
//           ..._buildRadioOptions(
//             value: _locationPreference,
//             options: [
//               {'value': 'kathmandu_valley', 'label': 'Kathmandu Valley\n(Kathmandu, Patan, Bhaktapur)'},
//               {'value': 'lumbini', 'label': 'Lumbini & Kapilvastu'},
//               {'value': 'gorkha_bandipur', 'label': 'Gorkha, Bandipur & Palpa'},
//               {'value': 'janakpur', 'label': 'Janakpur & Mithila Region'},
//             ],
//             onChanged: (value) => setState(() => _locationPreference = value),
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildFoodPreferencesPage() {
//     return SingleChildScrollView(
//       padding: EdgeInsets.all(16),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             'Food Preferences',
//             style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//           ),
//           SizedBox(height: 24),
//
//           Text(
//             'Dietary Preference:',
//             style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
//           ),
//           SizedBox(height: 12),
//           ..._buildRadioOptions(
//             value: _dietaryPreference,
//             options: [
//               {'value': 'vegetarian', 'label': 'Vegetarian'},
//               {'value': 'vegan', 'label': 'Vegan'},
//               {'value': 'non_vegetarian', 'label': 'Non-Vegetarian'},
//               {'value': 'all', 'label': 'No specific restrictions'},
//             ],
//             onChanged: (value) => setState(() => _dietaryPreference = value),
//           ),
//
//           SizedBox(height: 32),
//
//           Text(
//             'Food Experience Type:',
//             style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
//           ),
//           SizedBox(height: 12),
//           ..._buildRadioOptions(
//             value: _foodType,
//             options: [
//               {'value': 'local_snacks', 'label': 'Street Food & Local Snacks'},
//               {'value': 'traditional_meals', 'label': 'Traditional Full-Course Meals'},
//               {'value': 'high_end', 'label': 'Fine Dining & Upscale Restaurants'},
//             ],
//             onChanged: (value) => setState(() => _foodType = value),
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildServicesPage() {
//     return SingleChildScrollView(
//       padding: EdgeInsets.all(16),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             'Are you interested in any of these services?',
//             style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//           ),
//           SizedBox(height: 8),
//           Text(
//             'Select all that apply (optional)',
//             style: TextStyle(fontSize: 14, color: Colors.grey[600]),
//           ),
//           SizedBox(height: 24),
//           ..._buildCheckboxOptions(
//             selectedValues: _b2bInterests,
//             options: [
//               {'value': 'homestays', 'label': 'Homestays & Heritage Hotels'},
//               {'value': 'traditional_shops', 'label': 'Handicrafts & Traditional Shopping'},
//               {'value': 'guided_tours', 'label': 'Guided Tours & Storytelling'},
//             ],
//             onChanged: (value, isSelected) {
//               setState(() {
//                 if (isSelected) {
//                   _b2bInterests.add(value);
//                 } else {
//                   _b2bInterests.remove(value);
//                 }
//               });
//             },
//           ),
//
//           SizedBox(height: 16),
//           Container(
//             padding: EdgeInsets.all(12),
//             decoration: BoxDecoration(
//               color: Colors.orange[50],
//               borderRadius: BorderRadius.circular(8),
//               border: Border.all(color: Colors.orange[200]!),
//             ),
//             child: Row(
//               children: [
//                 Icon(Icons.info_outline, color: Colors.orange[700], size: 20),
//                 SizedBox(width: 8),
//                 Expanded(
//                   child: Text(
//                     'If none selected, we\'ll focus on historical sites and food recommendations.',
//                     style: TextStyle(fontSize: 12, color: Colors.orange[800]),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   List<Widget> _buildRadioOptions({
//     required String? value,
//     required List<Map<String, String>> options,
//     required ValueChanged<String?> onChanged,
//   }) {
//     return options.map((option) {
//       return Container(
//         margin: EdgeInsets.only(bottom: 8),
//         child: InkWell(
//           onTap: () => onChanged(option['value']),
//           borderRadius: BorderRadius.circular(8),
//           child: Container(
//             padding: EdgeInsets.all(12),
//             decoration: BoxDecoration(
//               border: Border.all(
//                 color: value == option['value']
//                     ? Colors.orange[700]!
//                     : Colors.grey[300]!,
//                 width: value == option['value'] ? 2 : 1,
//               ),
//               borderRadius: BorderRadius.circular(8),
//               color: value == option['value']
//                   ? Colors.orange[50]
//                   : Colors.white,
//             ),
//             child: Row(
//               children: [
//                 Radio<String>(
//                   value: option['value']!,
//                   groupValue: value,
//                   onChanged: onChanged,
//                   activeColor: Colors.orange[700],
//                 ),
//                 SizedBox(width: 8),
//                 Expanded(
//                   child: Text(
//                     option['label']!,
//                     style: TextStyle(
//                       fontSize: 14,
//                       fontWeight: value == option['value']
//                           ? FontWeight.w600
//                           : FontWeight.normal,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       );
//     }).toList();
//   }
//
//   List<Widget> _buildCheckboxOptions({
//     required List<String> selectedValues,
//     required List<Map<String, String>> options,
//     required Function(String, bool) onChanged,
//   }) {
//     return options.map((option) {
//       bool isSelected = selectedValues.contains(option['value']);
//       return Container(
//         margin: EdgeInsets.only(bottom: 8),
//         child: InkWell(
//           onTap: () => onChanged(option['value']!, !isSelected),
//           borderRadius: BorderRadius.circular(8),
//           child: Container(
//             padding: EdgeInsets.all(12),
//             decoration: BoxDecoration(
//               border: Border.all(
//                 color: isSelected
//                     ? Colors.orange[700]!
//                     : Colors.grey[300]!,
//                 width: isSelected ? 2 : 1,
//               ),
//               borderRadius: BorderRadius.circular(8),
//               color: isSelected
//                   ? Colors.orange[50]
//                   : Colors.white,
//             ),
//             child: Row(
//               children: [
//                 Checkbox(
//                   value: isSelected,
//                   onChanged: (bool? value) => onChanged(option['value']!, value!),
//                   activeColor: Colors.orange[700],
//                 ),
//                 SizedBox(width: 8),
//                 Expanded(
//                   child: Text(
//                     option['label']!,
//                     style: TextStyle(
//                       fontSize: 14,
//                       fontWeight: isSelected
//                           ? FontWeight.w600
//                           : FontWeight.normal,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       );
//     }).toList();
//   }
//
//   void _nextPage() {
//     if (_canProceed()) {
//       _pageController.nextPage(
//         duration: Duration(milliseconds: 300),
//         curve: Curves.easeInOut,
//       );
//     } else {
//       _showValidationError();
//     }
//   }
//
//   void _previousPage() {
//     _pageController.previousPage(
//       duration: Duration(milliseconds: 300),
//       curve: Curves.easeInOut,
//     );
//   }
//
//   bool _canProceed() {
//     switch (_currentPage) {
//       case 0:
//         return _interestType != null;
//       case 1:
//         return _locationPreference != null;
//       case 2:
//         return _dietaryPreference != null && _foodType != null;
//       case 3:
//         return true; // Services page is optional
//       default:
//         return false;
//     }
//   }
//
//   void _showValidationError() {
//     String message = '';
//     switch (_currentPage) {
//       case 0:
//         message = 'Please select your historical interest type';
//         break;
//       case 1:
//         message = 'Please select your preferred location';
//         break;
//       case 2:
//         message = 'Please complete your food preferences';
//         break;
//     }
//
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(
//         content: Text(message),
//         backgroundColor: Colors.red[600],
//         behavior: SnackBarBehavior.floating,
//       ),
//     );
//   }
//
//   Future<void> _submitQuestionnaire() async {
//     if (!_canProceed()) {
//       _showValidationError();
//       return;
//     }
//
//     setState(() {
//       _isLoading = true;
//     });
//
//     try {
//       // Prepare the data
//       Map<String, dynamic> preferences = {
//         'interest_type': _interestType,
//         'location_preference': _locationPreference,
//         'dietary_preference': _dietaryPreference,
//         'food_type': _foodType,
//       };
//
//       // Add b2b_interest only if something is selected
//       if (_b2bInterests.isNotEmpty) {
//         preferences['b2b_interest'] = _b2bInterests;
//       } else {
//         preferences['b2b_interest'] = 'none';
//       }
//
//       print('=== DEBUGGING FLUTTER SUBMISSION ===');
//       print('Sending preferences: ${json.encode(preferences)}');
//       print('API URL: $API_URL');
//       print('Current context mounted: ${context.mounted}');
//       print('====================================');
//
//       // Make API call
//       final response = await http.post(
//         Uri.parse(API_URL),
//         headers: {
//           'Content-Type': 'application/json',
//           'ngrok-skip-browser-warning': 'true',
//           'Accept': 'application/json',
//         },
//         body: json.encode(preferences),
//       ).timeout(Duration(seconds: 30));
//
//       print('=== RESPONSE DEBUG ===');
//       print('Response status: ${response.statusCode}');
//       print('Response headers: ${response.headers}');
//       print('Response body length: ${response.body.length}');
//       print('Response body: ${response.body}');
//       print('===================');
//
//       if (response.statusCode == 200) {
//         final data = json.decode(response.body);
//         print('Parsed data: $data');
//         print('Data type: ${data.runtimeType}');
//         print('Data keys: ${data.keys}');
//
//         // Check if we have the expected structure
//         if (data is Map && data.containsKey('status') && data['status'] == 'success') {
//           if (data.containsKey('data')) {
//             print('Recommendations data: ${data['data']}');
//             print('About to navigate...');
//
//             // FORCE DEBUG: Show a dialog first to confirm we got here
//             await showDialog(
//               context: context,
//               builder: (ctx) => AlertDialog(
//                 title: Text('Debug: Got Response'),
//                 content: Text('Status: ${data['status']}\nData keys: ${data['data']?.keys ?? 'No data'}'),
//                 actions: [
//                   TextButton(
//                     onPressed: () => Navigator.pop(ctx),
//                     child: Text('OK'),
//                   ),
//                 ],
//               ),
//             );
//
//             // Navigate to recommendations screen
//             if (context.mounted) {
//               Navigator.pushReplacement(
//                 context,
//                 MaterialPageRoute(
//                   builder: (context) => RecommendationsScreen(
//                     recommendations: data['data'],
//                     userPreferences: preferences,
//                   ),
//                 ),
//               );
//             }
//           } else {
//             throw Exception('No data field in response');
//           }
//         } else {
//           throw Exception('Invalid response format: ${data}');
//         }
//       } else {
//         throw Exception('HTTP ${response.statusCode}: ${response.body}');
//       }
//     } catch (e) {
//       print('=== ERROR DEBUG ===');
//       print('Error type: ${e.runtimeType}');
//       print('Error: $e');
//       print('Stack trace: ${StackTrace.current}');
//       print('==================');
//
//       if (context.mounted) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(
//             content: Text('Error: ${e.toString()}'),
//             backgroundColor: Colors.red[600],
//             behavior: SnackBarBehavior.floating,
//             duration: Duration(seconds: 5),
//           ),
//         );
//       }
//     } finally {
//       if (mounted) {
//         setState(() {
//           _isLoading = false;
//         });
//       }
//     }
//   }
// }
//
// // Enhanced RecommendationsScreen with debugging
// class RecommendationsScreen extends StatelessWidget {
//   final Map<String, dynamic> recommendations;
//   final Map<String, dynamic> userPreferences;
//
//   const RecommendationsScreen({
//     Key? key,
//     required this.recommendations,
//     required this.userPreferences,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     print('=== RECOMMENDATIONS SCREEN DEBUG ===');
//     print('Recommendations: $recommendations');
//     print('User preferences: $userPreferences');
//     print('===================================');
//
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Your Recommendations'),
//         backgroundColor: Colors.orange[700],
//       ),
//       body: SingleChildScrollView(
//         padding: EdgeInsets.all(16),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // Debug info section
//             Card(
//               child: Padding(
//                 padding: EdgeInsets.all(16),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text('Debug Info:', style: TextStyle(fontWeight: FontWeight.bold)),
//                     SizedBox(height: 8),
//                     Text('Recommendations type: ${recommendations.runtimeType}'),
//                     Text('Keys: ${recommendations.keys.toList()}'),
//                     if (recommendations.containsKey('historical_sites'))
//                       Text('Historical sites: ${recommendations['historical_sites']?.length ?? 0}'),
//                     if (recommendations.containsKey('food_places'))
//                       Text('Food places: ${recommendations['food_places']?.length ?? 0}'),
//                     if (recommendations.containsKey('services'))
//                       Text('Services: ${recommendations['services']?.length ?? 0}'),
//                   ],
//                 ),
//               ),
//             ),
//             SizedBox(height: 16),
//
//             // Actual recommendations display
//             Text(
//               'Your Personalized Recommendations',
//               style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//             ),
//             SizedBox(height: 16),
//
//             // Historical Sites
//             if (recommendations.containsKey('historical_sites') &&
//                 recommendations['historical_sites'] != null)
//               _buildSection('Historical Sites', recommendations['historical_sites']),
//
//             // Food Places
//             if (recommendations.containsKey('food_places') &&
//                 recommendations['food_places'] != null)
//               _buildSection('Food Places', recommendations['food_places']),
//
//             // Services
//             if (recommendations.containsKey('services') &&
//                 recommendations['services'] != null)
//               _buildSection('Services', recommendations['services']),
//
//             // Fallback if no recommendations
//             if (recommendations.isEmpty)
//               Card(
//                 child: Padding(
//                   padding: EdgeInsets.all(16),
//                   child: Text('No recommendations available.'),
//                 ),
//               ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget _buildSection(String title, List<dynamic>? items) {
//     if (items == null || items.isEmpty) {
//       return SizedBox.shrink();
//     }
//
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           title,
//           style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//         ),
//         SizedBox(height: 8),
//         ...items.map((item) => Card(
//           margin: EdgeInsets.only(bottom: 8),
//           child: ListTile(
//             title: Text(item['name'] ?? 'Unknown'),
//             subtitle: Text(item['description'] ?? item['location'] ?? ''),
//             trailing: item['relevance_score'] != null
//                 ? Text('Score: ${item['relevance_score']}')
//                 : null,
//           ),
//         )).toList(),
//         SizedBox(height: 16),
//       ],
//     );
//   }
// }
//
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';
// // Make sure to import your RecommendationsScreen
// import 'recommendations_screen.dart'; // Add this import
//
// class QuestionnaireScreen extends StatefulWidget {
//   @override
//   _QuestionnaireScreenState createState() => _QuestionnaireScreenState();
// }
//
// class _QuestionnaireScreenState extends State<QuestionnaireScreen> {
//   final PageController _pageController = PageController();
//   int _currentPage = 0;
//
//   // Form data
//   String? _interestType;
//   String? _locationPreference;
//   String? _dietaryPreference;
//   String? _foodType;
//   List<String> _b2bInterests = [];
//
//   bool _isLoading = false;
//
//   final List<String> _pages = [
//     'Historical Interests',
//     'Location Preference',
//     'Food Preferences',
//     'Services'
//   ];
//
//   // API URL - UPDATED WITH YOUR NGROK URL
//   static const String API_URL = '8ca0-110-44-118-28.ngrok-free.app';
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Plan Your Journey'),
//         backgroundColor: Colors.orange[700],
//         elevation: 0,
//         actions: [
//           // Add debug button
//           IconButton(
//             icon: Icon(Icons.bug_report),
//             onPressed: _testApiConnection,
//           ),
//         ],
//       ),
//       body: Column(
//         children: [
//           // Progress indicator
//           Container(
//             padding: EdgeInsets.all(16),
//             child: Row(
//               children: List.generate(_pages.length, (index) {
//                 return Expanded(
//                   child: Container(
//                     height: 4,
//                     margin: EdgeInsets.symmetric(horizontal: 2),
//                     decoration: BoxDecoration(
//                       color: index <= _currentPage
//                           ? Colors.orange[700]
//                           : Colors.grey[300],
//                       borderRadius: BorderRadius.circular(2),
//                     ),
//                   ),
//                 );
//               }),
//             ),
//           ),
//
//           // Page indicator text
//           Padding(
//             padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//             child: Text(
//               '${_currentPage + 1} of ${_pages.length}: ${_pages[_currentPage]}',
//               style: TextStyle(
//                 fontSize: 16,
//                 fontWeight: FontWeight.w500,
//                 color: Colors.grey[600],
//               ),
//             ),
//           ),
//
//           // Page content
//           Expanded(
//             child: PageView(
//               controller: _pageController,
//               onPageChanged: (page) {
//                 setState(() {
//                   _currentPage = page;
//                 });
//               },
//               children: [
//                 _buildInterestTypePage(),
//                 _buildLocationPage(),
//                 _buildFoodPreferencesPage(),
//                 _buildServicesPage(),
//               ],
//             ),
//           ),
//
//           // Navigation buttons
//           Container(
//             padding: EdgeInsets.all(16),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 _currentPage > 0
//                     ? ElevatedButton(
//                   onPressed: _previousPage,
//                   child: Text('Previous'),
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Colors.grey[300],
//                     foregroundColor: Colors.black87,
//                   ),
//                 )
//                     : SizedBox(width: 80),
//
//                 ElevatedButton(
//                   onPressed: _isLoading ? null : (_currentPage == _pages.length - 1
//                       ? _submitQuestionnaire
//                       : _nextPage),
//                   child: _isLoading
//                       ? SizedBox(
//                     width: 20,
//                     height: 20,
//                     child: CircularProgressIndicator(strokeWidth: 2),
//                   )
//                       : Text(_currentPage == _pages.length - 1
//                       ? 'Get Recommendations'
//                       : 'Next'),
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Colors.orange[700],
//                     foregroundColor: Colors.white,
//                     minimumSize: Size(120, 45),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   // Test API connection method
//   Future<void> _testApiConnection() async {
//     try {
//       print('Testing API connection...');
//       final response = await http.get(
//         Uri.parse('https://cfda-110-44-118-28.ngrok-free.app/'),
//         headers: {'ngrok-skip-browser-warning': 'true'},
//       );
//
//       print('Test Response Status: ${response.statusCode}');
//       print('Test Response Body: ${response.body}');
//
//       if (mounted) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(
//             content: Text('API Test: ${response.statusCode == 200 ? 'Success' : 'Failed'}'),
//             backgroundColor: response.statusCode == 200 ? Colors.green : Colors.red,
//           ),
//         );
//       }
//     } catch (e) {
//       print('Test API Error: $e');
//       if (mounted) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(
//             content: Text('API Test Failed: $e'),
//             backgroundColor: Colors.red,
//           ),
//         );
//       }
//     }
//   }
//
//   Widget _buildInterestTypePage() {
//     return SingleChildScrollView(
//       padding: EdgeInsets.all(16),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             'What type of historical sites interest you most?',
//             style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//           ),
//           SizedBox(height: 24),
//           ..._buildRadioOptions(
//             value: _interestType,
//             options: [
//               {'value': 'temples_religious', 'label': 'Temples & Religious Heritage'},
//               {'value': 'ancient_architecture', 'label': 'Ancient Architecture & Palaces'},
//               {'value': 'old_towns', 'label': 'Old Towns & Heritage Areas'},
//               {'value': 'cultural_museums', 'label': 'Cultural Museums & Galleries'},
//               {'value': 'archaeological_ruins', 'label': 'Archaeological Sites & Monuments'},
//             ],
//             onChanged: (value) => setState(() => _interestType = value),
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildLocationPage() {
//     return SingleChildScrollView(
//       padding: EdgeInsets.all(16),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             'Which region would you like to explore?',
//             style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//           ),
//           SizedBox(height: 24),
//           ..._buildRadioOptions(
//             value: _locationPreference,
//             options: [
//               {'value': 'kathmandu_valley', 'label': 'Kathmandu Valley\n(Kathmandu, Patan, Bhaktapur)'},
//               {'value': 'lumbini', 'label': 'Lumbini & Kapilvastu'},
//               {'value': 'gorkha_bandipur', 'label': 'Gorkha, Bandipur & Palpa'},
//               {'value': 'janakpur', 'label': 'Janakpur & Mithila Region'},
//             ],
//             onChanged: (value) => setState(() => _locationPreference = value),
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildFoodPreferencesPage() {
//     return SingleChildScrollView(
//       padding: EdgeInsets.all(16),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             'Food Preferences',
//             style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//           ),
//           SizedBox(height: 24),
//
//           Text(
//             'Dietary Preference:',
//             style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
//           ),
//           SizedBox(height: 12),
//           ..._buildRadioOptions(
//             value: _dietaryPreference,
//             options: [
//               {'value': 'vegetarian', 'label': 'Vegetarian'},
//               {'value': 'vegan', 'label': 'Vegan'},
//               {'value': 'non_vegetarian', 'label': 'Non-Vegetarian'},
//               {'value': 'all', 'label': 'No specific restrictions'},
//             ],
//             onChanged: (value) => setState(() => _dietaryPreference = value),
//           ),
//
//           SizedBox(height: 32),
//
//           Text(
//             'Food Experience Type:',
//             style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
//           ),
//           SizedBox(height: 12),
//           ..._buildRadioOptions(
//             value: _foodType,
//             options: [
//               {'value': 'local_snacks', 'label': 'Street Food & Local Snacks'},
//               {'value': 'traditional_meals', 'label': 'Traditional Full-Course Meals'},
//               {'value': 'high_end', 'label': 'Fine Dining & Upscale Restaurants'},
//             ],
//             onChanged: (value) => setState(() => _foodType = value),
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildServicesPage() {
//     return SingleChildScrollView(
//       padding: EdgeInsets.all(16),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             'Are you interested in any of these services?',
//             style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//           ),
//           SizedBox(height: 8),
//           Text(
//             'Select all that apply (optional)',
//             style: TextStyle(fontSize: 14, color: Colors.grey[600]),
//           ),
//           SizedBox(height: 24),
//           ..._buildCheckboxOptions(
//             selectedValues: _b2bInterests,
//             options: [
//               {'value': 'homestays', 'label': 'Homestays & Heritage Hotels'},
//               {'value': 'traditional_shops', 'label': 'Handicrafts & Traditional Shopping'},
//               {'value': 'guided_tours', 'label': 'Guided Tours & Storytelling'},
//             ],
//             onChanged: (value, isSelected) {
//               setState(() {
//                 if (isSelected) {
//                   _b2bInterests.add(value);
//                 } else {
//                   _b2bInterests.remove(value);
//                 }
//               });
//             },
//           ),
//
//           SizedBox(height: 16),
//           Container(
//             padding: EdgeInsets.all(12),
//             decoration: BoxDecoration(
//               color: Colors.orange[50],
//               borderRadius: BorderRadius.circular(8),
//               border: Border.all(color: Colors.orange[200]!),
//             ),
//             child: Row(
//               children: [
//                 Icon(Icons.info_outline, color: Colors.orange[700], size: 20),
//                 SizedBox(width: 8),
//                 Expanded(
//                   child: Text(
//                     'If none selected, we\'ll focus on historical sites and food recommendations.',
//                     style: TextStyle(fontSize: 12, color: Colors.orange[800]),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   List<Widget> _buildRadioOptions({
//     required String? value,
//     required List<Map<String, String>> options,
//     required ValueChanged<String?> onChanged,
//   }) {
//     return options.map((option) {
//       return Container(
//         margin: EdgeInsets.only(bottom: 8),
//         child: InkWell(
//           onTap: () => onChanged(option['value']),
//           borderRadius: BorderRadius.circular(8),
//           child: Container(
//             padding: EdgeInsets.all(12),
//             decoration: BoxDecoration(
//               border: Border.all(
//                 color: value == option['value']
//                     ? Colors.orange[700]!
//                     : Colors.grey[300]!,
//                 width: value == option['value'] ? 2 : 1,
//               ),
//               borderRadius: BorderRadius.circular(8),
//               color: value == option['value']
//                   ? Colors.orange[50]
//                   : Colors.white,
//             ),
//             child: Row(
//               children: [
//                 Radio<String>(
//                   value: option['value']!,
//                   groupValue: value,
//                   onChanged: onChanged,
//                   activeColor: Colors.orange[700],
//                 ),
//                 SizedBox(width: 8),
//                 Expanded(
//                   child: Text(
//                     option['label']!,
//                     style: TextStyle(
//                       fontSize: 14,
//                       fontWeight: value == option['value']
//                           ? FontWeight.w600
//                           : FontWeight.normal,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       );
//     }).toList();
//   }
//
//   List<Widget> _buildCheckboxOptions({
//     required List<String> selectedValues,
//     required List<Map<String, String>> options,
//     required Function(String, bool) onChanged,
//   }) {
//     return options.map((option) {
//       bool isSelected = selectedValues.contains(option['value']);
//       return Container(
//         margin: EdgeInsets.only(bottom: 8),
//         child: InkWell(
//           onTap: () => onChanged(option['value']!, !isSelected),
//           borderRadius: BorderRadius.circular(8),
//           child: Container(
//             padding: EdgeInsets.all(12),
//             decoration: BoxDecoration(
//               border: Border.all(
//                 color: isSelected
//                     ? Colors.orange[700]!
//                     : Colors.grey[300]!,
//                 width: isSelected ? 2 : 1,
//               ),
//               borderRadius: BorderRadius.circular(8),
//               color: isSelected
//                   ? Colors.orange[50]
//                   : Colors.white,
//             ),
//             child: Row(
//               children: [
//                 Checkbox(
//                   value: isSelected,
//                   onChanged: (bool? value) => onChanged(option['value']!, value ?? false),
//                   activeColor: Colors.orange[700],
//                 ),
//                 SizedBox(width: 8),
//                 Expanded(
//                   child: Text(
//                     option['label']!,
//                     style: TextStyle(
//                       fontSize: 14,
//                       fontWeight: isSelected
//                           ? FontWeight.w600
//                           : FontWeight.normal,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       );
//     }).toList();
//   }
//
//   void _nextPage() {
//     if (_canProceed()) {
//       _pageController.nextPage(
//         duration: Duration(milliseconds: 300),
//         curve: Curves.easeInOut,
//       );
//     } else {
//       _showValidationError();
//     }
//   }
//
//   void _previousPage() {
//     _pageController.previousPage(
//       duration: Duration(milliseconds: 300),
//       curve: Curves.easeInOut,
//     );
//   }
//
//   bool _canProceed() {
//     switch (_currentPage) {
//       case 0:
//         return _interestType != null;
//       case 1:
//         return _locationPreference != null;
//       case 2:
//         return _dietaryPreference != null && _foodType != null;
//       case 3:
//         return true; // Services page is optional
//       default:
//         return false;
//     }
//   }
//
//   void _showValidationError() {
//     String message = '';
//     switch (_currentPage) {
//       case 0:
//         message = 'Please select your historical interest type';
//         break;
//       case 1:
//         message = 'Please select your preferred location';
//         break;
//       case 2:
//         message = 'Please complete your food preferences';
//         break;
//     }
//
//     if (mounted) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Text(message),
//           backgroundColor: Colors.red[600],
//           behavior: SnackBarBehavior.floating,
//         ),
//       );
//     }
//   }
//
//   Future<void> _submitQuestionnaire() async {
//     if (!_canProceed()) {
//       _showValidationError();
//       return;
//     }
//
//     setState(() {
//       _isLoading = true;
//     });
//
//     try {
//       // Prepare the data
//       Map<String, dynamic> preferences = {
//         'interest_type': _interestType,
//         'location_preference': _locationPreference,
//         'dietary_preference': _dietaryPreference,
//         'food_type': _foodType,
//       };
//
//       // Add b2b_interest only if something is selected
//       if (_b2bInterests.isNotEmpty) {
//         preferences['b2b_interest'] = _b2bInterests;
//       } else {
//         preferences['b2b_interest'] = [];
//       }
//
//       print('=== DEBUGGING FLUTTER SUBMISSION ===');
//       print('Sending preferences: ${json.encode(preferences)}');
//       print('API URL: $API_URL');
//       print('====================================');
//
//       // Make API call
//       final response = await http.post(
//         Uri.parse(API_URL),
//         headers: {
//           'Content-Type': 'application/json',
//           'ngrok-skip-browser-warning': 'true',
//           'Accept': 'application/json',
//         },
//         body: json.encode(preferences),
//       ).timeout(Duration(seconds: 30));
//
//       print('=== RESPONSE DEBUG ===');
//       print('Response status: ${response.statusCode}');
//       print('Response body: ${response.body}');
//       print('===================');
//
//       if (response.statusCode == 200) {
//         final data = json.decode(response.body);
//
//         // Handle the response data structure
//         Map<String, dynamic> recommendationsData = {};
//
//         if (data is Map<String, dynamic>) {
//           if (data.containsKey('status') && data['status'] == 'success') {
//             recommendationsData = Map<String, dynamic>.from(data['data'] ?? data['recommendations'] ?? {});
//           } else {
//             recommendationsData = Map<String, dynamic>.from(data);
//           }
//         }
//
//         // Ensure we have the expected structure
//         Map<String, dynamic> finalRecommendations = {
//           'historical_sites': recommendationsData['historical_sites'] ?? [],
//           'food_places': recommendationsData['food_places'] ?? recommendationsData['restaurants'] ?? [],
//           'services': recommendationsData['services'] ?? recommendationsData['b2b_services'] ?? [],
//         };
//
//         print('Final recommendations: $finalRecommendations');
//
//         // Navigate to recommendations screen
//         if (mounted) {
//           Navigator.pushReplacement(
//             context,
//             MaterialPageRoute(
//               builder: (context) => RecommendationsScreen(
//                 recommendations: finalRecommendations,
//                 userPreferences: preferences,
//               ),
//             ),
//           );
//         }
//       } else {
//         throw Exception('HTTP ${response.statusCode}: ${response.body}');
//       }
//     } catch (e) {
//       print('Error: $e');
//
//       if (mounted) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(
//             content: Text('Error: ${e.toString()}'),
//             backgroundColor: Colors.red[600],
//             behavior: SnackBarBehavior.floating,
//             duration: Duration(seconds: 5),
//           ),
//         );
//       }
//     } finally {
//       if (mounted) {
//         setState(() {
//           _isLoading = false;
//         });
//       }
//     }
//   }
// }

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
// Make sure to import your RecommendationsScreen
import 'recommendations_screen.dart'; // Add this import

class QuestionnaireScreen extends StatefulWidget {
  @override
  _QuestionnaireScreenState createState() => _QuestionnaireScreenState();
}

class _QuestionnaireScreenState extends State<QuestionnaireScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  // Form data
  String? _interestType;
  String? _locationPreference;
  String? _dietaryPreference;
  String? _foodType;
  List<String> _b2bInterests = [];

  bool _isLoading = false;

  final List<String> _pages = [
    'Historical Interests',
    'Location Preference',
    'Food Preferences',
    'Services'
  ];

  // API URL - UPDATED WITH YOUR NGROK URL
  static const String API_URL = 'https://cfda-110-44-118-28.ngrok-free.app/recommendations';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Plan Your Journey'),
        backgroundColor: Colors.orange[700],
        elevation: 0,
        actions: [
          // Add debug button
          IconButton(
            icon: Icon(Icons.bug_report),
            onPressed: _testApiConnection,
          ),
        ],
      ),
      body: Column(
        children: [
          // Progress indicator
          Container(
            padding: EdgeInsets.all(16),
            child: Row(
              children: List.generate(_pages.length, (index) {
                return Expanded(
                  child: Container(
                    height: 4,
                    margin: EdgeInsets.symmetric(horizontal: 2),
                    decoration: BoxDecoration(
                      color: index <= _currentPage
                          ? Colors.orange[700]
                          : Colors.grey[300],
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                );
              }),
            ),
          ),

          // Page indicator text
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Text(
              '${_currentPage + 1} of ${_pages.length}: ${_pages[_currentPage]}',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.grey[600],
              ),
            ),
          ),

          // Page content
          Expanded(
            child: PageView(
              controller: _pageController,
              onPageChanged: (page) {
                setState(() {
                  _currentPage = page;
                });
              },
              children: [
                _buildInterestTypePage(),
                _buildLocationPage(),
                _buildFoodPreferencesPage(),
                _buildServicesPage(),
              ],
            ),
          ),

          // Navigation buttons
          Container(
            padding: EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _currentPage > 0
                    ? ElevatedButton(
                  onPressed: _previousPage,
                  child: Text('Previous'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey[300],
                    foregroundColor: Colors.black87,
                  ),
                )
                    : SizedBox(width: 80),

                ElevatedButton(
                  onPressed: _isLoading ? null : (_currentPage == _pages.length - 1
                      ? _submitQuestionnaire
                      : _nextPage),
                  child: _isLoading
                      ? SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  )
                      : Text(_currentPage == _pages.length - 1
                      ? 'Get Recommendations'
                      : 'Next'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange[700],
                    foregroundColor: Colors.white,
                    minimumSize: Size(120, 45),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Test API connection method
  Future<void> _testApiConnection() async {
    try {
      print('Testing API connection...');
      final response = await http.get(
        Uri.parse('https://cfda-110-44-118-28.ngrok-free.app/'),
        headers: {'ngrok-skip-browser-warning': 'true'},
      );

      print('Test Response Status: ${response.statusCode}');
      print('Test Response Body: ${response.body}');

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('API Test: ${response.statusCode == 200 ? 'Success' : 'Failed'}'),
            backgroundColor: response.statusCode == 200 ? Colors.green : Colors.red,
          ),
        );
      }
    } catch (e) {
      print('Test API Error: $e');
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('API Test Failed: $e'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  Widget _buildInterestTypePage() {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'What type of historical sites interest you most?',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 24),
          ..._buildRadioOptions(
            value: _interestType,
            options: [
              {'value': 'temples_religious', 'label': 'Temples & Religious Heritage'},
              {'value': 'ancient_architecture', 'label': 'Ancient Architecture & Palaces'},
              {'value': 'old_towns', 'label': 'Old Towns & Heritage Areas'},
              {'value': 'cultural_museums', 'label': 'Cultural Museums & Galleries'},
              {'value': 'archaeological_ruins', 'label': 'Archaeological Sites & Monuments'},
            ],
            onChanged: (value) => setState(() => _interestType = value),
          ),
        ],
      ),
    );
  }

  Widget _buildLocationPage() {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Which region would you like to explore?',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 24),
          ..._buildRadioOptions(
            value: _locationPreference,
            options: [
              {'value': 'kathmandu_valley', 'label': 'Kathmandu Valley\n(Kathmandu, Patan, Bhaktapur)'},
              {'value': 'lumbini', 'label': 'Lumbini & Kapilvastu'},
              {'value': 'gorkha_bandipur', 'label': 'Gorkha, Bandipur & Palpa'},
              {'value': 'janakpur', 'label': 'Janakpur & Mithila Region'},
            ],
            onChanged: (value) => setState(() => _locationPreference = value),
          ),
        ],
      ),
    );
  }

  Widget _buildFoodPreferencesPage() {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Food Preferences',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 24),

          Text(
            'Dietary Preference:',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
          SizedBox(height: 12),
          ..._buildRadioOptions(
            value: _dietaryPreference,
            options: [
              {'value': 'vegetarian', 'label': 'Vegetarian'},
              {'value': 'vegan', 'label': 'Vegan'},
              {'value': 'non_vegetarian', 'label': 'Non-Vegetarian'},
              {'value': 'all', 'label': 'No specific restrictions'},
            ],
            onChanged: (value) => setState(() => _dietaryPreference = value),
          ),

          SizedBox(height: 32),

          Text(
            'Food Experience Type:',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
          SizedBox(height: 12),
          ..._buildRadioOptions(
            value: _foodType,
            options: [
              {'value': 'local_snacks', 'label': 'Street Food & Local Snacks'},
              {'value': 'traditional_meals', 'label': 'Traditional Full-Course Meals'},
              {'value': 'high_end', 'label': 'Fine Dining & Upscale Restaurants'},
            ],
            onChanged: (value) => setState(() => _foodType = value),
          ),
        ],
      ),
    );
  }

  Widget _buildServicesPage() {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Are you interested in any of these services?',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          Text(
            'Select all that apply (optional)',
            style: TextStyle(fontSize: 14, color: Colors.grey[600]),
          ),
          SizedBox(height: 24),
          ..._buildCheckboxOptions(
            selectedValues: _b2bInterests,
            options: [
              {'value': 'homestays', 'label': 'Homestays & Heritage Hotels'},
              {'value': 'traditional_shops', 'label': 'Handicrafts & Traditional Shopping'},
              {'value': 'guided_tours', 'label': 'Guided Tours & Storytelling'},
            ],
            onChanged: (value, isSelected) {
              setState(() {
                if (isSelected) {
                  _b2bInterests.add(value);
                } else {
                  _b2bInterests.remove(value);
                }
              });
            },
          ),

          SizedBox(height: 16),
          Container(
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.orange[50],
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.orange[200]!),
            ),
            child: Row(
              children: [
                Icon(Icons.info_outline, color: Colors.orange[700], size: 20),
                SizedBox(width: 8),
                Expanded(
                  child: Text(
                    'If none selected, we\'ll focus on historical sites and food recommendations.',
                    style: TextStyle(fontSize: 12, color: Colors.orange[800]),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildRadioOptions({
    required String? value,
    required List<Map<String, String>> options,
    required ValueChanged<String?> onChanged,
  }) {
    return options.map((option) {
      return Container(
        margin: EdgeInsets.only(bottom: 8),
        child: InkWell(
          onTap: () => onChanged(option['value']),
          borderRadius: BorderRadius.circular(8),
          child: Container(
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              border: Border.all(
                color: value == option['value']
                    ? Colors.orange[700]!
                    : Colors.grey[300]!,
                width: value == option['value'] ? 2 : 1,
              ),
              borderRadius: BorderRadius.circular(8),
              color: value == option['value']
                  ? Colors.orange[50]
                  : Colors.white,
            ),
            child: Row(
              children: [
                Radio<String>(
                  value: option['value']!,
                  groupValue: value,
                  onChanged: onChanged,
                  activeColor: Colors.orange[700],
                ),
                SizedBox(width: 8),
                Expanded(
                  child: Text(
                    option['label']!,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: value == option['value']
                          ? FontWeight.w600
                          : FontWeight.normal,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }).toList();
  }

  List<Widget> _buildCheckboxOptions({
    required List<String> selectedValues,
    required List<Map<String, String>> options,
    required Function(String, bool) onChanged,
  }) {
    return options.map((option) {
      bool isSelected = selectedValues.contains(option['value']);
      return Container(
        margin: EdgeInsets.only(bottom: 8),
        child: InkWell(
          onTap: () => onChanged(option['value']!, !isSelected),
          borderRadius: BorderRadius.circular(8),
          child: Container(
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              border: Border.all(
                color: isSelected
                    ? Colors.orange[700]!
                    : Colors.grey[300]!,
                width: isSelected ? 2 : 1,
              ),
              borderRadius: BorderRadius.circular(8),
              color: isSelected
                  ? Colors.orange[50]
                  : Colors.white,
            ),
            child: Row(
              children: [
                Checkbox(
                  value: isSelected,
                  onChanged: (bool? value) => onChanged(option['value']!, value ?? false),
                  activeColor: Colors.orange[700],
                ),
                SizedBox(width: 8),
                Expanded(
                  child: Text(
                    option['label']!,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: isSelected
                          ? FontWeight.w600
                          : FontWeight.normal,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }).toList();
  }

  void _nextPage() {
    if (_canProceed()) {
      _pageController.nextPage(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      _showValidationError();
    }
  }

  void _previousPage() {
    _pageController.previousPage(
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  bool _canProceed() {
    switch (_currentPage) {
      case 0:
        return _interestType != null;
      case 1:
        return _locationPreference != null;
      case 2:
        return _dietaryPreference != null && _foodType != null;
      case 3:
        return true; // Services page is optional
      default:
        return false;
    }
  }

  void _showValidationError() {
    String message = '';
    switch (_currentPage) {
      case 0:
        message = 'Please select your historical interest type';
        break;
      case 1:
        message = 'Please select your preferred location';
        break;
      case 2:
        message = 'Please complete your food preferences';
        break;
    }

    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(message),
          backgroundColor: Colors.red[600],
          behavior: SnackBarBehavior.floating,
        ),
      );
    }
  }

  Future<void> _submitQuestionnaire() async {
    if (!_canProceed()) {
      _showValidationError();
      return;
    }

    setState(() {
      _isLoading = true;
    });

    try {
      // Prepare the data
      Map<String, dynamic> preferences = {
        'interest_type': _interestType,
        'location_preference': _locationPreference,
        'dietary_preference': _dietaryPreference,
        'food_type': _foodType,
      };

      // Add b2b_interest only if something is selected
      if (_b2bInterests.isNotEmpty) {
        preferences['b2b_interest'] = _b2bInterests;
      } else {
        preferences['b2b_interest'] = [];
      }

      print('=== DEBUGGING FLUTTER SUBMISSION ===');
      print('Sending preferences: ${json.encode(preferences)}');
      print('API URL: $API_URL');
      print('====================================');

      // Make API call
      final response = await http.post(
        Uri.parse(API_URL),
        headers: {
          'Content-Type': 'application/json',
          'ngrok-skip-browser-warning': 'true',
          'Accept': 'application/json',
        },
        body: json.encode(preferences),
      ).timeout(Duration(seconds: 30));

      print('=== RESPONSE DEBUG ===');
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');
      print('===================');

      if (response.statusCode == 200) {
        final data = json.decode(response.body);

        // Handle the response data structure
        Map<String, dynamic> recommendationsData = {};

        if (data is Map<String, dynamic>) {
          if (data.containsKey('status') && data['status'] == 'success') {
            recommendationsData = Map<String, dynamic>.from(data['data'] ?? data['recommendations'] ?? {});
          } else {
            recommendationsData = Map<String, dynamic>.from(data);
          }
        }

        // Ensure we have the expected structure
        Map<String, dynamic> finalRecommendations = {
          'historical_sites': recommendationsData['historical_sites'] ?? [],
          'food_places': recommendationsData['food_places'] ?? recommendationsData['restaurants'] ?? [],
          'services': recommendationsData['services'] ?? recommendationsData['b2b_services'] ?? [],
        };

        print('Final recommendations: $finalRecommendations');

        // Navigate to recommendations screen
        if (mounted) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => RecommendationsScreen(
                recommendations: finalRecommendations,
                userPreferences: preferences,
              ),
            ),
          );
        }
      } else {
        throw Exception('HTTP ${response.statusCode}: ${response.body}');
      }
    } catch (e) {
      print('Error: $e');

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error: ${e.toString()}'),
            backgroundColor: Colors.red[600],
            behavior: SnackBarBehavior.floating,
            duration: Duration(seconds: 5),
          ),
        );
      }
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }
}
