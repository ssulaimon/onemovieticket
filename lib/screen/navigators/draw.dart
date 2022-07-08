import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class ProfileDrawer extends StatelessWidget {
  const ProfileDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
          child: ListView(children: [
        Container(
          padding: const EdgeInsets.all(10.0),
          width: double.infinity,
          height: 150,
          child: const CircleAvatar(
            radius: 80.0,
          ),
        ),
        const ListTile(
          leading: Icon(Iconsax.edit),
          title: Text(' Profile'),
        ),
      ])),
    );
  }
}
