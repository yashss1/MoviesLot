import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class MovieCard extends StatefulWidget {
  const MovieCard({Key? key}) : super(key: key);

  @override
  _MovieCardState createState() => _MovieCardState();
}

class _MovieCardState extends State<MovieCard> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 2, vertical: 10),
      height: 280,
      width: size.width * .95,
      child: Stack(
        children: [
          Positioned(
            bottom: 0,
            right: 0,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: BackdropFilter(
                filter: ImageFilter.blur(
                  sigmaY: 12,
                  sigmaX: 12,
                ),
                child: Container(
                  height: 260,
                  width: size.width * .9,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(.15),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(
                        sigmaY: 12,
                        sigmaX: 12,
                      ),
                      child: Container(
                        height: 250,
                        margin: EdgeInsets.all(8),
                        width: size.width * .8,
                        alignment: Alignment.center,
                        padding: EdgeInsets.only(bottom: 14),
                        decoration: BoxDecoration(
                          // border: Border.all(color: Colors.grey),
                          color: Colors.white.withOpacity(.08),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 130,
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: 2,
                                    child: Container(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [],
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: Container(
                                      padding:
                                          EdgeInsets.only(left: 10, top: 12),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Avengers : Endgame",
                                            maxLines: 2,
                                            overflow: TextOverflow.fade,
                                            style: TextStyle(
                                                fontWeight: FontWeight.w700,
                                                color: secondary,
                                                fontSize: 20),
                                          ),
                                          SizedBox(height: 8),
                                          Row(
                                            children: [
                                              Icon(
                                                Icons.category,
                                                color: Colors.white,
                                                size: 21,
                                              ),
                                              SizedBox(width: 5),
                                              Text(
                                                "Movie",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 20),
                                              ),
                                            ],
                                          ),
                                          SizedBox(height: 8),
                                          Row(
                                            children: [
                                              Text(
                                                "Stored In : ",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w500,
                                                    color: Colors.white,
                                                    fontSize: 20),
                                              ),
                                              Text(
                                                "HDD",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 20),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 5),
                            Padding(
                              padding: const EdgeInsets.only(left: 16, top: 5),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    'More Info : ',
                                    style: TextStyle(
                                        color: secondary, fontSize: 22),
                                  ),
                                  SizedBox(height: 3),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Lead Role By : ",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            color: Colors.white,
                                            fontSize: 20),
                                      ),
                                      Text(
                                        "Iron Man",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 20),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 3),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Total Seasons : ",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            color: Colors.white,
                                            fontSize: 20),
                                      ),
                                      Text(
                                        "0",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 20),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 3),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: BackdropFilter(
                filter: ImageFilter.blur(
                  sigmaY: 12,
                  sigmaX: 12,
                ),
                child: Container(
                  height: 160,
                  width: size.width * .5,
                  padding: EdgeInsets.only(bottom: 14),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    color: Colors.white.withOpacity(.2),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                          image: AssetImage('assets/images/test_image.jpg'),
                          fit: BoxFit.fill),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 30,
            right: 30,
            child: Icon(
              Icons.favorite,
              color: Colors.red,
              size: 25,
            ),
          ),
        ],
      ),
    );
  }
}
