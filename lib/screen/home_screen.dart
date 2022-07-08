import 'package:flutter/material.dart';

import 'package:iconsax/iconsax.dart';

import 'package:onemovieticket/screen/navigators/home_navigator.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: const HomeNavigator(),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xFF274451),
        selectedItemColor: const Color(0xff657B7C),
        unselectedItemColor: const Color(0xFF475D64),
        items: const [
          BottomNavigationBarItem(icon: Icon(Iconsax.home), label: 'home'),
          BottomNavigationBarItem(
              icon: Icon(Iconsax.search_favorite), label: 'Search'),
          BottomNavigationBarItem(icon: Icon(Iconsax.like), label: 'liked'),
          BottomNavigationBarItem(
              icon: Icon(Iconsax.book_saved), label: 'Booking'),
        ],
        currentIndex: currentIndex,
        onTap: (value) {
          setState(() {
            currentIndex = value;
          });
        },
      ),
    );
  }
}
