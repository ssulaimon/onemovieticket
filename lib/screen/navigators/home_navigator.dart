import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:onemovieticket/class/authentication.dart';
import 'package:onemovieticket/screen/navigators/draw.dart';
import 'package:onemovieticket/screen/navigators/tab_layout_bolly.dart';
import 'package:onemovieticket/screen/navigators/tab_layout_chinese.dart';
import 'package:onemovieticket/screen/navigators/tab_layout_english.dart';
import 'package:onemovieticket/screen/navigators/tab_layout_trending.dart';

class HomeNavigator extends StatefulWidget {
  const HomeNavigator({Key? key}) : super(key: key);

  @override
  State<HomeNavigator> createState() => _HomeNavigatorState();
}

class _HomeNavigatorState extends State<HomeNavigator> {
  String? username = AuthenticateUser().userName();
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: Colors.white,
        drawer: const ProfileDrawer(),
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.white,
          centerTitle: true,
          title: Text(
            'Welcome ${username!}',
            style: const TextStyle(
              color: Colors.black,
              fontSize: 15,
            ),
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
            TabLayoutsTrending(),
            TabLayoutEnglish(),
            TabLayoutsBolly(),
            TabLayoutsChinese()
          ],
        ),
      ),
    );
  }
}
