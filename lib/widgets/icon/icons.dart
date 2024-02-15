import 'package:flutter/material.dart';

class SquareTile extends StatelessWidget {
  final String imagePath;

   SquareTile({Key? key, required this.imagePath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(5),
      child: Container(
        color: Colors.white, 
        child: Image.asset(
          imagePath,
          height: 35,
          width: 35,
          fit: BoxFit.cover, 
        ),
      ),
    );
  }
}
