import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  final String title;
  final double elevation;
  final Color bgColor;

  const CustomAppBar({
    required this.title,
    Key? key,
    required this.elevation,
    this.bgColor = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: bgColor,
      title: Text(
        title,
        style: const TextStyle(color: Colors.black54),
      ),
      elevation: elevation,
      leading: const BackButton(
        color: Colors.black54,
      ),
    );
  }
}
