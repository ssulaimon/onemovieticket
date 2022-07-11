import 'dart:developer';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:iconsax/iconsax.dart';

class EditedContainer extends StatelessWidget {
  String title;
  String rating;
  String imageurl;
  EditedContainer({
    Key? key,
    required this.title,
    required this.rating,
    required this.imageurl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5.0),
      width: 200,
      height: 300,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          12.0,
        ),
        image: DecorationImage(
            image: NetworkImage(
              'https://image.tmdb.org/t/p/original/$imageurl',
            ),
            fit: BoxFit.fill),
      ),
      child: Column(
        children: [
          Align(
            alignment: Alignment.topRight,
            child: Container(
              margin: const EdgeInsets.all(5.0),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.red,
              ),
              child: IconButton(
                onPressed: () {
                  log('you clicked me');
                },
                icon:
                    const Icon(Iconsax.lovely, color: Colors.white, size: 20.0),
              ),
            ),
          ),
          const SizedBox(
            height: 150,
          ),
          Container(
            margin: const EdgeInsets.all(5.0),
            padding: const EdgeInsets.all(10.0),
            decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.9),
                borderRadius: BorderRadius.circular(10.0)),
            child: Column(
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 8.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 1.0),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: Row(
                    children: [
                      TextButton(
                        onPressed: () {},
                        child: const Text(
                          'Book now',
                          style: TextStyle(fontSize: 10.0, color: Colors.red),
                        ),
                      ),
                      const SizedBox(
                        width: 30.0,
                      ),
                      Text('\$30.00')
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
