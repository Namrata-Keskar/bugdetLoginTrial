import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_signin_example/screens/signin_screen.dart';
import 'dart:developer';
import 'package:flutter_signin_example/Controller/word_controller.dart';
import 'package:get/get.dart';
//import 'package:get/get_core/src/get_main.dart';


class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);
  WordController wordCont = Get.put(WordController());


  @override
  _HomeScreenState createState() => _HomeScreenState();

}

class _HomeScreenState extends State<HomeScreen> {
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          child: Text("Logout"),
          onPressed: () {
            FirebaseAuth.instance.signOut().then((value) {
              print("Signed Out");
              print("FLUFLLY");
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SignInScreen()));
            });


          },
        )
      ),


    );


  }
}