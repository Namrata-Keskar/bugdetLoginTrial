import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'dart:io';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/gestures.dart';

import '../Controller/word_controller.dart';

class DisplayScreen extends StatefulWidget {
  DisplayScreen({Key? key}) : super(key: key);

  WordController wordCont = Get.put(WordController());

  @override
    _DisplayScreenState createState() => _DisplayScreenState();


  }

class _DisplayScreenState extends State<DisplayScreen>{
  @override
  Widget build(BuildContext context) {

    return GetBuilder<WordController>(
        init: WordController(),
        initState: (_){},

        builder: (wordController){
          print("BUILDERRRR");
          wordController.getData();
          return Scaffold(
              body: Center(
                //child: ElevatedButton(
                child: wordController.isLoading ? CircularProgressIndicator() :
                ListView.separated(
                  itemCount: wordController.wordList.length,
                  itemBuilder: (BuildContext context, index){
                    return Card(
                      child: Row(
                        children: [
                          Column(
                            children: [
                              Text(wordController.wordList[index].date, style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),overflow: TextOverflow.visible,textAlign: TextAlign.start),
                              Text(wordController.wordList[index].name, style: TextStyle(fontSize: 16), overflow: TextOverflow.visible,textAlign: TextAlign.start),
                              Text(wordController.wordList[index].url, style: TextStyle(fontSize: 16), overflow: TextOverflow.visible,textAlign: TextAlign.start),

                            ],
                          ),
                          Row(
                            children: [
                              IconButton(onPressed: (){
                                //Opens to more details on the event
                              }, icon: Icon(FontAwesomeIcons.edit)),
                              IconButton(onPressed: (){}, icon: Icon(FontAwesomeIcons.deleteLeft))
                              //Removes from database
                            ],
                          )],
                      ),
                    );
                  },
                  separatorBuilder: (BuildContext context, index){
                    return Divider(thickness: 2, color: Colors.black);
                  }, ),
              )
          );

        });
  }
}



