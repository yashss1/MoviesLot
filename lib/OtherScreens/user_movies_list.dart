import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:projects_app/model/movie_card.dart';
import 'package:projects_app/services/userDetails.dart';

class UserMoviesList extends StatefulWidget {
  const UserMoviesList({Key? key}) : super(key: key);

  @override
  _UserMoviesListState createState() => _UserMoviesListState();
}

class _UserMoviesListState extends State<UserMoviesList> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('Movies')
            .orderBy('createdAt', descending: true)
            .snapshots(),
        builder: (ctx, AsyncSnapshot notificationsSnapshots) {
          if (notificationsSnapshots.connectionState ==
              ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          final _notification = notificationsSnapshots.data!.docs;
          return ListView.builder(
            physics: BouncingScrollPhysics(),
            itemCount: _notification.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  if (index == 0) SizedBox(height: 80),
                  (_notification[index]['AddedBy']! == UserDetails.uid)
                      ? MovieCard(
                          name: _notification[index]['Name'],
                          storedIn: _notification[index]['StoredIn'],
                          leadrole: _notification[index]['LeadRole'],
                          imageUrl: _notification[index]['Image'],
                          seasons: _notification[index]['Seasons'],
                          isMovie: _notification[index]['isMovie'],
                          isMy: true,
                          id: _notification[index]['Id'],
                        )
                      : Container(),
                  if (index == _notification.length - 1) SizedBox(height: 80),
                ],
              );
            },
          );
        });
  }
}
