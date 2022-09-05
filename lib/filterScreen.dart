import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Movie.dart';
import 'callAPI.dart';

class Filter extends StatefulWidget {
  @override
  State<Filter> createState() => _FilterState();
}

class _FilterState extends State<Filter> {
  String txt = '';
  MovieModel movie =
      MovieModel(title: '', id: 0, image: 'image', popularity: 0.0);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            onChanged: (val) {
              setState(() {
                txt = val;
                CallAPI().getMovie(880009);
              });
            },
            style: TextStyle(fontSize: 18),
          ),
        ),
        // Stack(
        //   children: [
        //     Card(
        //       shape: Border.all(
        //         width: 2,
        //         color: Colors.brown,
        //       ),
        //       child: Image.network(
        //         movie.img,
        //       ),
        //     ),
        //     Container(
        //       decoration: BoxDecoration(
        //         color: (movie.popularity > 5000)
        //             ? Colors.amberAccent
        //             : Colors.blueAccent,
        //         borderRadius: BorderRadius.all(Radius.circular(
        //                 7) //                 <--- border radius here
        //             ),
        //       ),
        //       padding: const EdgeInsets.all(12.0),
        //       child: (movie.popularity > 5000)
        //           ? Text(
        //               'Popular',
        //               style: TextStyle(
        //                 fontSize: 15,
        //                 color: Colors.black26,
        //                 fontWeight: FontWeight.bold,
        //               ),
        //             )
        //           : Text(
        //               'New',
        //               style: TextStyle(
        //                 fontSize: 15,
        //                 color: Colors.black26,
        //                 fontWeight: FontWeight.bold,
        //               ),
        //             ),
        //     ),
        //   ],
        // ),
        ListTile(
          title: Text('${movie.title}'),
          trailing: Icon(Icons.star),
        ),
      ],
    );
  }
}
