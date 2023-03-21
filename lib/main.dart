import 'package:flutter_signin_example/event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_example/screens/home_screen.dart';
import 'screens/mainscreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // hides the red banner
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.amber,
      ),
      home: HomeScreen(),
    );
  }
}

