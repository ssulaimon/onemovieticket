import 'dart:developer';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:onemovieticket/class/authentication.dart';
import 'package:onemovieticket/routes/routes.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

TextEditingController email = TextEditingController();
TextEditingController password = TextEditingController();

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const Align(
            alignment: Alignment.topCenter,
            child: Image(
              fit: BoxFit.fitWidth,
              image: AssetImage('images/sp.jpg'),
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
                      'Register',
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
                        labelText: 'E-mail',
                        // label: const Icon(
                        //   Icons.phone,
                        // ),
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
                        hintStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 12.0,
                        ),
                        label: const Icon(Icons.lock),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    GestureDetector(
                      onTap: (() => AuthenticateUser()
                              .createUser(
                            email: email.text,
                            password: password.text,
                          )
                              .then(
                            (result) {
                              switch (result) {
                                case null:
                                  log('This is real user');
                                  break;
                                case ' The email address is badly formatted.':
                                  log('Wrong e-mail format');
                                  break;
                                case 'The email address is already in use by another account.':
                                  log('E-mail already existed');
                                  break;
                                case 'Password should be at least 6 characters':
                                  log('Password should be 6 lenght long');
                                  break;
                                case 'A network error (such as timeout, interrupted connection or unreachable host) has occurred.':
                                  log('check your internet connection');
                                  break;
                                default:
                                  log(result);
                                  break;
                              }
                            },
                          )),
                      child: Container(
                        padding: EdgeInsets.all(13.0),
                        width: double.infinity,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: Colors.red),
                        child: const Center(
                          child: Text(
                            'Register now',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
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
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Alredy have an account?',
                          style: TextStyle(
                            fontSize: 12.0,
                          ),
                        ),
                        TextButton(
                          child: const Text(
                            'Login',
                            style: TextStyle(
                              color: Colors.red,
                              fontSize: 12.0,
                            ),
                          ),
                          onPressed: () {
                            Navigator.popAndPushNamed(context, login);
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
