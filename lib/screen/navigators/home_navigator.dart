import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:onemovieticket/class/authentication.dart';
import 'package:onemovieticket/routes/routes.dart';

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
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.white,
          title: const Text(
            'Welcome Back',
            style: TextStyle(
              color: Colors.black,
              fontSize: 15,
            ),
          ),
          actions: [
            IconButton(
              onPressed: () async {
                await AuthenticateUser().googleLooutUser();
                await AuthenticateUser().googleLooutUser();
                Navigator.popAndPushNamed(context, login);
              },
              icon: const Icon(
                Iconsax.logout,
                color: Colors.black,
              ),
            )
          ],
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
