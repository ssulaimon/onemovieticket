import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:onemovieticket/class/api_calls.dart';
import 'package:onemovieticket/screen/navigators/edited_container.dart';

class TrendingMovie extends StatefulWidget {
  const TrendingMovie({Key? key}) : super(key: key);

  @override
  State<TrendingMovie> createState() => _TrendingMovieState();
}

class _TrendingMovieState extends State<TrendingMovie> {
  late List<dynamic> trending;

  void movies() async {
    trending = await TrendingApiCall().trendingMovie() as List;
    log(trending.toString());
  }

  @override
  void initState() {
    // TODO: implement initState
    movies();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      builder: (BuildContext context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return const Text('Loading');
          case ConnectionState.done:
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  height: 310,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, index) {
                      if (trending == null) {
                        return const Center(
                          child: Text('Error'),
                        );
                      } else {
                        return EditedContainer(
                            title: trending[index]['title'],
                            rating: trending[index]['vote_average'].toString(),
                            imageurl: trending[index]['poster_path']);
                      }
                    },
                    itemCount: trending.length,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: Text(
                    'Recommend for you',
                    style: TextStyle(fontSize: 20.0),
                  ),
                ),
                const SizedBox(
                  width: 50,
                  height: 50,
                )
              ],
            );
          default:
            return const Text('Something is wrong');
        }
      },
      future: TrendingApiCall().trendingMovie(),
    );
  }
}
