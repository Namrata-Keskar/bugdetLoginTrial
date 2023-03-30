import 'dart:developer';


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_signin_example/screens/presentEvents.dart';

import 'NoEvents.dart';


String uid = "";


class EventDisplayImage extends StatefulWidget {
  const EventDisplayImage({super.key});

  @override
  State<EventDisplayImage> createState() => _EventDisplayImageState();
}


final FirebaseAuth _auth = FirebaseAuth.instance;
Future<String> get_uid() async {
  User? user = _auth.currentUser;
  uid = user!.uid;
  return uid;
}


class _EventDisplayImageState extends State<EventDisplayImage> {
  @override
  void initState() {
    super.initState();
    check();
  }

  int ind = 0;


  List<Widget> _screens = [

    NoEvents(),
    presentEvents()
  ];

  Future<void> check() async {
    CollectionReference cf = FirebaseFirestore.instance.collection('boba').doc(FirebaseAuth.instance.currentUser!.uid).collection("events");
    if (cf == null) {
      ind = 0;
    }
    else{
      ind = 1;
    }
    print("IND IS");
    print(ind);
  }



  @override
  Widget build(BuildContext context) {
    print("INDIGO IS:");
    print(ind);
    return Scaffold(
        body: _screens[ind],
    // return Scaffold(
    //
    //     body: StreamBuilder(
    //       stream: FirebaseFirestore.instance.collection('boba').doc(FirebaseAuth.instance.currentUser!.uid).collection("events").snapshots(),
    //       builder: (context, snapshot) {
    //         log("entering builder - uid");
    //         print(FirebaseAuth.instance.currentUser!.uid);
    //         log("snapshot data [0]");
    //         print(snapshot.data?.docs[0]);
    //         log("snapshot data [0]['name']");
    //         print(snapshot.data?.docs[0]['name']);
    //         if (snapshot.hasError) {
    //           return Text("No Current Events yet! GO the events section to browse");
    //         }
    //         if (snapshot.connectionState == ConnectionState.active) {
    //           return ListView.builder(
    //             itemCount: snapshot.data?.docs.length,
    //
    //             itemBuilder: (context, index){
    //               DocumentSnapshot? event = snapshot.data?.docs[index];
    //               return ListTile(
    //                 leading: Image.network(event?['img_link']),
    //                 title: Text(event?['name']),
    //                 subtitle: Column(children: [
    //                   Text("\$${event?['price']}"),
    //                   Text(event?['date']),
    //                   //Text(event?['url'])
    //                 ]),
    //               );
    //
    //             },
    //
    //           );
    //         }
    //         return CircularProgressIndicator();
    //       },
    //     ),
    // );
    );
  }
}

