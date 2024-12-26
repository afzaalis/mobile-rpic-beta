import 'package:flutter/material.dart';
import 'package:rpic_mobile_beta/local_notifications.dart';
import 'package:rpic_mobile_beta/pages/adminPages/mainPageAdmin.dart';
import 'package:rpic_mobile_beta/pages/animated_text_page.dart';
import 'package:rpic_mobile_beta/pages/introPage.dart';  
import 'package:rpic_mobile_beta/pages/login.dart';
import 'package:rpic_mobile_beta/pages/signup.dart';
import 'package:rpic_mobile_beta/components/bottom_nav_bar.dart';
import 'package:provider/provider.dart'; 
import './model/user_provider.dart';
import './model/user.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

final FlutterSecureStorage _secureStorage = FlutterSecureStorage();

void main() async {
  runApp(
    ChangeNotifierProvider(
      create: (_) => UserProvider(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FutureBuilder(
        future: _checkLoginStatus(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return AnimatedTextPage();  
          }

          if (snapshot.hasData) {
            // Jika sudah login, cek role dan arahkan
            String role = snapshot.data ?? '';
            if (role == 'admin') {
              return AdminMainPage(); 
            } else if (role == 'customer') {
              return MainPage();  
            }
          }
          return AnimatedTextPage();  
        },
      ),
      routes: {
        '/AnimatedTextPage': (context) => AnimatedTextPage(),
        '/intropage': (context) => Intropage(),
        '/login': (context) => Login(),
        '/signup': (context) => SignupPage(),
        '/main': (context) => MainPage(),
        
      },
    );
  }

  Future<String?> _checkLoginStatus() async {
    final userId = await _secureStorage.read(key: 'userId');
    final role = await _secureStorage.read(key: 'role');
    
    if (userId != null && role != null) {
      return role;  
    }
    return null;  
  }

  // Fungsi logout
  static Future<void> logout(BuildContext context) async {
    await _secureStorage.delete(key: 'userId');
    await _secureStorage.delete(key: 'role');

    // Mengarahkan ke halaman login setelah logout
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => Login()),
    );
  }
}
