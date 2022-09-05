import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Movie.dart';
import 'callAPI.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  List<MovieModel> movies = [];
  initState() {
    super.initState();
    callApi();
    print('hi');
    // Add listeners to this class
  }

  callApi() async {
    List<MovieModel> Movies = await CallAPI().getMovies();
    setState(() {
      movies = Movies;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GridView.builder(
        gridDelegate:  const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 350,
          childAspectRatio: 0.5,
        ),
        padding: const EdgeInsets.all(8.0),
        itemBuilder: (context, ind) {
          print('mshmsh');
          return buildItem(movies[ind]);
        },
        itemCount: movies.length,
      ),
    );
  }
}

Widget buildItem(MovieModel movie) {
  return Column(
    children: [
      Stack(
        children: [
          Card(
            shape: Border.all(
              width: 2,
              color: Colors.brown,
            ),
            child: Image.network(
              movie.img,
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color:
              (movie.popularity > 5000) ? Colors.amberAccent : Colors.blueAccent,
              borderRadius: BorderRadius.all(
                  Radius.circular(7) //                 <--- border radius here
                  ),
            ),
            padding: const EdgeInsets.all(12.0),
            child: (movie.popularity > 5000)
                ? Text(
                    'Popular',
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.black26,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                : Text(
                    'New',
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.black26,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

          ),
        ],
      ),
      ListTile(

        title: Text('${movie.title}'),
        trailing: Icon(Icons.star),
      ),
    ],
  );
}
