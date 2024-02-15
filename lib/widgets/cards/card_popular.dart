import 'package:flutter/material.dart';
import 'package:proilo_app/widgets/imagestack/image_stack.dart';

class MainCardData {
  final String posterPath;
  final String title;
    final String subtitle;


  MainCardData({required this.posterPath, required this.title,required this.subtitle});
}

List<MainCardData> mainCardDataList = [
  MainCardData(posterPath: "assets/logo1.jpg", title: "Author",subtitle: "1234 members",),
  MainCardData(posterPath: "assets/logo2.jpg", title: "writer",subtitle: "18905 members",),
  MainCardData(posterPath: "assets/logo3.png", title: " xbox community",subtitle: "1554 members",),
  MainCardData(posterPath: "assets/logo4.png", title: "github",subtitle: "1564 members ",),
  MainCardData(posterPath: "assets/logo5.png", title: "flutter",subtitle: "5230 members ",),
];

class MainCardHome extends StatelessWidget {
  final String posterPath;
  final String title;
  final String subtitle;

  const MainCardHome({
    Key? key,
    required this.posterPath,
    required this.title,
      required this.  subtitle

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 320,
        height: 150,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: Color.fromARGB(255, 202, 197, 197)), 
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.only(top:8.0,left: 8.0),
              child: Align(
                alignment: Alignment.topLeft,
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 20,
                      backgroundColor: Colors.black87, 
                      foregroundColor: Colors.white, 
                      backgroundImage: AssetImage(posterPath),
                    ),
                    SizedBox(width: 5,),
                    Column(
                      children: [
                        Text(
                                      title,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12,
                                      ),
                                    ),
                                     Text(
                                      subtitle,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 10,
                                      ),
                                    ),
                                    
                      ],
                    ),
                    
                  ],
                ),
              ),
            ),
            Divider(
  thickness: 0.9,
  indent:50,
  endIndent:50
),
           const SizedBox(height: 8),
           ImageStack(
                    imageList: const[
                      CircleAvatar(
                        backgroundImage: AssetImage('assets/img1.jpg'),
                        radius: 20,
                      ),
                      CircleAvatar(
                        backgroundImage: AssetImage('assets/img2.jpg'),
                        radius: 20,
                      ),
                      CircleAvatar(
                        backgroundImage: AssetImage('assets/img3.jpg'),
                        radius: 20,
                      ),
                      CircleAvatar(
                        backgroundImage: AssetImage('assets/img5.jpg'),
                        radius: 20,
                      ),
                      CircleAvatar(
                        backgroundImage: AssetImage('assets/img6.jpg'),
                        radius: 20,
                      ),
                    ],
                    totalRadius: 10,
                  ),
              Padding(
              padding: const EdgeInsets.only(bottom: 8.0, right: 8.0),
              child: Align(
  alignment: Alignment.bottomRight,
  child: Container(
    width: 96,
    height: 30,
    decoration: BoxDecoration(
      color: Colors.blue, 
      borderRadius: BorderRadius.circular(3),
    ),
    child: Center(
      child: TextButton(
        onPressed: () {},
        child:const Text(
          "See More",
          style: TextStyle(color: Colors.white, fontSize: 12),
        ),
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

