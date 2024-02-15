import 'package:flutter/material.dart';

class ImageStack extends StatelessWidget {
  final List<Widget> imageList;
  final double totalRadius;
  final IconData? trailingIcon;

  ImageStack({
    required this.imageList,
    required this.totalRadius,
    this.trailingIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          for (var i = 0; i < imageList.length; i++)
            imageList[i],
          if (trailingIcon != null)
            Padding(
              padding: const EdgeInsets.only(left: 2), 
              child: Icon(trailingIcon, size: 24),
            ),
        ],
      ),
    );
  }
}

