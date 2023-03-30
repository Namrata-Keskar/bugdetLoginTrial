import 'dart:developer';


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_signin_example/screens/EventDisplayImage.dart';
import 'package:http/http.dart';



class presentEvents extends StatefulWidget {
  const presentEvents({Key? key}) : super(key: key);

  @override
  State<presentEvents> createState() => _presentEventsState();

}



class _presentEventsState extends State<presentEvents> {
  @override
  int fin = 0;
  int test = 0;
  String _uid = "";

  void initState() {
    super.initState();
    getTotal();

  }






  Future<void> getTotal() async {

    final FirebaseAuth _auth = FirebaseAuth.instance;
    User? user = _auth.currentUser;
    //Getting the current user's uid
    _uid = user!.uid;
    test = 80;
    //
    //
    //
    // print("MYS DS IS");
    // fin = ds["finalPrice"];
    // print(fin);

    // var a = Null;
    // for (var tot in userDoc.docs) {
    //   a = tot;
    //   // print("jhjh");
    //   // print(tot['finalPrice']);
    //   // //final budget
    //   // fin = tot['finalPrice'];
    //   // print("THE FINAL PRICE IS");
    //   // //price_display = fin.toString();
    // }
    //



  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('boba').doc(FirebaseAuth.instance.currentUser!.uid).collection("events").snapshots(),
        builder: (context, snapshot) {
          log("entering builder - uid");
          print(FirebaseAuth.instance.currentUser!.uid);
          log("snapshot data [0]");
          print(snapshot.data?.docs[0]);
          log("snapshot data [0]['name']");
          print(snapshot.data?.docs[0]['name']);
          if (snapshot.hasError) {
            return Text("Error: ${snapshot.error}");
          }
          if (snapshot.connectionState == ConnectionState.active) {
            return ListView.builder(
              itemCount: snapshot.data?.docs.length,
              itemBuilder: (context, index){
                DocumentSnapshot? event = snapshot.data?.docs[index];
                return ListTile(
                  leading: Image.network(event?['img_link']),
                  title: Text(event?['name']),
                  subtitle: Column(children: [
                    Text("\$${event?['price']}"),
                    Text(event?['date']),
                    //Text(event?['url'])
                  ]),
                );
              },
            );
          }
          return CircularProgressIndicator();
        },
      ),
    );
  }
}
