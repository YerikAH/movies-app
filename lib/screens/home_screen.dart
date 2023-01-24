import 'package:flutter/material.dart';
import 'package:movies_app/providers/movie_provider.dart';
import 'package:movies_app/widgets/widgets.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
   
  const HomeScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {

    final moviesProvider = Provider.of<MoviesProvider>(context,listen: true);

    // El listen es para que se vuelva a redibujar, true si, false no, debe de estar en false si esta dentro de un metodo.
    return Scaffold(
      appBar: AppBar(
        title: const Text("Movies in cinema "),
        actions: [
          IconButton(
            onPressed: (){}, 
            icon: const Icon(Icons.search_rounded)
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CardSwiper(movies: moviesProvider.onDisplayMovies),
            MovieSlider(moviesPopular: moviesProvider.onPopularMovies, onNextPage: ()=>moviesProvider.getPopularMovies())
          ],
        ),
      )
    );
  }
}