import 'package:flutter/material.dart';
import 'pages/introPage.dart';  
import 'pages/login.dart';
import 'pages/signup.dart';
import 'components/bottom_nav_bar.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Intropage(),  
      routes: {
        '/login': (context) => Login(),  // Define the route for Login
        '/signup': (context) => SignupPage(), // Define the route for Signup
        '/main': (context) => MainPage(), // Define the route for MainPage
      },
    );
  }
}
