import 'package:flutter/material.dart';

class BackgroundImage extends StatelessWidget {
  final String imagePath;

  BackgroundImage(this.imagePath);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(imagePath),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
