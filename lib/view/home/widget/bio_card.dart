import 'package:flutter/material.dart';
import '../../../models/user_details_response.dart';

class BioCard extends StatelessWidget {
  const BioCard({super.key, required this.userDetails});

  final UserDetailsResponse? userDetails;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Card(
            elevation: 2,
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: Row(
                children: [
                  Icon(Icons.phone, color: Colors.green),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Phone",
                          style: TextStyle(fontSize: 12, color: Colors.grey),
                        ),
                        Text(
                          userDetails!.data?.info?.phone ?? 'N/A',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                          overflow: TextOverflow.ellipsis,
                          softWrap: true,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(width: 10), // Add spacing between cards
        Expanded(
          child: Card(
            elevation: 2,
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: Row(
                children: [
                  Icon(Icons.calendar_today, color: Colors.green),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Date of Birth",
                          style: TextStyle(fontSize: 12, color: Colors.grey),
                        ),
                        Text(
                          userDetails!.data?.info?.birthDate ?? 'N/A',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          softWrap: true,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}



// import 'package:flutter/material.dart';
//
// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Custom FormField Example',
//       home: Scaffold(
//         appBar: AppBar(title: Text('FormField Example')),
//         body: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: MyWidget(),
//         ),
//       ),
//     );
//   }
// }
//
// class MyWidget extends StatelessWidget {
//   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
//
//   // Email validation
//   String? _validateEmail(String? value) {
//     if (value == null || value.isEmpty) {
//       return 'Email is required';
//     }
//     final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
//     if (!emailRegex.hasMatch(value)) {
//       return 'Enter a valid email';
//     }
//     return null;
//   }
//
//   // Password validation
//   String? _validatePassword(String? value) {
//     if (value == null || value.isEmpty) {
//       return 'Password is required';
//     }
//     if (value.length < 6) {
//       return 'Password must be at least 6 characters';
//     }
//     return null;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Form(
//       key: _formKey,
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           FormField<String>(
//             autovalidateMode: AutovalidateMode.onUserInteraction,
//             initialValue: '',
//             validator: _validateEmail,
//             builder: (FormFieldState<String> state) {
//               return Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   TextField(
//                     keyboardType: TextInputType.emailAddress,
//                     onChanged: (val) {
//                       state.didChange(val);
//                     },
//                     decoration: InputDecoration(
//                       labelText: 'Email',
//                       errorText: state.errorText,
//                     ),
//                   ),
//                 ],
//               );
//             },
//           ),
//           SizedBox(height: 16),
//           FormField<String>(
//             autovalidateMode: AutovalidateMode.onUserInteraction,
//             initialValue: '',
//             validator: _validatePassword,
//             builder: (FormFieldState<String> state) {
//               return Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   TextField(
//                     obscureText: true,
//                     onChanged: (val) {
//                       state.didChange(val);
//                     },
//                     decoration: InputDecoration(
//                       labelText: 'Password',
//                       errorText: state.errorText,
//                     ),
//                   ),
//                 ],
//               );
//             },
//           ),
//           SizedBox(height: 24),
//           ElevatedButton(
//             onPressed: () {
//               if (_formKey.currentState?.validate() == true) {
//                 ScaffoldMessenger.of(context).showSnackBar(
//                   SnackBar(content: Text('Form is valid!')),
//                 );
//               } else {
//                 ScaffoldMessenger.of(context).showSnackBar(
//                   SnackBar(content: Text('Form is invalid')),
//                 );
//               }
//             },
//             child: Text('Login'),
//           ),
//         ],
//       ),
//     );
//   }
// }
