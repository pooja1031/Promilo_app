import 'package:flutter/material.dart';
import 'package:proilo_app/widgets/icon/iconsrow.dart';



// ignore: camel_case_types
class des extends StatefulWidget {
  const des({super.key});

  @override
  State<des> createState() => _desState();
}

// ignore: camel_case_types
class _desState extends State<des> {
  int selectedImageIndex = 0;
  List<String> assetImagePaths = [
    "assets/img1.jpg",
    "assets/tech2.jpg",
    "assets/tech4.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedImageIndex = (selectedImageIndex + 1) % assetImagePaths.length;
        });
      },
      child: Stack(
        children: [Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(30),
          color: const Color.fromARGB(255, 218, 216, 216)),
          height: 400,
        child: const Align(
          alignment: Alignment.bottomLeft,
          child: IconRow()),
        ),
        Container(
          height: 340,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20), 
                        color: Colors.black,

            ),
          
           child: ClipRRect(
                          borderRadius: BorderRadius.circular(20), 

             child: Image.asset(
                  assetImagePaths[selectedImageIndex],
                  fit: BoxFit.cover,
                ),
           ),
           
              
        )
        ],
      ),
    );
  }
}