import 'dart:developer';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:onemovieticket/class/authentication.dart';
import 'package:onemovieticket/routes/routes.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({Key? key}) : super(key: key);

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  TextEditingController email = TextEditingController();
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
                      'Forgot Password?',
                      style: TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 30.0,
                    ),
                    const Text(
                      "Dont worry\n we just need your registerd e-mail address\n to send a reset password link via e-mail",
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 30.0,
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
                    const SizedBox(
                      height: 20.0,
                    ),
                    GestureDetector(
                      onTap: () => AuthenticateUser()
                          .passwordRest(email: email.text)
                          .then((result) {
                        switch (result) {
                          case null:
                            log('This is a real user here');
                            break;
                          case 'The email address is badly formatted.':
                            log('Wrong e-mail formatt');
                            break;
                          case 'A network error (such as timeout, interrupted connection or unreachable host) has occurred.':
                            log('Check your internet connection');
                            break;
                          case 'There is no user record corresponding to this identifier. The user may have been deleted.':
                            log('This user is not found');
                            break;
                          default:
                            log(result);
                            break;
                        }
                      }),
                      child: Container(
                        padding: EdgeInsets.all(13.0),
                        width: double.infinity,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: Colors.red),
                        child: const Center(
                          child: Text(
                            'send password reset link',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
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
                        const SizedBox(
                          height: 10.0,
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
