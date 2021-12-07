import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class MovieCard extends StatefulWidget {
  const MovieCard(
      {Key? key,
      required this.name,
      required this.storedIn,
      required this.leadrole,
      this.seasons = "",
      this.isMovie = true,
      this.imageUrl = "",
      this.isMy = false,
      this.id = ""})
      : super(key: key);

  final String name, storedIn, leadrole, seasons, imageUrl, id;
  final bool isMovie, isMy;

  @override
  _MovieCardState createState() => _MovieCardState();
}

class _MovieCardState extends State<MovieCard> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    // print(widget.imageUrl);
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
                                            widget.name,
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
                                                widget.isMovie
                                                    ? "Movie"
                                                    : "Series",
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
                                                widget.storedIn,
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
                                        widget.leadrole,
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
                                        widget.seasons == ""
                                            ? "0"
                                            : widget.seasons,
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
                    ),
                    child: widget.imageUrl.length < 1
                        ? Image.asset(
                            'assets/images/test_image.jpg',
                            fit: BoxFit.fitWidth,
                          )
                        : Image(
                            image: NetworkImage(widget.imageUrl),
                            fit: BoxFit.fitWidth,
                          ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 30,
            left: size.width * .12,
            child: Icon(
              Icons.favorite_border,
              color: Colors.red,
              size: 25,
            ),
          ),
          Positioned(
            bottom: 30,
            right: size.width * .06,
            child: widget.isMy
                ? Container(
                    child: InkWell(
                      child: Icon(
                        Icons.delete,
                        color: Colors.redAccent,
                        size: 25,
                      ),
                      onTap: () async {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return Dialog(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12.0)),
                              elevation: 5,
                              child: Container(
                                padding: EdgeInsets.all(15),
                                width: size.width * .6,
                                height: 160,
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "Confirmation",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 20,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 10),
                                    Text(
                                      widget.isMovie
                                          ? "Are you Sure you want to delete this Movie ?"
                                          : "Are you Sure you want to delete this Series ?",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    SizedBox(height: 10),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 8),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          InkWell(
                                            child: Text(
                                              "Cancel",
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                            onTap: () {
                                              Navigator.pop(context);
                                            },
                                          ),
                                          InkWell(
                                            child: Text(
                                              "Delete",
                                              style: TextStyle(
                                                  color: Colors.red,
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                            onTap: () async {
                                              await FirebaseFirestore.instance
                                                  .collection("Movies")
                                                  .doc(widget.id)
                                                  .delete();
                                              Navigator.pop(context);
                                            },
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      },
                    ),
                  )
                : Container(),
          ),
        ],
      ),
    );
  }
}
