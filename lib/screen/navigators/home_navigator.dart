import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:onemovieticket/screen/navigators/draw.dart';
import 'package:onemovieticket/screen/navigators/trending_movie_tab.dart';

class HomeNavigator extends StatefulWidget {
  const HomeNavigator({Key? key}) : super(key: key);

  @override
  State<HomeNavigator> createState() => _HomeNavigatorState();
}

class _HomeNavigatorState extends State<HomeNavigator> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        backgroundColor: Colors.white,
        drawer: const ProfileDrawer(),
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.white,
          centerTitle: true,
          title: const Text(
            "Welcome username",
            style: TextStyle(color: Colors.black),
          ),
          leading: Builder(builder: (BuildContext context) {
            return IconButton(
                color: Colors.black,
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
                icon: const Icon(Iconsax.user_cirlce_add));
          }),
          bottom: const TabBar(
            tabs: [
              Text(
                'Trending',
                style: TextStyle(fontSize: 10, color: Colors.black),
              ),
              Text(
                'English',
                style: TextStyle(fontSize: 10, color: Colors.black),
              ),
              Text(
                'New',
                style: TextStyle(fontSize: 10, color: Colors.black),
              ),
              Text(
                'Bolly',
                style: TextStyle(fontSize: 10, color: Colors.black),
              ),
              Text(
                'Chinese',
                style: TextStyle(fontSize: 10, color: Colors.black),
              )
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            TrendingMovie(),
            Text('2'),
            Text('3'),
            Text('4'),
            Text('5'),
          ],
        ),
      ),
    );
  }
}
