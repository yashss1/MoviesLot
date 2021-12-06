import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:page_transition/page_transition.dart';
import 'package:projects_app/MainScreens/homepage.dart';
import 'package:projects_app/VerificationScreens/login_page.dart';
import 'dart:async';
import 'dart:ui';

import 'package:projects_app/constants.dart';
import 'package:projects_app/services/authentication_helper.dart';
import 'package:projects_app/services/store_user_info.dart';
import 'package:projects_app/services/validator.dart';

class RegistrationPage extends StatefulWidget {
  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage>
    with TickerProviderStateMixin {
  late AnimationController controller1;
  late AnimationController controller2;
  late Animation<double> animation1;
  late Animation<double> animation2;
  late Animation<double> animation3;
  late Animation<double> animation4;

  // Auth
  final _formKey = GlobalKey<FormState>();
  String email = "", password = "", name = "", username = "";
  bool showSpinner = false;

  @override
  void initState() {
    super.initState();

    controller1 = AnimationController(
      vsync: this,
      duration: Duration(
        seconds: 5,
      ),
    );
    animation1 = Tween<double>(begin: .1, end: .15).animate(
      CurvedAnimation(
        parent: controller1,
        curve: Curves.easeInOut,
      ),
    )
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          controller1.reverse();
        } else if (status == AnimationStatus.dismissed) {
          controller1.forward();
        }
      });
    animation2 = Tween<double>(begin: .02, end: .04).animate(
      CurvedAnimation(
        parent: controller1,
        curve: Curves.easeInOut,
      ),
    )..addListener(() {
        setState(() {});
      });

    controller2 = AnimationController(
      vsync: this,
      duration: Duration(
        seconds: 5,
      ),
    );
    animation3 = Tween<double>(begin: .41, end: .38).animate(CurvedAnimation(
      parent: controller2,
      curve: Curves.easeInOut,
    ))
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          controller2.reverse();
        } else if (status == AnimationStatus.dismissed) {
          controller2.forward();
        }
      });
    animation4 = Tween<double>(begin: 170, end: 190).animate(
      CurvedAnimation(
        parent: controller2,
        curve: Curves.easeInOut,
      ),
    )..addListener(() {
        setState(() {});
      });

    Timer(Duration(milliseconds: 2500), () {
      controller1.forward();
    });

    controller2.forward();
  }

  @override
  void dispose() {
    controller1.dispose();
    controller2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: blackbg,
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: ScrollConfiguration(
          behavior: MyBehavior(),
          child: SingleChildScrollView(
            child: SizedBox(
              height: size.height,
              child: Stack(
                children: [
                  Positioned(
                    top: size.height * (animation2.value + .6),
                    left: size.width * .8,
                    child: CustomPaint(
                      painter: MyPainter(50),
                    ),
                  ),
                  Positioned(
                    top: size.height * .98,
                    left: size.width * .2,
                    child: CustomPaint(
                      painter: MyPainter(animation4.value - 30),
                    ),
                  ),
                  Positioned(
                    top: size.height * .45,
                    left: size.width * (animation2.value + .8),
                    child: CustomPaint(
                      painter: MyPainter(30),
                    ),
                  ),
                  Positioned(
                    top: size.height * (animation3.value + .07),
                    left: size.width * (animation1.value - .05),
                    child: CustomPaint(
                      painter: MyPainter(60),
                    ),
                  ),
                  Positioned(
                    top: size.height * .1,
                    left: size.width * .8,
                    child: CustomPaint(
                      painter: MyPainter(animation4.value),
                    ),
                  ),
                  Column(
                    children: [
                      Expanded(
                        flex: 6,
                        child: Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              Padding(
                                padding:
                                    EdgeInsets.only(top: size.height * .15),
                                child: Container(
                                  width: 120,
                                  height: 120,
                                  decoration: const BoxDecoration(
                                    color: Colors.transparent,
                                    image: DecorationImage(
                                        image: AssetImage(
                                            "assets/images/app_icon.png"),
                                        fit: BoxFit.fitHeight),
                                  ),
                                ),
                              ),
                              SizedBox(height: 15),
                              Text(
                                'Movies LOT',
                                style: TextStyle(
                                  color: Colors.white.withOpacity(.7),
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1,
                                  wordSpacing: 4,
                                ),
                              ),
                              SizedBox(height: 15),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 7,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: BackdropFilter(
                                filter: ImageFilter.blur(
                                  sigmaY: 15,
                                  sigmaX: 15,
                                ),
                                child: Container(
                                  height: size.width / 7,
                                  width: size.width / 1.2,
                                  alignment: Alignment.center,
                                  padding:
                                      EdgeInsets.only(right: size.width / 30),
                                  decoration: BoxDecoration(
                                    color: Colors.white.withOpacity(.05),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: TextFormField(
                                    style: TextStyle(
                                        color: Colors.white.withOpacity(.8)),
                                    cursorColor: Colors.white,
                                    obscureText: false,
                                    keyboardType: TextInputType.text,
                                    decoration: InputDecoration(
                                      prefixIcon: Icon(
                                        Icons.account_circle,
                                        color: Colors.white.withOpacity(.7),
                                      ),
                                      border: InputBorder.none,
                                      hintMaxLines: 1,
                                      hintText: 'Name...',
                                      hintStyle: TextStyle(
                                          fontSize: 14,
                                          color: Colors.white.withOpacity(.5)),
                                    ),
                                    onChanged: (value) {
                                      name = value;
                                    },
                                  ),
                                ),
                              ),
                            ),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: BackdropFilter(
                                filter: ImageFilter.blur(
                                  sigmaY: 15,
                                  sigmaX: 15,
                                ),
                                child: Container(
                                  height: size.width / 7,
                                  width: size.width / 1.2,
                                  alignment: Alignment.center,
                                  padding:
                                      EdgeInsets.only(right: size.width / 30),
                                  decoration: BoxDecoration(
                                    color: Colors.white.withOpacity(.05),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: TextFormField(
                                    style: TextStyle(
                                        color: Colors.white.withOpacity(.8)),
                                    cursorColor: Colors.white,
                                    obscureText: false,
                                    keyboardType: TextInputType.text,
                                    decoration: InputDecoration(
                                      prefixIcon: Icon(
                                        Icons.drive_file_rename_outline,
                                        color: Colors.white.withOpacity(.7),
                                      ),
                                      border: InputBorder.none,
                                      hintMaxLines: 1,
                                      hintText: 'Username...',
                                      hintStyle: TextStyle(
                                          fontSize: 14,
                                          color: Colors.white.withOpacity(.5)),
                                    ),
                                    onChanged: (value) {
                                      username = value;
                                    },
                                  ),
                                ),
                              ),
                            ),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: BackdropFilter(
                                filter: ImageFilter.blur(
                                  sigmaY: 15,
                                  sigmaX: 15,
                                ),
                                child: Container(
                                  height: size.width / 7,
                                  width: size.width / 1.2,
                                  alignment: Alignment.center,
                                  padding:
                                      EdgeInsets.only(right: size.width / 30),
                                  decoration: BoxDecoration(
                                    color: Colors.white.withOpacity(.05),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: TextFormField(
                                    validator: emailValidator,
                                    style: TextStyle(
                                        color: Colors.white.withOpacity(.8)),
                                    cursorColor: Colors.white,
                                    obscureText: false,
                                    keyboardType: TextInputType.emailAddress,
                                    decoration: InputDecoration(
                                      prefixIcon: Icon(
                                        Icons.email_outlined,
                                        color: Colors.white.withOpacity(.7),
                                      ),
                                      border: InputBorder.none,
                                      hintMaxLines: 1,
                                      hintText: 'Email...',
                                      hintStyle: TextStyle(
                                          fontSize: 14,
                                          color: Colors.white.withOpacity(.5)),
                                    ),
                                    onChanged: (value) {
                                      email = value;
                                    },
                                  ),
                                ),
                              ),
                            ),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: BackdropFilter(
                                filter: ImageFilter.blur(
                                  sigmaY: 15,
                                  sigmaX: 15,
                                ),
                                child: Container(
                                  height: size.width / 7,
                                  width: size.width / 1.2,
                                  alignment: Alignment.center,
                                  padding:
                                      EdgeInsets.only(right: size.width / 30),
                                  decoration: BoxDecoration(
                                    color: Colors.white.withOpacity(.05),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: TextFormField(
                                    validator: passwordValidator,
                                    obscureText: true,
                                    style: TextStyle(
                                        color: Colors.white.withOpacity(.8)),
                                    cursorColor: Colors.white,
                                    keyboardType: TextInputType.emailAddress,
                                    decoration: InputDecoration(
                                      prefixIcon: Icon(
                                        Icons.lock_outline,
                                        color: Colors.white.withOpacity(.7),
                                      ),
                                      border: InputBorder.none,
                                      hintMaxLines: 1,
                                      hintText: 'Password...',
                                      hintStyle: TextStyle(
                                          fontSize: 14,
                                          color: Colors.white.withOpacity(.5)),
                                    ),
                                    onChanged: (value) {
                                      password = value;
                                    },
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 5),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(15),
                                  child: BackdropFilter(
                                    filter: ImageFilter.blur(
                                        sigmaY: 15, sigmaX: 15),
                                    child: InkWell(
                                      highlightColor: Colors.transparent,
                                      splashColor: Colors.transparent,
                                      onTap: () async {
                                        FocusScope.of(context).unfocus();
                                        if (_formKey.currentState!.validate()) {
                                          setState(() {
                                            showSpinner = true;
                                          });
                                          AuthenticationHelper()
                                              .signUp(
                                                  email: email,
                                                  password: password)
                                              .then(
                                            (result) {
                                              if (result == null) {
                                                Navigator.pushReplacement(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        StoreUserdata(
                                                      password: password,
                                                      name: name,
                                                      username: username,
                                                    ),
                                                  ),
                                                );
                                              } else {
                                                setState(() {
                                                  showSpinner = false;
                                                });
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(
                                                  SnackBar(
                                                    content: Text(
                                                      result,
                                                      style: TextStyle(
                                                          fontSize: 16),
                                                    ),
                                                  ),
                                                );
                                              }
                                            },
                                          );
                                        }
                                        ;
                                      },
                                      child: Container(
                                        height: size.width / 8,
                                        width: size.width / 2.58,
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                          color: Colors.white.withOpacity(.05),
                                          borderRadius:
                                              BorderRadius.circular(15),
                                        ),
                                        child: Text(
                                          'REGISTER',
                                          style: TextStyle(
                                              color:
                                                  Colors.white.withOpacity(.8),
                                              fontSize: 18),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 4,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            component2(
                              'Already a User? Sign In',
                              2,
                              () {
                                print("Already a User");
                                Navigator.pushReplacement(
                                  context,
                                  PageTransition(
                                    type: PageTransitionType.fade,
                                    child: LoginPage(),
                                  ),
                                );
                              },
                            ),
                            SizedBox(height: size.height * .05),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget component2(String string, double width, VoidCallback voidCallback) {
    Size size = MediaQuery.of(context).size;
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaY: 15, sigmaX: 15),
        child: InkWell(
          highlightColor: Colors.transparent,
          splashColor: Colors.transparent,
          onTap: voidCallback,
          child: Container(
            height: size.width / 8,
            width: size.width / width,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(.05),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Text(
              string,
              style:
                  TextStyle(color: Colors.white.withOpacity(.8), fontSize: 18),
            ),
          ),
        ),
      ),
    );
  }
}

class MyPainter extends CustomPainter {
  final double radius;

  MyPainter(this.radius);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..shader = LinearGradient(
              colors: [Color(0xffB75CFF), Color(0xffB4FEE7)],
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
