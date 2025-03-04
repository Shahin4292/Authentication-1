import 'package:flutter/material.dart';

import '../colors/app_colors.dart';

class RoundButton extends StatelessWidget {
  final String title;
  final double height, width;
  final VoidCallback onPress;

  const RoundButton({
    super.key,
    required this.title,
    required this.height,
    required this.width,
    required this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
            color: AppColor.blackShade, borderRadius: BorderRadius.circular(14)),
        child: Center(
          child: Text(title,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                  color: Colors.white)),
        ),
      ),
    );
  }
}
