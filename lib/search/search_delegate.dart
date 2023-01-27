import 'package:flutter/material.dart';

class MovieSearchDelegate extends SearchDelegate{
  @override
  List<Widget> buildActions(BuildContext context){
    return [ Text(" my build actions") ];
  }

  @override
  Widget buildLeading(BuildContext context){
    return Text(" my build leading ");
  }

  @override
  Widget buildResults(BuildContext context){
    return Text("my build results");
  }

  @override
  Widget buildSuggestions(BuildContext context){
    return Text("buildSuggestions");
  }
}
