import 'dart:async';
import 'dart:ui';
import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:projects_app/MainScreens/add_movie_page.dart';
import 'package:projects_app/MainScreens/appdrawer.dart';
import 'package:projects_app/OtherScreens/global_movies_list.dart';
import 'package:projects_app/OtherScreens/user_movies_list.dart';
import 'package:projects_app/OtherScreens/watch_later_list.dart';
import 'package:projects_app/model/movie_card.dart';
import '../constants.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      drawer: AppDrawer(),
      backgroundColor: blackbg,
      body: DefaultTabController(
        initialIndex: 1,
        length: 3,
        child: Builder(
          builder: (context) => Stack(
            children: [
              //Background Animations start
              Positioned(
                top: size.height * .15,
                left: size.width * .05,
                child: CustomPaint(
                  painter: MyPainter(50, Color(0xff9e7265), Color(0xff70734d)),
                ),
              ),
              Positioned(
                top: size.height * .98,
                left: size.width * .2,
                child: CustomPaint(
                  painter: MyPainter(150, Color(0xff4a4080), Color(0xff734185)),
                ),
              ),
              Positioned(
                top: size.height * .35,
                left: size.width * .4,
                child: CustomPaint(
                  painter: MyPainter(70, Color(0xff4a4080), Color(0xff734185)),
                ),
              ),
              Positioned(
                top: size.height * .55,
                left: size.width * .6,
                child: CustomPaint(
                  painter: MyPainter(20, Color(0xff4a4080), Color(0xff734185)),
                ),
              ),
              Positioned(
                top: size.height * (.6),
                left: size.width * (0.1),
                child: CustomPaint(
                  painter: MyPainter(60, Color(0xff467a6b), Color(0xff42347d)),
                ),
              ),
              Positioned(
                top: size.height * (.7),
                right: size.width * (0.1),
                child: CustomPaint(
                  painter: MyPainter(60, Color(0xff2f574b), Color(0xff565c3a)),
                ),
              ),
              Positioned(
                top: size.height * .1,
                left: size.width * .8,
                child: CustomPaint(
                  painter: MyPainter(110, Color(0xff2f574b), Color(0xff565c3a)),
                ),
              ),
              //Background Animations end

              Container(
                height: size.height,
                width: size.width,
                decoration: BoxDecoration(
                    // image: DecorationImage(
                    //     image: AssetImage('assets/images/bg_image.jpg'),
                    //     fit: BoxFit.fitWidth),
                    ),
                child: TabBarView(children: [
                  UserMoviesList(),
                  GlobalMoviesList(),
                  WatchLaterMovies(),
                ]),
              ),
              Positioned(
                bottom: 80,
                right: 20,
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
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(50),
                    bottomLeft: Radius.circular(50),
                  ),
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
                        border: Border.all(color: Colors.grey),
                        color: Colors.white.withOpacity(.45),
                        // color: Colors.black45,
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
                                  color: Colors.black,
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
                                  color: Colors.black,
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
              Positioned(
                bottom: 0,
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(
                      sigmaY: 12,
                      sigmaX: 12,
                    ),
                    child: Container(
                        height: 70,
                        width: size.width,
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          color: Colors.white.withOpacity(.45),
                          // color: Colors.black38,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                          ),
                        ),
                        child: TabBar(
                          isScrollable: false,
                          labelColor: Colors.black,
                          indicatorColor: Colors.white,
                          indicator: BoxDecoration(
                              color: secondary.withOpacity(.4),
                              borderRadius: BorderRadius.circular(25)),
                          tabs: [
                            Tab(
                              child: Column(
                                children: [
                                  Icon(
                                    FontAwesomeIcons.archive,
                                    color: primary,
                                  ),
                                  SizedBox(height: 5),
                                  Text(
                                    'Your Movies',
                                    style:
                                        TextStyle(color: primary, fontSize: 14),
                                  ),
                                ],
                              ),
                            ),
                            Tab(
                              child: Column(
                                children: [
                                  Icon(
                                    FontAwesomeIcons.globe,
                                    color: primary,
                                  ),
                                  SizedBox(height: 5),
                                  Text(
                                    'All Movies',
                                    style:
                                        TextStyle(color: primary, fontSize: 14),
                                  ),
                                ],
                              ),
                            ),
                            Tab(
                              child: Column(
                                children: [
                                  Icon(
                                    FontAwesomeIcons.clock,
                                    color: primary,
                                  ),
                                  SizedBox(height: 5),
                                  Text(
                                    'Watch Later',
                                    style:
                                        TextStyle(color: primary, fontSize: 14),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        )),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Animations
class MyPainter extends CustomPainter {
  final double radius;
  final Color color1, color2;

  MyPainter(this.radius, this.color1, this.color2);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..shader = LinearGradient(
              colors: [color1, color2],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight)
          .createShader(Rect.fromCircle(
        center: Offset(0, 0),
        radius: radius,
      ));

    canvas.drawCircle(Offset.zero, radius, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class MyBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}

class DrawTriangleShape extends CustomPainter {
  late Paint painter;

  DrawTriangleShape() {
    painter = Paint()
      ..color = Colors.red
      ..style = PaintingStyle.fill;
  }

  @override
  void paint(Canvas canvas, Size size) {
    var path = Path();
    path.moveTo(size.width / 2, 0);
    path.lineTo(0, size.height);
    path.lineTo(size.height, size.width);
    path.close();
    canvas.drawPath(path, painter);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
