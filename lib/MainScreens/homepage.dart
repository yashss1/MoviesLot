import 'package:flutter/material.dart';
import 'package:projects_app/services/authentication_helper.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.greenAccent,
      body: Container(
        height: size.height,
        width: size.width,
        child: Center(
            child: InkWell(
          onTap: () {
            AuthenticationHelper().signOut(context);
          },
          child: Container(
            height: 100,
            width: 100,
            color: Colors.pink,
          ),
        )),
      ),
    );
  }
}
