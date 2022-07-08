import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:onemovieticket/class/authentication.dart';
import 'package:onemovieticket/routes/routes.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late TextEditingController email;
  late TextEditingController password;
  @override
  void initState() {
    email = TextEditingController();
    password = TextEditingController();
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const Align(
            alignment: Alignment.topCenter,
            child: Image(
              fit: BoxFit.fitWidth,
              image: AssetImage('images/backround.jpg'),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: const EdgeInsets.all(20.0),
              width: double.infinity,
              height: 400,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(
                    40,
                  ),
                  topRight: Radius.circular(
                    40,
                  ),
                ),
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const Text(
                      'Welcome Back',
                      style: TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    TextField(
                      controller: email,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        label: const Icon(
                          Icons.email,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    TextField(
                      controller: password,
                      obscureText: true,
                      keyboardType: TextInputType.visiblePassword,
                      decoration: InputDecoration(
                        hintText: "Password",
                        hintStyle: const TextStyle(
                          color: Colors.black,
                          fontSize: 12.0,
                        ),
                        label: const Icon(Icons.lock),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        child: const Text(
                          'Forget Password',
                          style: TextStyle(
                            color: Colors.red,
                            fontSize: 12.0,
                          ),
                        ),
                        onPressed: () =>
                            Navigator.pushNamed(context, forgetPassword),
                      ),
                    ),
                    GestureDetector(
                      child: Container(
                        padding: const EdgeInsets.all(13.0),
                        width: double.infinity,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: Colors.red),
                        child: const Center(
                          child: Text(
                            'Login',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      onTap: () async {
                        AuthenticateUser()
                            .loginUser(
                                email: email.text, password: password.text)
                            .then((result) {
                          if (result == null) {
                            Navigator.popAndPushNamed(context, home);
                          } else if (result == 'user-not-found') {
                            log('user is not found ');
                          } else if (result == 'network-request-failed') {
                            log('check your internet connection');
                          } else if (result == 'wrong-password') {
                            log('Password in correct');
                          } else {
                            log(result);
                          }
                        });
                      },
                    ),
                    const Text(
                      'or',
                      style: TextStyle(fontSize: 17.0),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                          child: Card(
                            elevation: 10.0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                20.0,
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: const [
                                  Image(
                                    image: AssetImage('images/gg.png'),
                                    width: 15.0,
                                    height: 15.0,
                                  ),
                                  SizedBox(
                                    width: 20.0,
                                  ),
                                  Text('Google')
                                ],
                              ),
                            ),
                          ),
                          onTap: () async {
                            AuthenticateUser().googleSignIn().whenComplete(
                                  () => Navigator.popAndPushNamed(
                                    context,
                                    home,
                                  ),
                                );
                          },
                        ),
                        GestureDetector(
                            child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                  20.0,
                                ),
                              ),
                              // ignore: sort_child_properties_last
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: const [
                                    Image(
                                      image: AssetImage('images/ff.png'),
                                      width: 15.0,
                                      height: 15.0,
                                    ),
                                    SizedBox(
                                      width: 10.0,
                                    ),
                                    Text('Facebook')
                                  ],
                                ),
                              ),
                              elevation: 10.0,
                            ),
                            onTap: () async {
                              AuthenticateUser().facebookLogin();
                            }),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Don\'t have an account?',
                          style: TextStyle(
                            fontSize: 12.0,
                          ),
                        ),
                        TextButton(
                          child: const Text(
                            'Register',
                            style: TextStyle(
                              color: Colors.red,
                              fontSize: 12.0,
                            ),
                          ),
                          onPressed: () {
                            Navigator.pushNamed(context, register);
                          },
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
