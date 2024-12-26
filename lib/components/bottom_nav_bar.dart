import 'package:flutter/material.dart';
import 'package:circle_nav_bar/circle_nav_bar.dart';
<<<<<<< HEAD
import 'package:shared_preferences/shared_preferences.dart';
=======
>>>>>>> c940960ae92cf8fb163d95ca605fb8287553cc29
import '../pages/reservasiPage.dart';
import '../pages/historyPage.dart';
import '../pages/profilePage.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _activeIndex = 1; 

<<<<<<< HEAD
  @override
  Widget build(BuildContext context) {
   
    final List<Widget> _pages = [
      ProfilePage(),
      Reservasipage(),
      HistoryPage(), 
    ];

    return Scaffold(
      backgroundColor: Color(0xFF05051E),
      body: _pages[_activeIndex], 
=======
  final List<Widget> _pages = [
    ProfilePage(),
    Reservasipage(), 
    HistoryPage(),
  ];

  void _onNavItemTapped(int index) {
    setState(() {
      _activeIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF05051E), 
      body: _pages[_activeIndex],
>>>>>>> c940960ae92cf8fb163d95ca605fb8287553cc29
      bottomNavigationBar: CircleNavBar(
        activeIndex: _activeIndex,
        activeIcons: const [
          Icon(Icons.person, color: Color(0xFF15162F)),
          Icon(Icons.home, color: Color(0xFF05051E)),
<<<<<<< HEAD
          Icon(Icons.history, color: Color(0xFF05051E)),
=======
          Icon(Icons.history, color: Color(0xFF05051E)), 
>>>>>>> c940960ae92cf8fb163d95ca605fb8287553cc29
        ],
        inactiveIcons: const [
          Text("Profile", style: TextStyle(color: Colors.black)),
          Text("Home", style: TextStyle(color: Colors.black)),
          Text("History", style: TextStyle(color: Colors.black)),
        ],
        color: Colors.white,
        circleColor: Colors.white,
        height: 60,
        circleWidth: 60,
        padding: const EdgeInsets.only(left: 16, right: 16, bottom: 20),
        cornerRadius: const BorderRadius.only(
          topLeft: Radius.circular(8),
          topRight: Radius.circular(8),
          bottomRight: Radius.circular(24),
          bottomLeft: Radius.circular(24),
        ),
        shadowColor: Colors.black,
        circleShadowColor: Colors.deepPurple,
        elevation: 10,
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [Colors.blue, Colors.red],
        ),
        circleGradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [Colors.blue, Colors.red],
        ),
<<<<<<< HEAD
        onTap: (index) {
          setState(() {
            _activeIndex = index;
          });
        },
=======
        onTap: (index) => _onNavItemTapped(index), 
>>>>>>> c940960ae92cf8fb163d95ca605fb8287553cc29
      ),
    );
  }
}
