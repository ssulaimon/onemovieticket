import 'dart:developer';

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
    return Column(
      children: [
        Container(
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
          child: Align(
            alignment: Alignment.topRight,
            child: IconButton(
              onPressed: () {
                log('you clicked me');
              },
              icon: const Icon(Iconsax.lovely, color: Colors.red),
            ),
          ),
        ),
      ],
    );
  }
}
