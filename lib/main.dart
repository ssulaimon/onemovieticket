import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:onemovieticket/firebase_options.dart';
import 'package:onemovieticket/routes/routes.dart';
import 'package:onemovieticket/screen/forgetpassword_screen.dart';
import 'package:onemovieticket/screen/home_screen.dart';
import 'package:onemovieticket/screen/login.dart';

import 'package:onemovieticket/screen/register_screen.dart';

import 'package:onemovieticket/screen/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
    MaterialApp(
      initialRoute: splashScreen,
      routes: {
        splashScreen: (context) => const SplashScreen(),
        login: (context) => const LoginScreen(),
        register: (context) => const Register(),
        forgetPassword: (context) => const ForgetPassword(),
        home: (context) => const HomeScreen(),
      },
    ),
  );
}
