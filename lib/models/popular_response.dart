// To parse this JSON data, do
//
//     final popularResponse = popularResponseFromJson(jsonString);

import 'dart:convert';

import 'package:movies_app/models/models.dart';

PopularResponse popularResponseFromJson(String str) => PopularResponse.fromJson(json.decode(str));

String popularResponseToJson(PopularResponse data) => json.encode(data.toJson());

class PopularResponse {
    PopularResponse({
        required this.page,
        required this.results,
        required this.totalPages,
        required this.totalResults,
    });

    int page;
    List<Result> results;
    int totalPages;
    int totalResults;

    factory PopularResponse.fromJson(Map<String, dynamic> json) => PopularResponse(
        page: json["page"],
        results: List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
        totalPages: json["total_pages"],
        totalResults: json["total_results"],
    );

    Map<String, dynamic> toJson() => {
        "page": page,
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
        "total_pages": totalPages,
        "total_results": totalResults,
    };
}

