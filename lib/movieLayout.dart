import 'package:flutter/material.dart';
import 'filterScreen.dart';
import 'homeScreen.dart';
import 'listScreen.dart';

class MovieLayout extends StatefulWidget{
  const MovieLayout({Key? key}) : super(key: key);
  @override
  State<MovieLayout> createState() => _MovieLayoutState();
}

class _MovieLayoutState extends State<MovieLayout> {
  int _selectedInd=0;
  List<Widget> Screens=[Filter(),Home(),Movie_List()];
  //List<String> titles=Screens.map((e) => ('$e')).toList();
  List<String> titles=['Filters','Home','Movie'];
  @override
  Widget build(BuildContext context) {

   return Scaffold(
     appBar: AppBar(
        title: Text(
          '${titles[_selectedInd]}',

        ),
     ),
     body: Screens[_selectedInd],
     bottomNavigationBar: BottomNavigationBar(
       items: [
         BottomNavigationBarItem(icon: Icon(Icons.search),label: 'Search'),
         BottomNavigationBarItem(icon: Icon(Icons.home),label: 'Home'),
         BottomNavigationBarItem(icon: Icon(Icons.list),label: 'List'),
       ],
       iconSize: 30,
       selectedFontSize: 20,
       selectedIconTheme: IconThemeData(
         color: Colors.brown[300],
       ),
       currentIndex: _selectedInd,
       type: BottomNavigationBarType.shifting,
       onTap: (ind){
         setState(() {
           _selectedInd=ind;
         });
       },
     ),
   );
  }
}