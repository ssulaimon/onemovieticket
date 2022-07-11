import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:onemovieticket/screen/navigators/edited_container.dart';

import '../../class/api_calls.dart';

class TabLayoutEnglish extends StatefulWidget {
  const TabLayoutEnglish({Key? key}) : super(key: key);

  @override
  State<TabLayoutEnglish> createState() => _TabLayoutEnglishState();
}

class _TabLayoutEnglishState extends State<TabLayoutEnglish> {
  List<dynamic>? trending;
  List<dynamic>? recommended;

  Future<void> movies() async {
    trending = await TrendingApiCall().trendingMovie() as List;
    log(trending.toString());
    recommended = await TrendingApiCall().recommendedMovies() as List;
    log(recommended.toString());
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
              return SingleChildScrollView(
                child: Column(
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
                                title: trending![index]['title'],
                                rating:
                                    trending![index]['vote_average'].toString(),
                                imageurl: trending![index]['poster_path']);
                          }
                        },
                        itemCount: trending?.length,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.0),
                      child: Text(
                        'Recommend for you',
                        style: TextStyle(
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      height: 310,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (BuildContext context, index) {
                          if (recommended == null) {
                            return const Center(
                              child: Text('Error'),
                            );
                          } else {
                            return EditedContainer(
                                title: recommended![index]['title'],
                                rating: recommended![index]['vote_average']
                                    .toString(),
                                imageurl: recommended![index]['poster_path']);
                          }
                        },
                        itemCount: recommended?.length,
                      ),
                    ),
                  ],
                ),
              );
            default:
              return const Text('Something is wrong');
          }
        },
        future: movies());
  }
}
