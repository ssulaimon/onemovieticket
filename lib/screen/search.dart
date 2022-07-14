// ignore_for_file: sort_child_properties_last

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:onemovieticket/class/api_calls.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  late TextEditingController controller;
  String qurey = 'avengers';
  List? list;
  Future<void> result() async {
    list = await TrendingApiCall().search(qurey: qurey);
  }

  @override
  void initState() {
    // TODO: implement initState
    controller = TextEditingController();
    result();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(20.0, 20.0, 0.0, 0.0),
            child: Row(children: [
              Expanded(
                child: TextField(
                  controller: controller,
                  decoration: InputDecoration(
                    hintText: "Search Movie",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
                flex: 4,
              ),
              Expanded(
                child: IconButton(
                  onPressed: () {
                    qurey = controller.text;
                    setState(() {
                      result();
                    });
                  },
                  icon: const Icon(Icons.search),
                  iconSize: 30,
                ),
                flex: 1,
              )
            ]),
          ),
          FutureBuilder(
            builder: (context, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.waiting:
                  return const Center(
                    child: Padding(
                      padding: EdgeInsets.only(top: 50),
                      child: SpinKitDoubleBounce(
                        color: Colors.red,
                      ),
                    ),
                  );
                  break;
                case ConnectionState.done:
                  return Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 10.0,
                            crossAxisSpacing: 10.0,
                          ),
                          itemCount: list!.length,
                          itemBuilder: (context, index) {
                            return Container(
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: NetworkImage(
                                        'https://image.tmdb.org/t/p/original${list?[index]['backdrop_path']} ',
                                      ),
                                      fit: BoxFit.cover)),
                            );
                          }),
                    ),
                  );
                default:
                  return const Center(
                    child: Text('An error occured here'),
                  );
                  break;
              }
            },
            future: result(),
          )
        ],
      ),
    );
  }
}
