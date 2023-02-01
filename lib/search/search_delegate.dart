import 'package:flutter/material.dart';
import 'package:movies_app/theme/app_theme.dart';
import 'package:movies_app/providers/movie_provider.dart';
import 'package:provider/provider.dart';
import 'package:movies_app/models/models.dart';


class MovieSearchDelegate extends SearchDelegate{
  
  @override
  String get searchFieldLabel => "Search movie";

  @override
  List<Widget> buildActions(BuildContext context){
    return [ IconButton(
	icon: Icon(Icons.clear),
	onPressed: () => query = '',
      ) ];
  }

  @override
  Widget buildLeading(BuildContext context){
    return IconButton(
	onPressed: () => close(context, null),
	icon: Icon(Icons.arrow_back_rounded),
      );
  }

  @override
  Widget buildResults(BuildContext context){
    return Text("my build results", style: TextStyle(color:  AppTheme.textColor));
  }
  
  Widget _emptyContainer(){
    return const Center(
	child: Icon(
	  Icons.movie_creation_outlined, 
	  color: Colors.black38, 
	  size: 130.0,
	),
    );
    
  }


  @override
  Widget buildSuggestions(BuildContext context){
    
    if(query.isEmpty){
      return _emptyContainer();
    }

  final moviesProvider = Provider.of<MoviesProvider>(context, listen: false);
  return  FutureBuilder(
      future:moviesProvider.getSearchMovie(query),
      builder: ( _ , AsyncSnapshot<List<Result>> snapshot){
	if (!snapshot.hasData) return _emptyContainer();
	return Container();
      },
    );
  }
}
