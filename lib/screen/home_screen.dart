import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:iconsax/iconsax.dart';

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
      body: Center(
        child: FlatButton(
          onPressed: () async {
            FirebaseAuth? firebaseAuth = await FirebaseAuth.instance;
            print(firebaseAuth.currentUser!.uid);
            await firebaseAuth.signOut();
            await GoogleSignIn().signOut();
          },
          child: Text('logout'),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color(0xFF274451),
        selectedItemColor: Color(0xff657B7C),
        unselectedItemColor: Color(0xFF475D64),
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
