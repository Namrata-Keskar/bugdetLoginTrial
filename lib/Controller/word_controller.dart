//import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_signin_example/word_file.dart';
import 'package:get/get.dart';
import 'dart:developer';


class WordController extends GetxController{
  //authentication databse
  final FirebaseAuth _auth = FirebaseAuth.instance;
  //Stores the uid
  String _uid = "";


  //Umm loading the list view? not really sure what hthis does lol
  var isLoading = false;
  //This is the list that is then transeffered into a list view and show on the homepage
  var wordList = <WordModel>[];
  //final db  = FirebaseFirestore.instance;


  Future<void> getData() async {
    User? user = _auth.currentUser;
    //Getting the current user's uid
    _uid = user!.uid;

    //starts at boba, then to the user's uid, then enters the events of the user and gets all the user's events as
    //a querynapshot
   QuerySnapshot userDoc = await FirebaseFirestore.instance.collection('boba').doc(_uid).collection("events").get();
    wordList.clear();
    //if a user has nultiple events then it loops through all the events
    for(var word in userDoc.docs) {
      //Adds the event information from the querysnapshot into the list view where it will display

      wordList.add(WordModel(word['name'], word['price'], word.id));
      //If you want to add the price to the total budget you would access the price here in word['price']
      //Not sure if the price will save as a string or an integer though
    }


      isLoading = false;

    //Get.snackbar('Error', '${e.toString()}');


  }
}