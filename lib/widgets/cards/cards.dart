
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';

class ImageChangingCard extends StatefulWidget {
  @override
  _ImageChangingCardState createState() => _ImageChangingCardState();
}

class _ImageChangingCardState extends State<ImageChangingCard> {
  List<String> imagePaths = [
    'assets/tech3.jpeg',
    'assets/tech1.jpg',
    'assets/tech4.jpg',
    'assets/tech2.jpg',
    'assets/tech5.jpg',
  ];

  int currentImageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          currentImageIndex = (currentImageIndex + 1) % imagePaths.length;
        });
      },
      child: Column(
        children: [
          Card(
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.0),
            ),
            child: Container(
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.0),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(imagePaths[currentImageIndex]),
                ),
              ),
            ),
          ),
          DotsIndicator(
            dotsCount: imagePaths.length,
            position: currentImageIndex,
            decorator: DotsDecorator(
              activeColor: Colors.green,
              size: const Size.square(9.0),
              activeSize: const Size(18.0, 9.0),
              activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
