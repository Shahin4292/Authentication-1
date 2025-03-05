import 'package:flutter/material.dart';

import '../../../models/user_details_response.dart';

class CustomCard extends StatelessWidget {
  final Hobbies hobbies;

  const CustomCard({
    super.key,
    required this.hobbies,
  });

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
                  ? Image.network(hobbies.image ?? '', height: 40, width: 40)
                  : Center(
                  child: CircularProgressIndicator(
                    backgroundColor: Colors.black,
                  )),
              SizedBox(height: 5),
              // Spacing between the image and text
              Text(hobbies.name ?? '',
                  style: TextStyle(
                      fontSize: 12,
                      color: Colors.black,
                      fontWeight: FontWeight.bold)),
            ],
          ),
        ),
      ),
    );
  }
}