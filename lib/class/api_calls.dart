import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart';

class TrendingApiCall {
  Future<List?> trendingMovie() async {
    var uri = Uri.parse(
        'https://api.themoviedb.org/3/trending/movie/day?api_key=a230630bbc58e1a0e2da2e984b3da0e5');
    Response response = await get(uri);
    if (response.statusCode == 200) {
      Map body = await jsonDecode(response.body);
      List movies = body['results'];
      return (movies);
    } else {
      return (null);
    }
  }

  Future<List?> recommendedMovies() async {
    var uri = Uri.parse(
        'https://api.themoviedb.org/3/movie/popular?api_key=a230630bbc58e1a0e2da2e984b3da0e5&language=en-US&page=1');
    Response response = await get(uri);
    if (response.statusCode == 200) {
      Map body = await jsonDecode(response.body);
      List movies = await body['results'];
      return movies;
    } else {
      return null;
    }
  }

  Future<List?> search({required String qurey}) async {
    var uri = Uri.parse(
        'https://api.themoviedb.org/3/search/movie?api_key=a230630bbc58e1a0e2da2e984b3da0e5&language=en-US&query=$qurey&page=1&include_adult=false');

    Response response = await get(uri);
    log(response.body.toString());
    if (response.statusCode == 200) {
      Map map = await jsonDecode(response.body);
      List result = await map['results'];
      return result;
    } else {
      return null;
    }
  }
}
