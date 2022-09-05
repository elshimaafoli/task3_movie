import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MovieDetailScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
   return SafeArea(
     child: Column( children:[
       Stack(
         children: [
           IconButton(onPressed: (){}, icon: Icon(Icons.arrow_back_ios)),
           Image(image: AssetImage('')),
         ],
       ),
     ] ),
   );
  }


}