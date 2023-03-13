import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_example/screens/mainscreen.dart';
import 'package:flutter_signin_example/reusable_widgets/resuable_widget.dart';
import 'package:flutter_signin_example/screens/home_screen.dart';
import 'package:flutter_signin_example/screens/signup_screen.dart';
import 'package:flutter_signin_example/utils/color_utils.dart';
import 'dart:developer';
import 'package:auto_size_text/auto_size_text.dart';


class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  late String _error = "";
  TextEditingController _passwordTextConrtoller = TextEditingController();
  TextEditingController _emailTextController = TextEditingController();  
  @override
  Widget build(BuildContext context) {
    log('data: hi');
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
          hexStringToColor("FFFF8F"), 
          hexStringToColor("FDDA0D"), 
          hexStringToColor("FFD700")
        ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(
              20, MediaQuery.of(context).size.height * 0.2, 20, 0),
            child: Column(
              children: <Widget>[
                //logoWidget("assests/images/logoOnABudget.png"),
                SizedBox(
                  height: 30,
                ),
                reusableTextField("Enter Email", Icons.person_outline, false, _emailTextController),
                SizedBox(
                  height: 20,
                ),
                reusableTextField("Enter Password", Icons.lock_outline, true, _passwordTextConrtoller),
                SizedBox(
                  height: 20,
                ),
                signInSignUpButton(context, true, (){

                  FirebaseAuth.instance.signInWithEmailAndPassword
                    (email: _emailTextController.text,
                      password: _passwordTextConrtoller.text).then((value){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => MainScreen()));
                  }).onError((error, stackTrace){
                    print("Error ${error.toString()}");
                    setState(() {
                      _error = error.toString();
                    });

                  });
                  

                }),

                signUpOption(), //TODO: Not showing up for some reason, fix it
                showAlert()
              ],
            ),
          ),
        )
      ),
    );
  }

  Widget showAlert(){
    print("Im here");
    if(_error != ""){
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
            Expanded(child: AutoSizeText("No account found", maxLines: 3,),),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: IconButton(
                icon: Icon(Icons.close),
                onPressed: () {
                  setState(() {
                    _error = "";
                  });
                },
              ),
            )
          ],
        ),
      );
    }
    return SizedBox(height: 0,);
  }

  Row signUpOption(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Don't have account?", 
            style:TextStyle(color: Colors.black87)),
        GestureDetector(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => SignUpScreen()));
          },
          child: const Text(
            " Sign Up",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }

}

