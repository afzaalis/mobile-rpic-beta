import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     backgroundColor: Color(0xFF05051E), 
      appBar: AppBar(
        backgroundColor: Color(0xFF05051E), 
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "User Profile",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 20),
              ListTile(
                leading: Icon(Icons.person, color: Colors.white),
                title: Text("Name: atyanajg", style: TextStyle(color: Colors.white)),
              ),
              ListTile(
                leading: Icon(Icons.email, color: Colors.white),
                title: Text("Email: atyan@gmail.com", style: TextStyle(color: Colors.white)),
              ),
              ListTile(
                leading: Icon(Icons.phone, color: Colors.white),
                title: Text("Phone: +123456789", style: TextStyle(color: Colors.white)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
