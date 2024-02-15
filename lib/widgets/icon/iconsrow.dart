import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class IconRow extends StatelessWidget {
  const IconRow({super.key});
 @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        IconButton(
          icon: Icon(Icons.save_alt),
                    onPressed: (){},

        ),
        IconButton(
          icon: Icon(Icons.turned_in_not_outlined),
                    onPressed: (){},

        ),
        
         IconButton(
          icon: Icon(Icons.favorite_border_outlined),
                    onPressed: (){},


        ),
         IconButton(
          icon: Icon(Icons.zoom_in_map_outlined),
                    onPressed: (){},


        ),
        IconButton(
          icon: Icon(Icons.star_border_outlined),
          onPressed: (){},
        ),
        IconButton(
          icon: Icon(Icons.share_outlined),
                    onPressed: (){
                              Share.share('Check !');

                    },


        ),
      ],
    );
  }
}