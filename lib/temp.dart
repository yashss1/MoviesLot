// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'dart:async';
// import 'dart:ui';
//
// import 'constants.dart';
//
// class LoginPage extends StatefulWidget {
//   @override
//   _LoginPageState createState() => _LoginPageState();
// }
//
// class _LoginPageState extends State<LoginPage> with TickerProviderStateMixin {
//   late AnimationController controller1;
//   late AnimationController controller2;
//   late Animation<double> animation1;
//   late Animation<double> animation2;
//   late Animation<double> animation3;
//   late Animation<double> animation4;
//
//   @override
//   void initState() {
//     super.initState();
//
//     controller1 = AnimationController(
//       vsync: this,
//       duration: Duration(
//         seconds: 5,
//       ),
//     );
//     animation1 = Tween<double>(begin: .1, end: .15).animate(
//       CurvedAnimation(
//         parent: controller1,
//         curve: Curves.easeInOut,
//       ),
//     )
//       ..addListener(() {
//         setState(() {});
//       })
//       ..addStatusListener((status) {
//         if (status == AnimationStatus.completed) {
//           controller1.reverse();
//         } else if (status == AnimationStatus.dismissed) {
//           controller1.forward();
//         }
//       });
//     animation2 = Tween<double>(begin: .02, end: .04).animate(
//       CurvedAnimation(
//         parent: controller1,
//         curve: Curves.easeInOut,
//       ),
//     )..addListener(() {
//         setState(() {});
//       });
//
//     controller2 = AnimationController(
//       vsync: this,
//       duration: Duration(
//         seconds: 5,
//       ),
//     );
//     animation3 = Tween<double>(begin: .41, end: .38).animate(CurvedAnimation(
//       parent: controller2,
//       curve: Curves.easeInOut,
//     ))
//       ..addListener(() {
//         setState(() {});
//       })
//       ..addStatusListener((status) {
//         if (status == AnimationStatus.completed) {
//           controller2.reverse();
//         } else if (status == AnimationStatus.dismissed) {
//           controller2.forward();
//         }
//       });
//     animation4 = Tween<double>(begin: 170, end: 190).animate(
//       CurvedAnimation(
//         parent: controller2,
//         curve: Curves.easeInOut,
//       ),
//     )..addListener(() {
//         setState(() {});
//       });
//
//     Timer(Duration(milliseconds: 2500), () {
//       controller1.forward();
//     });
//
//     controller2.forward();
//   }
//
//   @override
//   void dispose() {
//     controller1.dispose();
//     controller2.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     return Scaffold(
//       backgroundColor: blackbg,
//       body: ScrollConfiguration(
//         behavior: MyBehavior(),
//         child: SingleChildScrollView(
//           child: SizedBox(
//             height: size.height,
//             child: Stack(
//               children: [
//                 Positioned(
//                   top: size.height * (animation2.value + .58),
//                   left: size.width * .21,
//                   child: CustomPaint(
//                     painter: MyPainter(50),
//                   ),
//                 ),
//                 Positioned(
//                   top: size.height * .98,
//                   left: size.width * .1,
//                   child: CustomPaint(
//                     painter: MyPainter(animation4.value - 30),
//                   ),
//                 ),
//                 Positioned(
//                   top: size.height * .5,
//                   left: size.width * (animation2.value + .8),
//                   child: CustomPaint(
//                     painter: MyPainter(30),
//                   ),
//                 ),
//                 Positioned(
//                   top: size.height * animation3.value,
//                   left: size.width * (animation1.value + .1),
//                   child: CustomPaint(
//                     painter: MyPainter(60),
//                   ),
//                 ),
//                 Positioned(
//                   top: size.height * .1,
//                   left: size.width * .8,
//                   child: CustomPaint(
//                     painter: MyPainter(animation4.value),
//                   ),
//                 ),
//                 Column(
//                   children: [
//                     Expanded(
//                       flex: 8,
//                       child: Column(
//                         children: [
//                           Padding(
//                             padding: EdgeInsets.only(top: size.height * .15),
//                             child: Container(
//                               width: 133,
//                               height: 102,
//                               decoration: const BoxDecoration(
//                                 shape: BoxShape.circle,
//                                 color: Colors.white,
//                                 image: DecorationImage(
//                                     image: AssetImage(
//                                         "assets/images/app_logo.jpg"),
//                                     fit: BoxFit.fitHeight),
//                               ),
//                             ),
//                           ),
//                           SizedBox(height: 15),
//                           Text(
//                             'Projects LOT',
//                             style: TextStyle(
//                               color: Colors.white.withOpacity(.7),
//                               fontSize: 30,
//                               fontWeight: FontWeight.bold,
//                               letterSpacing: 1,
//                               wordSpacing: 4,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                     Expanded(
//                       flex: 7,
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                         children: [
//                           component1(
//                               Icons.email_outlined, 'Email...', false, true),
//                           component1(
//                               Icons.lock_outline, 'Password...', true, false),
//                           SizedBox(height: 5),
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               component2(
//                                 'LOGIN',
//                                 2.58,
//                                 () {
//                                   HapticFeedback.lightImpact();
//                                 },
//                               ),
//                             ],
//                           ),
//                         ],
//                       ),
//                     ),
//                     Expanded(
//                       flex: 6,
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.end,
//                         children: [
//                           component2(
//                             'Create a new Account',
//                             2,
//                             () {
//                               HapticFeedback.lightImpact();
//                             },
//                           ),
//                           SizedBox(height: size.height * .05),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget component1(
//       IconData icon, String hintText, bool isPassword, bool isEmail) {
//     Size size = MediaQuery.of(context).size;
//     return ClipRRect(
//       borderRadius: BorderRadius.circular(15),
//       child: BackdropFilter(
//         filter: ImageFilter.blur(
//           sigmaY: 15,
//           sigmaX: 15,
//         ),
//         child: Container(
//           height: size.width / 7,
//           width: size.width / 1.2,
//           alignment: Alignment.center,
//           padding: EdgeInsets.only(right: size.width / 30),
//           decoration: BoxDecoration(
//             color: Colors.white.withOpacity(.05),
//             borderRadius: BorderRadius.circular(15),
//           ),
//           child: TextField(
//             style: TextStyle(color: Colors.white.withOpacity(.8)),
//             cursorColor: Colors.white,
//             obscureText: isPassword,
//             keyboardType:
//                 isEmail ? TextInputType.emailAddress : TextInputType.text,
//             decoration: InputDecoration(
//               prefixIcon: Icon(
//                 icon,
//                 color: Colors.white.withOpacity(.7),
//               ),
//               border: InputBorder.none,
//               hintMaxLines: 1,
//               hintText: hintText,
//               hintStyle:
//                   TextStyle(fontSize: 14, color: Colors.white.withOpacity(.5)),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget component2(String string, double width, VoidCallback voidCallback) {
//     Size size = MediaQuery.of(context).size;
//     return ClipRRect(
//       borderRadius: BorderRadius.circular(15),
//       child: BackdropFilter(
//         filter: ImageFilter.blur(sigmaY: 15, sigmaX: 15),
//         child: InkWell(
//           highlightColor: Colors.transparent,
//           splashColor: Colors.transparent,
//           onTap: voidCallback,
//           child: Container(
//             height: size.width / 8,
//             width: size.width / width,
//             alignment: Alignment.center,
//             decoration: BoxDecoration(
//               color: Colors.white.withOpacity(.05),
//               borderRadius: BorderRadius.circular(15),
//             ),
//             child: Text(
//               string,
//               style: TextStyle(color: Colors.white.withOpacity(.8)),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// class MyPainter extends CustomPainter {
//   final double radius;
//
//   MyPainter(this.radius);
//
//   @override
//   void paint(Canvas canvas, Size size) {
//     final paint = Paint()
//       ..shader = LinearGradient(
//               colors: [Color(0xffFD5E3D), Color(0xffC43990)],
//               begin: Alignment.topLeft,
//               end: Alignment.bottomRight)
//           .createShader(Rect.fromCircle(
//         center: Offset(0, 0),
//         radius: radius,
//       ));
//
//     canvas.drawCircle(Offset.zero, radius, paint);
//   }
//
//   @override
//   bool shouldRepaint(covariant CustomPainter oldDelegate) {
//     return true;
//   }
// }
//
// class MyBehavior extends ScrollBehavior {
//   @override
//   Widget buildViewportChrome(
//       BuildContext context, Widget child, AxisDirection axisDirection) {
//     return child;
//   }
// }
