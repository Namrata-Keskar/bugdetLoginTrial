import 'package:flutter_signin_example/screens/EventDisplayImage.dart';
import 'package:flutter_signin_example/screens/signin_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_signin_example/Controller/word_controller.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import 'package:get/get_core/src/get_main.dart';
import 'package:flutter_signin_example/event.dart';

import 'DisplayScreen.dart';
import 'LogOut.dart';



class MainScreen extends StatefulWidget {
  MainScreen({Key? key}) : super(key: key);
  WordController wordCont = Get.put(WordController());
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {


  int _selectedIndex = 1;
  bool isZero = false;
  bool isOne = false;
  bool isTwo = false;

  List<Widget> _screens = [

    EventDisplayImage(),
    EventScreen(),
    LogOut()
  ];

  // void _navigateBottomBar(int index) async{
  //   print(index);
  //   if(_selectedIndex == 1 && index == 1) {
  //     isOne = true;
  //     Navigator.push(
  //         context, MaterialPageRoute(builder: (context) => EventScreen()));
  //   }
  //
  //   else{
  //     setState(() {
  //       _selectedIndex = index;
  //     });
  //   }

    //if(_selectedIndex == 0 && index == 0){

      // Widget build(BuildContext context) {
      //   return GetBuilder<WordController>(
      //       init: WordController(),
      //       initState: (_){},
      //
      //       builder: (wordController){
      //         wordController.getData();
      //         return Scaffold(
      //             body: Center(
      //               //child: ElevatedButton(
      //               child: wordController.isLoading ? CircularProgressIndicator() :
      //               ListView.separated(
      //                 itemCount: wordController.wordList.length,
      //                 itemBuilder: (BuildContext context, index){
      //                   return Card(
      //                     child: Row(
      //                       children: [
      //                         Column(
      //                           children: [
      //                             Text(wordController.wordList[index].title, style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),overflow: TextOverflow.visible,textAlign: TextAlign.start),
      //                             Text(wordController.wordList[index].meaning, style: TextStyle(fontSize: 16), overflow: TextOverflow.visible,textAlign: TextAlign.start),
      //                           ],
      //                         ),
      //                         Row(
      //                           children: [
      //                             IconButton(onPressed: (){
      //                               //Opens to more details on the event
      //                             }, icon: Icon(FontAwesomeIcons.edit)),
      //                             IconButton(onPressed: (){}, icon: Icon(FontAwesomeIcons.deleteLeft))
      //                             //Removes from database
      //                           ],
      //                         )],
      //                     ),
      //                   );
      //                 },
      //                 separatorBuilder: (BuildContext context, index){
      //                   return Divider(thickness: 2, color: Colors.black);
      //                 }, ),
      //
      //               //THIS IS WHERE OUR LOG OUT BUTTON CODE IS CURRENTLY COMMENTED OUT DUE TO FORMATTING ISSUES
      //               // child: Text("Logout"),
      //               //         onPressed: () {
      //               //           FirebaseAuth.instance.signOut().then((value) {
      //               //           print("Signed Out");
      //               //           Navigator.push(context,
      //               //             MaterialPageRoute(builder: (context) => SignInScreen()));
      //               //   });
      //               //
      //               // },
      //
      //               //),
      //             )
      //         );
      //
      //       });
      // }
   // }


  //}

  @override
  // Widget logout(BuildContext context) {
  //   return Scaffold(
  //     body: Center(
  //         child: ElevatedButton(
  //           child: Text("Logout"),
  //           onPressed: () {
  //             FirebaseAuth.instance.signOut().then((value) {
  //               print("Signed Out");
  //               Navigator.push(context,
  //                   MaterialPageRoute(builder: (context) => SignInScreen()));
  //             });
  //
  //
  //           },
  //         )
  //     ),
  //   );
  // }


  Widget build(BuildContext context) {
    // return GetBuilder<WordController>(
    //     init: WordController(),
    //     initState: (_){},
    //
    //
    //     builder: (wordController){
    //       print("BUILDERRRR");
    //       wordController.getData();
    return Scaffold(
      body: _screens[_selectedIndex],
      appBar: AppBar(
        title: Text("Budget"),
        centerTitle: true,
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          iconSize: 28,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
              backgroundColor: Colors.amber,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.add),
              label: 'Create Event',
              backgroundColor: Colors.amber,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Account',
              backgroundColor: Colors.amber,
            ),
          ],
          //onTap: _navigateBottomBar,
          onTap: (i) {
            setState(() {
              _selectedIndex = i;
            });
          }


      ),
    );

      // body: Center(
      //     //child: ElevatedButton(
      //
      //       child: wordController.isLoading ? CircularProgressIndicator() :
      //           ListView.separated(
      //               itemCount: wordController.wordList.length,
      //               itemBuilder: (BuildContext context, index){
      //                 return Card(
      //                   child: Row(
      //                     children: [
      //                     Column(
      //                       children: [
      //                         Text(wordController.wordList[index].date, style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),overflow: TextOverflow.visible,textAlign: TextAlign.start),
      //                         Text(wordController.wordList[index].name, style: TextStyle(fontSize: 16), overflow: TextOverflow.visible,textAlign: TextAlign.start),
      //                         Text(wordController.wordList[index].url, style: TextStyle(fontSize: 16), overflow: TextOverflow.visible,textAlign: TextAlign.start),
      //
      //                       ],
      //                     ),
      //                     Row(
      //                       children: [
      //                         IconButton(onPressed: (){
      //                           //Opens to more details on the event
      //                         }, icon: Icon(FontAwesomeIcons.edit)),
      //                         IconButton(onPressed: (){}, icon: Icon(FontAwesomeIcons.deleteLeft))
      //                         //Removes from database
      //                       ],
      //                     )],
      //                   ),
      //                 );
      //               },
      //               separatorBuilder: (BuildContext context, index){
      //                 return Divider(thickness: 2, color: Colors.black);
      //                }, ),


      //ajkqfhkjdfnkfjs


      //THIS IS WHERE OUR LOG OUT BUTTON CODE IS CURRENTLY COMMENTED OUT DUE TO FORMATTING ISSUES
      // child: Text("Logout"),
      //         onPressed: () {
      //           FirebaseAuth.instance.signOut().then((value) {
      //           print("Signed Out");
      //           Navigator.push(context,
      //             MaterialPageRoute(builder: (context) => SignInScreen()));
      //   });
      //
      // },

      //),
    //)
    //   );

    } // });
  }

