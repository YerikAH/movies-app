import 'package:flutter/material.dart';
import 'package:movies_app/theme/app_theme.dart';


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

  @override
  Widget buildSuggestions(BuildContext context){
    if(query.isEmpty){
      return Container(
	child: Center(
	  child: Icon(Icons.movie_creation_outlined, size: 100.0, color: Colors.black38,),
	),
      );
    }
    return Container();
  }
}
