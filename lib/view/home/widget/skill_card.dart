import 'package:flutter/material.dart';

import '../../../models/user_details_response.dart';

class SkillCard extends StatelessWidget {
  const SkillCard({
    super.key,
    required this.userDetails,
  });

  final UserDetailsResponse? userDetails;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: userDetails!.data?.skills?.map((skill) {
        return Container(
          padding: EdgeInsets.only(right: 8),
          child: SizedBox(
            height: 90,
            width: 90,
            child: Card(
              color: Colors.white,
              child: Center(
                  child: Text(
                    skill,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 14),
                  )),
            ),
          ),
        );
      }).toList() ??
          [],
    );
  }
}