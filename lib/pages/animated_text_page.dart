import 'package:flutter/material.dart';
import 'dart:async';
<<<<<<< HEAD
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:rpic_mobile_beta/components/bottom_nav_bar.dart';
import 'package:rpic_mobile_beta/main.dart';
import 'package:rpic_mobile_beta/pages/introPage.dart';
import 'package:rpic_mobile_beta/pages/login.dart';
import 'adminPages/mainPageAdmin.dart';

final FlutterSecureStorage _secureStorage = FlutterSecureStorage();
=======
import 'introPage.dart';
>>>>>>> c940960ae92cf8fb163d95ca605fb8287553cc29

class AnimatedTextPage extends StatefulWidget {
  @override
  _AnimatedTextPageState createState() => _AnimatedTextPageState();
}

class _AnimatedTextPageState extends State<AnimatedTextPage> {
<<<<<<< HEAD
  bool _showSecondText = false;
  bool _showFirstText = true;
=======
  bool _showSecondText = false; 
  bool _showFirstText = true; 
>>>>>>> c940960ae92cf8fb163d95ca605fb8287553cc29

  @override
  void initState() {
    super.initState();
<<<<<<< HEAD
    Timer(Duration(seconds: 4), () {  // Menambah durasi animasi pertama
      if (mounted) {
        setState(() {
          _showFirstText = false;
          _showSecondText = true;
        });

        Timer(Duration(seconds: 2), () {
          if (mounted) {
            _checkLoginStatus(); // Cek login status saat animasi selesai
          }
        });
      }
    });
  }

  Future<void> _checkLoginStatus() async {
    final role = await _secureStorage.read(key: 'role');
    
    if (role != null) {
      if (role == 'admin') {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => AdminMainPage()),
        );
      } else if (role == 'customer') {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => MainPage()),
        );
      }
    } else {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => Intropage()), 
      );
    }
  }

=======
    Timer(Duration(seconds: 3), () {
      setState(() {
        _showFirstText = false; 
        _showSecondText = true; 
      });

      Timer(Duration(seconds: 2), () {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => Intropage()),
        );
      });
    });
  }

>>>>>>> c940960ae92cf8fb163d95ca605fb8287553cc29
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF05051E),
      body: Center(
        child: AnimatedText(showFirstText: _showFirstText, showSecondText: _showSecondText),
      ),
    );
  }
}

class AnimatedText extends StatefulWidget {
  final bool showFirstText;
  final bool showSecondText;

  AnimatedText({required this.showFirstText, required this.showSecondText});

  @override
  _AnimatedTextState createState() => _AnimatedTextState();
}

<<<<<<< HEAD
class _AnimatedTextState extends State<AnimatedText> with SingleTickerProviderStateMixin {
=======
class _AnimatedTextState extends State<AnimatedText>
    with SingleTickerProviderStateMixin {
>>>>>>> c940960ae92cf8fb163d95ca605fb8287553cc29
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
<<<<<<< HEAD
      duration: const Duration(seconds: 2), // Durasi animasi fade
=======
      duration: const Duration(seconds: 2),
>>>>>>> c940960ae92cf8fb163d95ca605fb8287553cc29
      vsync: this,
    )..forward();

    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(_controller);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
<<<<<<< HEAD
        if (widget.showFirstText)
=======
        if (widget.showFirstText) 
>>>>>>> c940960ae92cf8fb163d95ca605fb8287553cc29
          FadeTransition(
            opacity: _animation,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'images/logoRPIC.png',
                  width: 50,
                  height: 50,
                ),
                const SizedBox(width: 10),
                Text(
                  'Welcome to RPIC',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
<<<<<<< HEAD
        if (widget.showSecondText)
=======
        // Second text
        if (widget.showSecondText) 
>>>>>>> c940960ae92cf8fb163d95ca605fb8287553cc29
          FadeTransition(
            opacity: _animation,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'images/logoRPIC.png',
                  width: 50,
                  height: 50,
                ),
                const SizedBox(width: 10),
                Text(
                  'Reserve Your PC here...',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
      ],
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
