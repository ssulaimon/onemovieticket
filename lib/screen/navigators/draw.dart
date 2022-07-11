import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:onemovieticket/class/authentication.dart';
import 'package:onemovieticket/routes/routes.dart';

class ProfileDrawer extends StatelessWidget {
  const ProfileDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: ListView(
          children: [
            Container(
              padding: const EdgeInsets.all(10.0),
              width: double.infinity,
              height: 150,
              child: const CircleAvatar(
                radius: 80.0,
              ),
            ),
            ListTile(
              leading: Icon(Iconsax.edit),
              title: Text(' Profile'),
              onTap: () {
                Navigator.pushNamed(context, profile);
              },
            ),
            ListTile(
              leading: const Icon(Iconsax.logout),
              title: const Text('Logout'),
              onTap: () async {
                await AuthenticateUser().signoutUser();
                // await AuthenticateUser().logoutFacebookAcc();
                await AuthenticateUser().googleLooutUser();
                Navigator.pushNamedAndRemoveUntil(
                    context, login, (route) => false);
              },
            )
          ],
        ),
      ),
    );
  }
}
