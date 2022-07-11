import 'dart:convert';

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
}
