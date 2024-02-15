import 'package:flutter/material.dart';
import 'package:proilo_app/screens/description.dart';

class NumberedCard extends StatelessWidget {
  final int index;
  final String backgroundImage;

  const NumberedCard({super.key, required this.index, required this.backgroundImage});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const DescriptiionPage()
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        width: 200.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.0),
          image: DecorationImage(
            image: AssetImage(backgroundImage),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [
            Positioned(
              bottom: 8.0,
              right: 8.0,
              child: Container(
                width: 70,
                height: 80,
                padding:const  EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Center(
                  child: Text(
                    '${index + 1}',
                    style: const TextStyle(
                      color: Color.fromARGB(255, 22, 17, 103),
                      fontWeight: FontWeight.w900,
                      fontSize: 58
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
