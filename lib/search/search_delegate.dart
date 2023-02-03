import 'package:flutter/material.dart';
import 'package:movies_app/providers/movie_provider.dart';
import 'package:provider/provider.dart';
import 'package:movies_app/models/models.dart';

class MovieSearchDelegate extends SearchDelegate {
  @override
  String get searchFieldLabel => "Search movie";

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () => query = '',
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () => close(context, null),
      icon: const Icon(Icons.arrow_back_rounded),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Text("my build results",
        style: Theme.of(context).textTheme.bodyText1);
  }

  Widget _emptyContainer() {
    return const Center(
      child: Icon(
        Icons.movie_creation_outlined,
        color: Colors.black38,
        size: 130.0,
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query.trim().isEmpty) {
      return _emptyContainer();
    }

    final moviesProvider = Provider.of<MoviesProvider>(context, listen: false);

    return FutureBuilder(
      future: moviesProvider.searchMovies(query),
      builder: (_, AsyncSnapshot<List<Result>> snapshot) {
        if (!snapshot.hasData) {
          return _emptyContainer();
        } else {
          final movies = snapshot.data!;
          return ListView.builder(
            itemBuilder: (context, index) => _MovieItem(movies[index]),
            itemCount: movies.length,
          );
        }
      },
    );
  }
}

class _MovieItem extends StatelessWidget {
  final Result movie;
  const _MovieItem(this.movie);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: FadeInImage(
        placeholder: const AssetImage("assets/no-image.jpg"),
        image: NetworkImage(movie.fullPosterImg),
        width: 50.0,
        fit: BoxFit.contain,
      ),
      title: Text(movie.title!,style: Theme.of(context).textTheme.subtitle1,),
      subtitle: Text(movie.originalTitle!, style: Theme.of(context).textTheme.bodyText1,),
      onTap: () {
        Navigator.pushNamed(context, 'details', arguments: movie);
      },
    );
  }
}
