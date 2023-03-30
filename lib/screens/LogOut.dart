
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_example/screens/signin_screen.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'dart:io';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/gestures.dart';

import '../Controller/word_controller.dart';

class LogOut extends StatefulWidget {
  LogOut({Key? key}) : super(key: key);

  @override
  _LogOutState createState() => _LogOutState();
}
// ElevatedButton(
// child: Text("Logout"),
// onPressed: () {
// FirebaseAuth.instance.signOut().then((value) {
// print("Signed Out");
// Navigator.push(context,
// MaterialPageRoute(builder: (context) => SignInScreen()));
// });


// },
// )
class _LogOutState extends State<LogOut> {

  @override
  Widget build(BuildContext context) {
    String fin = "";
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('boba').doc(
            FirebaseAuth.instance.currentUser!.uid).collection("total").snapshots(),
        builder: (context, snapshot) {
          DocumentSnapshot? event = snapshot.data?.docs[0];
    if (snapshot.hasError) {
    return Text("No Current Events yet! GO the events section to browse");
    }
    if (snapshot.connectionState == ConnectionState.active) {
      return

        ///insert another stream builder

        Column(
            children: [
              Container(
                  height: 200,
                  color: Colors.blueGrey,
                  child: Center(
                      child:
                      Text(("Total budget is \$${event?['finalPrice']}").toString(),
                        style: TextStyle(
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                  )
              ),
              ElevatedButton(
                child: Text("Logout"),
                onPressed: () {
                  FirebaseAuth.instance.signOut().then((value) {
                    print("Signed Out");
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) =>
                            SignInScreen()));
                  });
                },
              )
            ]
        );

    }
          return CircularProgressIndicator();
        },
      ),
    );
  }
}