import 'package:flutter/material.dart';
import 'package:rpic_mobile_beta/local_notifications.dart';
import 'package:rpic_mobile_beta/pages/animated_text_page.dart';
import 'package:rpic_mobile_beta/pages/introPage.dart';  
import 'package:rpic_mobile_beta/pages/login.dart';
import 'package:rpic_mobile_beta/pages/signup.dart';
import 'package:rpic_mobile_beta/components/bottom_nav_bar.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await LocalNotifications.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AnimatedTextPage(), 
      routes: {
        '/intropage': (context) => Intropage(),
        '/login': (context) => Login(), 
        '/signup': (context) => SignupPage(), 
        '/main': (context) => MainPage(), 
      },
    );
  }
}
