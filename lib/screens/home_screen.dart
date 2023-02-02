import 'package:flutter/material.dart';
import 'package:movies_app/providers/movie_provider.dart';
import 'package:movies_app/widgets/widgets.dart';
import 'package:provider/provider.dart';
import 'package:movies_app/search/search_delegate.dart';

class HomeScreen extends StatelessWidget {
   
  const HomeScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme= Theme.of(context).textTheme;
    final moviesProvider = Provider.of<MoviesProvider>(context,listen: true);

    return Scaffold(
      appBar: AppBar(
        title: Text("Movies in cinema", style: textTheme.headline1 ,),
        actions: [
          IconButton(
            icon: const Icon(Icons.search_rounded),
            onPressed: () => showSearch(context: context, delegate: MovieSearchDelegate()), 
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
