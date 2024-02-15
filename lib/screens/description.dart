import 'package:flutter/material.dart';
import 'package:proilo_app/widgets/cards/descard.dart';
import 'package:proilo_app/widgets/text/text.dart';

class DescriptiionPage extends StatefulWidget {
  const DescriptiionPage({super.key});

  @override
  State<DescriptiionPage> createState() => _DescriptiionPageState();
}

class _DescriptiionPageState extends State<DescriptiionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(        title: const Text('Description')),

             body: Padding(
               padding: const EdgeInsets.all(28.0),
               child: SingleChildScrollView(
                 child: Column(
                   children: [
                const  des(),
                 Row(children: [
               IconButton(onPressed: (){}, icon:const  Icon(Icons.turned_in_not_outlined),
               color: Colors.black,
                ),
               const Text("1233"),
                  IconButton(onPressed: (){}, icon:const Icon(Icons.favorite_border_outlined),
  
                  ),
              const Text("1237"),
                 const SizedBox(width: 5,),

              Container(
               width: 120,
               height: 30,
               decoration: BoxDecoration(borderRadius: BorderRadius.circular(5),
                color: const Color.fromARGB(255, 245, 240, 240),
               ),
      child: Center(
        child: Wrap(
          children: List.generate(5, (index) {return Icon(Icons.star,color:Color.fromARGB(255, 127, 184, 217),size:17);}),
          
                      ),
      ),
    ),
      const SizedBox(width: 5,),
                 const Text("3.2")
               ],)    ,
              Align(
                alignment: Alignment.topLeft,
                child: 
                    BigText(text: "Author", size: 18, color: Colors.black),),
             const Align(
                  alignment: Alignment.topLeft,
                      child: Text("Indian Actress",style: TextStyle(fontSize: 18,color: Colors.grey),)),
                   const SizedBox(height: 10,),
               Row(       
                children: [
                   Align(
                   alignment: Alignment.topLeft,
                       child: IconButton(onPressed: (){}, icon:const  Icon(Icons.access_time_outlined))),
                       const Text("Duration 20 mins,",style: TextStyle(fontSize: 18,color: Colors.grey),),
                      ],
                    ),
                    Row(
                      children: [
                        IconButton(onPressed: (){}, icon:const Icon(Icons.wallet)),
                         const Text("Total Average Fee 9999,",style: TextStyle(fontSize: 18,color: Colors.grey),)
                      ],),
                  Align(
                       alignment: Alignment.topLeft,
                       child: BigText(text: "About", size: 18, color: Colors.black)),
                      const Text("Basically, Dialogflow is a development suite for building conversational UI.It can analyze multiple types of input from users, including text or audio inputs (like from a phone or voice recording). It can also respond to the users in a couple of ways, either through text or with synthetic speech."),
              const  Align(
                    alignment: Alignment.bottomRight, 
                    child: Text("see more",style: TextStyle(color: Colors.blue),))
                   ],
                 ),
               ),
             ),

    );
  }
}