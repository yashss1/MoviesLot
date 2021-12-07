import 'package:flutter/material.dart';
import 'package:projects_app/constants.dart';
import 'package:projects_app/services/authentication_helper.dart';
import 'package:projects_app/services/userDetails.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: blackbg,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            InkWell(
              child: CircleAvatar(
                radius: 50,
                backgroundImage:
                    NetworkImage(UserDetails.profilePhotoUrl.toString()),
                backgroundColor: Colors.amber[50],
              ),
              onTap: () {},
            ),
            SizedBox(height: 30),
            Text(
              UserDetails.name.toString(),
              style: TextStyle(color: Colors.white, fontSize: 30),
            ),
            SizedBox(height: 30),
            Text(
              UserDetails.username.toString(),
              style: TextStyle(color: Colors.white, fontSize: 30),
            ),
            SizedBox(height: 30),
            Text(
              UserDetails.email.toString(),
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            SizedBox(height: 30),
            Text(
              UserDetails.password.toString(),
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            SizedBox(height: 30),
            Text(
              UserDetails.uid.toString(),
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            SizedBox(height: 50),
            InkWell(
              onTap: () {
                AuthenticationHelper().signOut(context);
              },
              child: Text(
                'LogOut',
                style: TextStyle(color: Colors.white, fontSize: 30),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
