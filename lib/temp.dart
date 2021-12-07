import 'dart:async';
import 'dart:io';
import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:projects_app/services/userDetails.dart';
import 'package:projects_app/services/validator.dart';

import '../constants.dart';

class AddMoviePage extends StatefulWidget {
  const AddMoviePage({Key? key}) : super(key: key);

  @override
  _AddMoviePageState createState() => _AddMoviePageState();
}

class _AddMoviePageState extends State<AddMoviePage>
    with TickerProviderStateMixin {
  late AnimationController controller1;
  late AnimationController controller2;
  late Animation<double> animation1;
  late Animation<double> animation2;
  late Animation<double> animation3;
  late Animation<double> animation4;

  // Form
  String name = "",
      storedIn = "HDD",
      leadRole = "",
      totalSeasons = "0",
      imageUrl = "";
  bool isMovie = true;
  bool showSpinner = false;
  late File _pickedImage;
  var isPicked = false;
  TimeOfDay time = TimeOfDay.now();
  final _formKey = GlobalKey<FormState>();

  setSelectedRadio(bool val) {
    setState(() {
      isMovie = val;
    });
  }

  // Image Picker
  void _pickImage() async {
    ImagePicker imagePicker = new ImagePicker();
    final pickedImageFile = await imagePicker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 85,
      maxWidth: 800,
    );
    setState(() {
      _pickedImage = File(pickedImageFile!.path);
      isPicked = true;
    });
  }

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
          child: Container(
            width: size.width,
            height: size.height,
            child: SingleChildScrollView(
              child: SizedBox(
                height: size.height,
                child: Stack(
                  children: [
                    Positioned(
                      top: size.height * (animation2.value + .7),
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
                      top: size.height * (animation3.value + .01),
                      left: size.width * (animation1.value + .05),
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
                    Align(
                      alignment: Alignment.center,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Form(
                          key: _formKey,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(height: 100),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child: BackdropFilter(
                                  filter: ImageFilter.blur(
                                    sigmaY: 12,
                                    sigmaX: 12,
                                  ),
                                  child: Container(
                                    height: 250,
                                    width: 350,
                                    decoration: BoxDecoration(
                                      color: Colors.white.withOpacity(.15),
                                    ),
                                    child: Container(
                                      margin: EdgeInsets.all(8),
                                      child: Stack(
                                        children: [
                                          ClipRRect(
                                            borderRadius:
                                            BorderRadius.circular(15),
                                            child: BackdropFilter(
                                              filter: ImageFilter.blur(
                                                sigmaY: 12,
                                                sigmaX: 12,
                                              ),
                                              child: Container(
                                                height: 250,
                                                width: 350,
                                                decoration: BoxDecoration(
                                                  color: Colors.white
                                                      .withOpacity(.15),
                                                ), // Photo here
                                                child: isPicked
                                                    ? Container(
                                                  margin:
                                                  EdgeInsets.all(5),
                                                  decoration:
                                                  BoxDecoration(
                                                    borderRadius:
                                                    BorderRadius
                                                        .circular(20),
                                                  ),
                                                  child: Image(
                                                    fit: BoxFit.fitWidth,
                                                    image: FileImage(
                                                        _pickedImage),
                                                  ),
                                                )
                                                    : Container(
                                                  margin:
                                                  EdgeInsets.all(5),
                                                  decoration:
                                                  BoxDecoration(
                                                    borderRadius:
                                                    BorderRadius
                                                        .circular(20),
                                                    image: DecorationImage(
                                                        image: AssetImage(
                                                            'assets/images/test_image.jpg'),
                                                        fit: BoxFit
                                                            .fitWidth),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Align(
                                            alignment: Alignment.bottomRight,
                                            child: Padding(
                                              padding:
                                              const EdgeInsets.all(8.0),
                                              child: InkWell(
                                                onTap: () {
                                                  _pickImage();
                                                },
                                                child: Icon(
                                                  Icons.edit,
                                                  color: Colors.green,
                                                  size: 30,
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
                              ClipRRect(
                                child: BackdropFilter(
                                  filter: ImageFilter.blur(
                                    sigmaY: 12,
                                    sigmaX: 12,
                                  ),
                                  child: Container(
                                    height: 20,
                                    width: 30,
                                    decoration: BoxDecoration(
                                      color: Colors.white.withOpacity(.25),
                                    ),
                                  ),
                                ),
                              ),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(5),
                                child: BackdropFilter(
                                  filter: ImageFilter.blur(
                                    sigmaY: 12,
                                    sigmaX: 12,
                                  ),
                                  child: Container(
                                    height: 20,
                                    width: 80,
                                    decoration: BoxDecoration(
                                      color: Colors.white.withOpacity(.25),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 30),
                              TextFormField(
                                validator: nameValidator,
                                style: TextStyle(color: Colors.white),
                                cursorColor: Colors.white,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.white, width: 5),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.white, width: 1),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Color(0xffB75CFF), width: 1),
                                  ),
                                  labelText: 'Name',
                                  labelStyle: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                                minLines: 1,
                                onChanged: (text) {
                                  setState(() {
                                    name = text;
                                  });
                                },
                              ),
                              SizedBox(height: 10),
                              TextFormField(
                                initialValue: "HDD",
                                validator: nameValidator,
                                style: TextStyle(color: Colors.white),
                                cursorColor: Colors.white,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.white, width: 5),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.white, width: 1),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Color(0xffB75CFF), width: 1),
                                  ),
                                  labelText: 'Stored In',
                                  labelStyle: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                                minLines: 1,
                                onChanged: (text) {
                                  setState(() {
                                    storedIn = text;
                                  });
                                },
                              ),
                              SizedBox(height: 10),
                              Row(
                                children: [
                                  Icon(
                                    Icons.category,
                                    color: Colors.white,
                                  ),
                                  SizedBox(width: 5),
                                  Text(
                                    'Category : ',
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.white),
                                  ),
                                  SizedBox(width: 30),
                                  Row(
                                    children: [
                                      Text(
                                        'Movies',
                                        style: TextStyle(
                                            fontSize: 18, color: Colors.white),
                                      ),
                                      Radio(
                                        value: true,
                                        groupValue: isMovie,
                                        activeColor: Colors.green,
                                        onChanged: (val) {
                                          // print("Radio $val");
                                          setSelectedRadio(val as bool);
                                        },
                                      ),
                                    ],
                                  ),
                                  SizedBox(width: 10),
                                  Row(
                                    children: [
                                      Text(
                                        'Series',
                                        style: TextStyle(
                                            fontSize: 18, color: Colors.white),
                                      ),
                                      Radio(
                                        value: false,
                                        groupValue: isMovie,
                                        activeColor: Colors.green,
                                        onChanged: (val) {
                                          // print("Radio $val");
                                          setSelectedRadio(val as bool);
                                        },
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(height: 10),
                              TextFormField(
                                validator: nameValidator,
                                style: TextStyle(color: Colors.white),
                                cursorColor: Colors.white,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.white, width: 5),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.white, width: 1),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Color(0xffB75CFF), width: 1),
                                  ),
                                  labelText: 'Lead Role of',
                                  labelStyle: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                                minLines: 1,
                                onChanged: (text) {
                                  setState(() {
                                    leadRole = text;
                                  });
                                },
                              ),
                              SizedBox(height: 10),
                              TextFormField(
                                validator: nameValidator,
                                style: TextStyle(color: Colors.white),
                                cursorColor: Colors.white,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.white, width: 5),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.white, width: 1),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Color(0xffB75CFF), width: 1),
                                  ),
                                  labelText: 'Total Seasons',
                                  labelStyle: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                                minLines: 1,
                                onChanged: (text) {
                                  setState(() {
                                    totalSeasons = text;
                                  });
                                },
                              ),
                              SizedBox(height: 30),
                              InkWell(
                                onTap: () async {
                                  if (_formKey.currentState!.validate()) {
                                    setState(() {
                                      showSpinner = true;
                                    });
                                    print("Add Button Pressed");
                                    if (isPicked) {
                                      var time = DateTime.now()
                                          .millisecondsSinceEpoch
                                          .toString();
                                      firebase_storage.Reference ref =
                                      firebase_storage
                                          .FirebaseStorage.instance
                                          .ref()
                                          .child('MoviesImages')
                                          .child('$time');

                                      await ref.putFile(_pickedImage);
                                      imageUrl = await ref.getDownloadURL();
                                    }

                                    FirebaseFirestore.instance
                                        .collection('Movies')
                                        .add({
                                      'Name': name,
                                      'createdAt': Timestamp.now(),
                                      'isMovie': isMovie,
                                      'AddedBy': UserDetails.uid,
                                      'StoredIn': storedIn,
                                      'LeadRole': leadRole,
                                      'Image': imageUrl,
                                      'Seasons': totalSeasons,
                                    }).then((value) {
                                      print(value);
                                      var documentId = value.id;
                                      FirebaseFirestore.instance
                                          .collection('Movies')
                                          .doc(documentId)
                                          .update({
                                        'Id': documentId,
                                      });
                                      setState(() {
                                        showSpinner = false;
                                        time = TimeOfDay.now();
                                        isPicked = false;
                                      });
                                      Fluttertoast.showToast(
                                          msg: isMovie
                                              ? "Movie Added Successfully"
                                              : "Series Added Successfully",
                                          toastLength: Toast.LENGTH_LONG,
                                          gravity: ToastGravity.CENTER,
                                          timeInSecForIosWeb: 1,
                                          backgroundColor: Colors.white,
                                          textColor: Colors.green,
                                          fontSize: 25.0);
                                      Navigator.pop(context);
                                    });
                                  }
                                },
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(15),
                                  child: BackdropFilter(
                                    filter: ImageFilter.blur(
                                      sigmaY: 12,
                                      sigmaX: 12,
                                    ),
                                    child: Container(
                                      width: size.width * .4,
                                      height: 55,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        color: Colors.white.withOpacity(0.5),
                                      ),
                                      child: Center(
                                        child: Text(
                                          'ADD',
                                          style: TextStyle(
                                              color: Colors.purple,
                                              fontSize: 25,
                                              fontWeight: FontWeight.w700),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
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
                              // border: Border.all(color: Colors.white),
                              color: Colors.white.withOpacity(.5),
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
                                    'Add Movie / Series',
                                    style: TextStyle(
                                      // color: Color(0xffB4FEE7),
                                        color: Colors.white,
                                        // color: Colors.purple,
                                        fontSize: 25,
                                        fontWeight: FontWeight.w700),
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
