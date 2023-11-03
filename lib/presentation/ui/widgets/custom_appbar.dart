import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  final String title;
  final double elevation;

  const CustomAppBar({
    required this.title,
    Key? key, required this.elevation,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
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
