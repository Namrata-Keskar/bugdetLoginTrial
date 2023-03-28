import 'dart:ffi';
//import 'dart:html';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_example/screens/signin_screen.dart';


bool f = false;


class DetailsScreen extends StatelessWidget {
  //const DetailsScreen({Key? key}) : super(key: key);

  //Stores the uid

  //Code for recieving the name of the event and the price and image up here
  String name = "tempName";
  int price = 15;
  String img_url = "url link";



  // Future<void> getData() async {
  //   String _uid = "";
  //   //final FirebaseAuth _auth = FirebaseAuth.instance;
  //   //User? user = _auth.currentUser;
  //   //Getting the current user's uid
  //   //_uid = user!.uid;
  //
  //
  //   Map<String, String> dataToSave = {
  //     'name': name,
  //     'url': img_url,
  //     'price': price.toString()
  //   };
  //   //
  //   // CollectionReference cf  = FirebaseFirestore.instance.collection('boba').doc(_uid).collection('events');
  //   // cf.add(dataToSave);
  // }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    //Code the button to go back and the firebaes button here
      return Scaffold(
        appBar: AppBar(
          title: Text("Budget"),
          centerTitle: true,
        ),
        body: Center(
            child: ElevatedButton(
              child: Text("Select this event"),
              onPressed: () {
                  print("EVENT SLECETIED");
                  f = true;
                  print(f);
                  showAlert();
                  String _uid = "";
                  final FirebaseAuth _auth = FirebaseAuth.instance;
                  User? user = _auth.currentUser;
                  //Getting the current user's uid
                  _uid = user!.uid;


                  Map<String, String> dataToSave = {
                    'name': name,
                    'url': img_url,
                    'price': price.toString()
                  };

                  CollectionReference cf  = FirebaseFirestore.instance.collection('boba').doc(_uid).collection('events');
                  cf.add(dataToSave);
                  //Navigator.push(context,
                    //  MaterialPageRoute(builder: (context) => SignInScreen()));
              },
            )
        ),
      );
    throw UnimplementedError();
  }

  Widget showAlert(){
    print("Im here");
    if(f){
      return Container(
        color: Colors.lime,
        width: double.infinity,
        padding: EdgeInsets.all(8.0),
        child: Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Icon(Icons.error_outline),
            ),
            Expanded(child: AutoSizeText(
              "Event has been added to you're home screen", maxLines: 3,),),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: IconButton(
                icon: Icon(Icons.close),
                onPressed: () {},
              ),
            )
          ],
        ),
      );
    }
    return SizedBox(height: 0,);

  }

}