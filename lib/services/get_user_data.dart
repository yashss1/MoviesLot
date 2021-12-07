import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:projects_app/MainScreens/homepage.dart';
import 'package:projects_app/services/userDetails.dart';

class GetUserData extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    FirebaseAuth auth = FirebaseAuth.instance;
    String uid = auth.currentUser!.uid.toString();
    String documentId = uid;
    CollectionReference users = FirebaseFirestore.instance.collection('Users');
    return FutureBuilder<DocumentSnapshot>(
      future: users.doc(documentId).get(),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.hasError) {
          return Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasData && !snapshot.data!.exists) {
          return Center(child: CircularProgressIndicator());
        }
        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data =
              snapshot.data!.data() as Map<String, dynamic>;
          UserDetails.name = data['Name'].toString();
          UserDetails.email = data['Email'].toString();
          UserDetails.username = data['Username'].toString();
          UserDetails.password = data['Password'].toString();
          UserDetails.isAdmin = data['IsAdmin'];
          UserDetails.profilePhotoUrl = data['ProfilePhotoUrl'].toString();
          UserDetails.uid = data['Uid'];

          return HomePage();
        }
        return Center(child: CircularProgressIndicator());
      },
    );
  }
}
