import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:onemovieticket/screen/navigators/draw.dart';

class HomeNavigator extends StatefulWidget {
  const HomeNavigator({Key? key}) : super(key: key);

  @override
  State<HomeNavigator> createState() => _HomeNavigatorState();
}

class _HomeNavigatorState extends State<HomeNavigator> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        drawer: const ProfileDrawer(),
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Welcome username"),
          leading: Builder(builder: (BuildContext context) {
            return IconButton(
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
                icon: const Icon(Iconsax.user_cirlce_add));
          }),
          bottom: const TabBar(
            tabs: [
              Text('Action'),
              Text('Adventure'),
              Text('Drama'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            Text('1'),
            Text('2'),
            Text('3'),
          ],
        ),
      ),
    );
  }
}
