
import 'package:flutter/material.dart';
import 'package:proilo_app/widgets/cards/card_popular.dart';
import 'package:proilo_app/widgets/cards/cards.dart';
import 'package:proilo_app/widgets/cards/numbercard.dart';
import 'package:proilo_app/widgets/text/text.dart';



 List<String> cardBackgrounds = [
  'assets/num6.png',
  'assets/num2.jpg',
  'assets/nums1.jpg',
  'assets/num2.jpg',
  'assets/num4.jpg',
    ];
// ignore: use_key_in_widget_constructors
class SuccessfulLoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Individual MeetUp'),
        leading: IconButton(onPressed: (){}, icon: const Icon(Icons.arrow_back_ios_new_sharp)),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left:20,right:20),
        child: SingleChildScrollView(
          child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start, 
          
            children: [
            TextField(
                        cursorColor:const Color.fromARGB(255, 14, 13, 13),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(56),
                          ),
                          focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
                enabledBorder:const  OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
                          hintText: "Search",
                          // ignore: prefer_const_constructors
                          hintStyle: TextStyle(
                            // ignore: prefer_const_constructors
                            color: Colors.black,
                          ),
                          // ignore: prefer_const_constructors
                          prefixIcon: Icon(
                            Icons.search,
                            color: Colors.black,
                          ),
                          suffixIcon: IconButton(
                            icon: const Icon(
                              Icons.settings_voice,
                              color: Colors.black,
                            ),
                            onPressed: () {},
                          ),
                          prefixIconColor: Colors.black,
                        ),
                        
                      ),
          
         const SizedBox(height: 20,),
          ImageChangingCard(),
               const   SizedBox(height: 20,),
              BigText(text: "Trending Popular People", size: 18, color: Colors.black), 
                Container(
                height: 200,
                width: double.infinity,
                child: ListView(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  children: mainCardDataList.map((data) {
                    return MainCardHome(
                      posterPath: data.posterPath,
                      title: data.title,
                      subtitle: data.subtitle,
                    );
                  }).toList(),
                ),
              ),
              BigText(text: "Top Trending MeetUps", size: 18, color: Colors.black), 
              SizedBox(height: 20,),
           Container(
                height: 200,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: cardBackgrounds.length,
                  itemBuilder: (context, index) {
                    return NumberedCard(
                      index: index,
                      backgroundImage: cardBackgrounds[index],
                    );
                  },
                ),
              ),
          ],),
        ),
      )
    );
  }
}