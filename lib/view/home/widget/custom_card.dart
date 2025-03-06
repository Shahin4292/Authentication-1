// import 'package:flutter/material.dart';
//
// import '../../../models/user_details_response.dart';
//
// class CustomCard extends StatelessWidget {
//   final Hobbies hobbies;
//
//   const CustomCard({super.key, required this.hobbies});
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.only(right: 8),
//       child: SizedBox(
//         height: 130,
//         width: 130,
//         child: Card(
//           color: Colors.white,
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               hobbies.image != null && hobbies.image!.isNotEmpty
//                   ? Image.network(
//                 hobbies.image!,
//                 height: 40,
//                 width: 40,
//                 fit: BoxFit.cover,
//                 loadingBuilder: (context, child, loadingProgress) {
//                   if (loadingProgress == null) {
//                     return child; // Image successfully loaded
//                   }else{
//                     return Center(
//                       child: SizedBox(
//                         height: 20,
//                         width: 20,
//                         child: CircularProgressIndicator(strokeWidth: 2),
//                       ),
//                     );
//                   }
//                 },
//                 errorBuilder: (context, error, stackTrace) => Icon(
//                   Icons.image_not_supported,
//                   size: 40,
//                   color: Colors.grey,
//                 ),
//               )
//                   : Center(
//                 child: CircularProgressIndicator(),
//               ),
//
//               // Image.network(
//               //   hobbies.image ?? '',
//               //   height: 40,
//               //   width: 40,
//               // ),
//               SizedBox(height: 5),
//               Text(
//                 hobbies.name ?? '',
//                 style: TextStyle(
//                   fontSize: 12,
//                   color: Colors.black,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';

import '../../../models/user_details_response.dart';

class CustomCard extends StatelessWidget {
  final Hobbies hobbies;

  const CustomCard({super.key, required this.hobbies});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(right: 8),
      child: SizedBox(
        height: 130,
        width: 130,
        child: Card(
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              hobbies.image != null && hobbies.image!.isNotEmpty
                  ? Image.network(
                hobbies.image!,
                height: 40,
                width: 40,
                fit: BoxFit.cover,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) {
                    return child; // Image successfully loaded
                  } else {
                    return Center(
                      child: SizedBox(
                        height: 20,
                        width: 20,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                        ),
                      ),
                    );
                  }
                },
                errorBuilder: (context, error, stackTrace) {
                  return Icon(
                    Icons.image_not_supported,
                    size: 40,
                    color: Colors.grey,
                  );
                },
              )
                  : Center(
                child: CircularProgressIndicator(),
              ),
              SizedBox(height: 5),
              Text(
                hobbies.name ?? '',
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
