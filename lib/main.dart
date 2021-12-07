import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:projects_app/MainScreens/homepage.dart';
import 'package:projects_app/VerificationScreens/login_page.dart';
import 'package:projects_app/services/get_user_data.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

Future isLoggedIn() async {
  FirebaseAuth.instance.currentUser!;
}

// ignore: must_be_immutable
class MyApp extends StatelessWidget {
  User? user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
      ),
    );
    // If user has already logged in we direct him to home page else to the login screen!
    if (user != null) {
      return MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            fontFamily: 'Circular',
            primarySwatch: Colors.blue,
            appBarTheme: AppBarTheme(
              color: Colors.white,
              elevation: 0,
            ),
            scaffoldBackgroundColor: Colors.white),
        home: GetUserData(),
      );
    } else {
      return MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            fontFamily: 'Circular',
            primarySwatch: Colors.blue,
            appBarTheme: AppBarTheme(
              color: Colors.white,
              elevation: 0,
            ),
            scaffoldBackgroundColor: Colors.white),
        home: LoginPage(),
      );
    }
  }
}
