import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:onemovieticket/routes/routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        image: const DecorationImage(
                            image: AssetImage('images/lion.jpg'),
                            fit: BoxFit.cover),
                        borderRadius: BorderRadius.circular(
                          20.0,
                        )),
                    width: 150,
                    height: 150,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      image: const DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage('images/toystory.jpg'),
                      ),
                    ),
                    width: 150,
                    height: 100,
                  )
                ],
              ),
              const SizedBox(
                height: 10.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: 150,
                    height: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      image: const DecorationImage(
                          image: AssetImage('images/mulan.jpg'),
                          fit: BoxFit.fill),
                    ),
                  ),
                  Container(
                    width: 150,
                    height: 150,
                    decoration: BoxDecoration(
                      image: const DecorationImage(
                          image: AssetImage('images/joker.jpg'),
                          fit: BoxFit.cover),
                      borderRadius: BorderRadius.circular(20.0),
                      color: Colors.red,
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 50.0,
              ),
              // ignore: avoid_unnecessary_containers
              const Text(
                '    One ticket for\n endless memories',
                style: TextStyle(fontSize: 25, wordSpacing: 2.0),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Container(
                padding: const EdgeInsets.all(5.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    30.0,
                  ),
                  color: Colors.black,
                ),
                child: IconButton(
                  onPressed: () {
                    FirebaseAuth firebaseAuth = FirebaseAuth.instance;
                    if (firebaseAuth.currentUser == null) {
                      Navigator.popAndPushNamed(context, login);
                    } else {
                      Navigator.popAndPushNamed(context, home);
                    }
                  },
                  icon: const Icon(
                    Icons.arrow_forward,
                    color: Colors.white,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
