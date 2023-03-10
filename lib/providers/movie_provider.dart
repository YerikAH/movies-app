import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:movies_app/models/models.dart';
import 'package:movies_app/models/search_response.dart';


class MoviesProvider extends ChangeNotifier{
  final String _apiKey = "e5cd398164428a8221fd7b3a3ab14398";
  final String _baseUrl = "api.themoviedb.org";
  final String _language = "en-US";

  List<Result> onDisplayMovies = [];
  List<Result> onPopularMovies = [];
  Map<int, List<Cast>> moviesCast = {};

  int _popularPages = 0;

  MoviesProvider(){
    getOnDisplayMovies();
    getPopularMovies();
  }
  Future<String> _getJsonData( String endpoint, [int page = 1 ]) async{
    final url =
    Uri.https(_baseUrl, endpoint, {
      'api_key':_apiKey,
      'language':_language,
      'page':'$page'
    });
    final response = await http.get(url);
    return response.body;

  }
  getOnDisplayMovies() async{
    final jsonData = await _getJsonData("3/movie/now_playing");

    final decodeData =  NowPlayingResponse.fromJson(jsonDecode(jsonData));
    onDisplayMovies = decodeData.results;
    notifyListeners();
  }
  
  getPopularMovies() async{
    _popularPages++;
    final jsonData = await _getJsonData("3/movie/popular",_popularPages);

    final decodeData =  PopularResponse.fromJson(jsonDecode(jsonData));
    onPopularMovies = [...onPopularMovies,...decodeData.results];
    notifyListeners();
  }

  Future <List<Cast>> getMovieCast(int moviesId) async{
    if(moviesCast.containsKey(moviesId)) return moviesCast[moviesId]!;

    final jsonData = await _getJsonData("3/movie/$moviesId/credits");
    final creditsResponse = CreditsResponse.fromJson(jsonDecode(jsonData));

    moviesCast[moviesId] = creditsResponse.cast;

    return creditsResponse.cast;
    
  }

  Future<List<Result>> searchMovies( String query ) async{
    final url =
    Uri.https(_baseUrl, '3/search/movie', {
      'api_key':_apiKey,
      'language':_language,
      'query':query
    });

    final response = await http.get(url);
    final searchResponse  = SearchResponse.fromJson(jsonDecode(response.body));
    print(searchResponse.results);
    return searchResponse.results;
  }

}
