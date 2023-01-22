import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class MoviesProvider extends ChangeNotifier{
  String _apiKey = "e5cd398164428a8221fd7b3a3ab14398";
  String _baseUrl = "api.themoviedb.org";
  String _language = "en-US";

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
    final Map<String, dynamic> decodeData = json.decode( response.body);
    print(response.body);
    print(decodeData);
  }
}