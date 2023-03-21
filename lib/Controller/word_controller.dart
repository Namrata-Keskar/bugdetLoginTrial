//import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_signin_example/word_file.dart';
import 'package:get/get.dart';
import 'dart:developer';


class WordController extends GetxController{
  final FirebaseAuth _auth = FirebaseAuth.instance;
  String _uid = "";


  var isLoading = false;
  var wordList = <WordModel>[];
  //final db  = FirebaseFirestore.instance;


  Future<void> getData() async {
    User? user = _auth.currentUser;
    _uid = user!.uid;

    //final DocumentSnapshot userDoc = await FirebaseFirestore.instance.collection('boba').doc(_uid).get();
    // print("POLLY POCKEY");
    // print(userDoc);

   QuerySnapshot userDoc = await FirebaseFirestore.instance.collection('boba').doc(_uid).collection("events").get();
    wordList.clear();
    for(var word in userDoc.docs) {
      wordList.add(WordModel(word['name'], word['price'], word.id));
    }


      isLoading = false;

    //Get.snackbar('Error', '${e.toString()}');


  }
}