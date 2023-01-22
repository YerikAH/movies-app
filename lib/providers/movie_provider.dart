import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:movies_app/models/models.dart';


class MoviesProvider extends ChangeNotifier{
  String _apiKey = "e5cd398164428a8221fd7b3a3ab14398";
  String _baseUrl = "api.themoviedb.org";
  String _language = "en-US";

  List<Result> onDisplayMovies = [];
  MoviesProvider(){
    print("Movie provider inicializado");
    this.getOnDisplayMovies();
  }
  getOnDisplayMovies() async{
    var url =
    Uri.https(_baseUrl, '3/movie/now_playing', {
      'api_key':_apiKey,
      'language':_language,
      'page':'1'
    });

      // Await the http get response, then decode the json-formatted response.
    final response = await http.get(url);

    final decodeData =  NowPlayingResponse.fromJson(jsonDecode(response.body));
    print(decodeData.results[0].title);
    onDisplayMovies = decodeData.results;

    notifyListeners();
  }
}