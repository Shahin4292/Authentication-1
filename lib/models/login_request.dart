class LoginRequest {
  final String email;
  final String password;

  LoginRequest({
    required this.email,
    required this.password});

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
    };
  }
}






// import 'dart:convert';
//
// import 'package:alora_suite/controller/localization_controller.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// import '../../util/app_constants.dart';
// import '../auth/controller/auth_controller.dart';
//
// class HomeScreen extends StatefulWidget {
//   HomeScreen({super.key});
//
//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }
//
// class _HomeScreenState extends State<HomeScreen> {
//   final authController = Get.find<AuthController>();
//   late Map<String, dynamic> userData;
//
//   @override
//   void initState() {
//     super.initState();
//     _loadUserData();
//   }
//
//   // Load user data from shared preferences
//   void _loadUserData() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     String? userDataString = prefs.getString(AppConstants.userData);
//
//     if (userDataString != null) {
//       // If userData exists, decode it
//       setState(() {
//         userData = jsonDecode(userDataString); // Assuming it's a JSON string
//       });
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text("Welcome, ${userData["user"]["name"]}", style: TextStyle(fontSize: 24)),
//             Text('home'.tr),
//             ElevatedButton(
//               onPressed: authController.logOut,
//               child: Text("LogOut"),
//             ),
//             TextButton(
//               onPressed: () {
//                 Get.find<LocalizationController>().setLanguage(
//                   Locale(
//                     Get.locale?.languageCode == 'en' ? 'ar' : 'en',
//                     Get.locale?.countryCode == 'US' ? 'SA' : 'US',
//                   ),
//                 );
//               },
//               child: Text('Change Localization'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
