import 'dart:developer';


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class NoEvents extends StatefulWidget {
  NoEvents({Key? key}) : super(key: key);

  @override
  State<NoEvents> createState() => _NoEventsState();

}

class _NoEventsState extends State<NoEvents> {
  @override
    Widget build(BuildContext context) {
      return Scaffold(
        body: Center(
            child: ElevatedButton(
              child: Text("No events"),
              onPressed: () {


              },
            )
        ),
      );
  }



}