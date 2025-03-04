import 'package:flutter/cupertino.dart';

class ModifiedText extends StatelessWidget {
  final String text;
  final Color color;
  final double size;
  final FontWeight fontWeight;

  const ModifiedText(
      {super.key,
      required this.text,
      required this.color,
      required this.size,
      required this.fontWeight});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(color: color, fontSize: size, fontWeight: fontWeight),
    );
  }
}

class BoldText extends StatelessWidget {
  final String text;
  final double size;
  final Color color;

  const BoldText(
      {super.key, required this.text, required this.size, required this.color});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style:
          TextStyle(color: color, fontSize: size, fontWeight: FontWeight.bold),
    );
  }
}
