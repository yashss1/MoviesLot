import 'dart:ui';
import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:projects_app/MainScreens/add_movie_page.dart';
import 'package:projects_app/MainScreens/appdrawer.dart';
import 'package:projects_app/model/movie_card.dart';
import '../constants.dart';

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
      drawer: AppDrawer(),
      backgroundColor: blackbg,
      body: Builder(
        builder: (context) => Stack(
          children: [
            Container(
              height: size.height,
              width: size.width,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/bg_image.jpg'),
                    fit: BoxFit.fitWidth),
              ),
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  children: [
                    SizedBox(height: 120),
                    MovieCard(),
                    MovieCard(),
                    MovieCard(),
                    MovieCard(),
                    MovieCard(),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 30,
              right: 30,
              child: OpenContainer(
                closedBuilder: (_, openContainer) {
                  return Container(
                    height: 60,
                    width: 60,
                    child: IconButton(
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onPressed: openContainer,
                      icon: Icon(
                        Icons.add,
                        size: 30,
                        color: Colors.black.withOpacity(0.8),
                      ),
                    ),
                  );
                },
                openColor: Colors.green,
                closedElevation: 50.0,
                closedShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100),
                ),
                closedColor: Colors.white,
                openBuilder: (_, closeContainer) {
                  return AddMoviePage();
                },
              ),
            ),
            Positioned(
              top: 0,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: BackdropFilter(
                  filter: ImageFilter.blur(
                    sigmaY: 12,
                    sigmaX: 12,
                  ),
                  child: Container(
                    height: 100,
                    width: size.width,
                    alignment: Alignment.center,
                    padding: EdgeInsets.only(bottom: 14),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      color: Colors.white.withOpacity(.45),
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(50),
                        bottomLeft: Radius.circular(50),
                      ),
                    ),
                    child: Stack(
                      children: [
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Text(
                            'Movies LOT',
                            style: TextStyle(
                                // color: Color(0xffB4FEE7),
                                color: Colors.white,
                                fontSize: 30,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomLeft,
                          child: Padding(
                            padding: EdgeInsets.only(left: 20),
                            child: InkWell(
                              onTap: () {
                                print('App drawer button pressed');
                                Scaffold.of(context).openDrawer();
                              },
                              child: Icon(
                                Icons.menu,
                                size: 35,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
