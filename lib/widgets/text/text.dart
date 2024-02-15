import 'package:flutter/material.dart';

// ignore: must_be_immutable
class BigText extends StatelessWidget {
   Color? color;
  final String text;
  double size;
   BigText({Key? key, this.color=const Color.fromARGB(255, 15, 17, 15), required this.text,this.size=12,}) :super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
    
      text,
      maxLines: 1,
      style: TextStyle(fontWeight: FontWeight.w600,
    
      fontSize:size,
      color: color),
    );
  }
}