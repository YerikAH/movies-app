import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:movies_app/models/models.dart';



class MoviesProvider extends ChangeNotifier{
  final String _apiKey = "e5cd398164428a8221fd7b3a3ab14398";
  final String _baseUrl = "api.themoviedb.org";
  final String _language = "en-US";

  List<Result> onDisplayMovies = [];
  List<Result> onPopularMovies = [];

  MoviesProvider(){
    print("Movie provider inicializado");
    this.getOnDisplayMovies();
    this.getOnDisplayMovies();
  }

  getOnDisplayMovies() async{
    var url =
    Uri.https(_baseUrl, '3/movie/now_playing', {
      'api_key':_apiKey,
      'language':_language,
      'page':'1'
    });
    final response = await http.get(url);

    final decodeData =  NowPlayingResponse.fromJson(jsonDecode(response.body));
    onDisplayMovies = decodeData.results;
    notifyListeners();
  }
  
  getPopularMovies() async{
    var url =
    Uri.https(_baseUrl, '3/movie/popular', {
      'api_key':_apiKey,
      'language':_language,
      'page':'1'
    });
    final response = await http.get(url);

    final decodeData =  PopularResponse.fromJson(jsonDecode(response.body));
    onPopularMovies = [...onPopularMovies,...decodeData.results];
    print(onPopularMovies[0]);
    notifyListeners();
  }
}