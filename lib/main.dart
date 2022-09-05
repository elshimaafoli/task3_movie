import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/movieLayout.dart';

void main()=>runApp(MovieApp());

class MovieApp extends StatefulWidget{
  @override
  State<MovieApp> createState() => _MovieAppState();
}

class _MovieAppState extends State<MovieApp> {
  @override
  Widget build(BuildContext context) {
   return MaterialApp(
     debugShowCheckedModeBanner: false,
     theme: ThemeData.dark().copyWith(
       iconTheme: IconThemeData(color: Colors.brown[250]),
     ),
     home:MovieLayout(),
   );
  }
}