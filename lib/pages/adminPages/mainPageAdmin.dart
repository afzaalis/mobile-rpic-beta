import 'package:flutter/material.dart';
import 'adminBetaPage.dart';
import 'adminAlphaPage.dart';
import 'adminDrivingPage.dart';

class AdminMainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF05051E),
      body: SafeArea(
        child: SingleChildScrollView( 
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 18.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Select your PC",
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0XFF15162F), 
                      ),
                      padding: const EdgeInsets.all(8.0), 
                      child: Icon(
                        Icons.notifications,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 30),

                // Gambar alpha
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AdminAlphaPage()),
                    );
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width - 32, 
                    height: 156,
                    child: Center(
                      child: Image.asset(
                        "images/imgPagePC/alpha.png",
                        fit: BoxFit.cover,
                        width: MediaQuery.of(context).size.width - 32, 
                        height: 156,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 50),

                // Gambar beta
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AdminBetaPage()),
                    );
                  },
                  child: Container(
                    // margin: EdgeInsets.only(left: 25.0),
                    width: MediaQuery.of(context).size.width - 32, 
                    height: 156,
                    child: Center(
                      child: Image.asset(
                        "images/imgPagePC/beta.png",
                        fit: BoxFit.cover,
                        width: MediaQuery.of(context).size.width - 32, 
                        height: 156,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 50),

                // Gambar drive simulator
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AdminDrivingSimulatorPage()),
                    );
                  },
                  child: Container(
                    // margin: EdgeInsets.only(left: 25.0),
                    width: MediaQuery.of(context).size.width - 32, 
                    height: 156,
                    child: Center(
                      child: Image.asset(
                        "images/imgPagePC/drivesimulator.png",
                        fit: BoxFit.cover,
                        width: MediaQuery.of(context).size.width - 32, 
                        height: 156,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}