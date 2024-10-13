import 'package:flutter/material.dart';
import './login.dart';

class SignupPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: DecoratedBox(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/mod-image.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: SingleChildScrollView( 
            child: Container(
              width: 300,
              padding: EdgeInsets.all(16), 
              decoration: BoxDecoration(
                color: Color(0xFF15162F), 
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min, 
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    child: Text(
                      'SIGN UP',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  // Username input
                  TextFormField(
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      labelText: 'Username',
                      labelStyle: TextStyle(color: Colors.grey[800]), // Darker text
                      prefixIcon: Icon(Icons.person, color: Colors.grey[800]), 
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15), // Border radius
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15), // Border radius
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      filled: true, 
                      fillColor: Colors.grey[300], 
                    ),
                    style: TextStyle(color: Colors.grey[800]), // Darker text
                  ),
                  SizedBox(height: 10),

                  // Email input
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      labelText: 'Email',
                      labelStyle: TextStyle(color: Colors.grey[800]), // Darker text
                      prefixIcon: Icon(Icons.email, color: Colors.grey[800]), 
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15), // Border radius
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15), // Border radius
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      filled: true,
                      fillColor: Colors.grey[300], // Lighter background color
                    ),
                    style: TextStyle(color: Colors.grey[800]), // Darker text
                  ),
                  SizedBox(height: 10),

                  // Password input
                  TextFormField(
                    obscureText: true, 
                    decoration: InputDecoration(
                      labelText: 'Password',
                      labelStyle: TextStyle(color: Colors.grey[800]), // Darker text
                      prefixIcon: Icon(Icons.lock, color: Colors.grey[800]), 
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15), // Border radius
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15), // Border radius
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      filled: true,
                      fillColor: Colors.grey[300], // Lighter background color
                    ),
                    style: TextStyle(color: Colors.grey[800]), // Darker text
                  ),
                  SizedBox(height: 10),

                  // Confirm Password input
                  TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'Confirm Password',
                      labelStyle: TextStyle(color: Colors.grey[800]), // Darker text
                      prefixIcon: Icon(Icons.lock, color: Colors.grey[800]), 
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15), // Border radius
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15), // Border radius
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      filled: true,
                      fillColor: Colors.grey[300], // Lighter background color
                    ),
                    style: TextStyle(color: Colors.grey[800]), // Darker text
                  ),
                  SizedBox(height: 20),

                  // Sign Up Button
                  SizedBox(
                    width: 300, 
                    height: 35, 
                    child: ElevatedButton(
                      onPressed: () {
                        print('Sign Up button pressed');
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF640EF1), 
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10), 
                        ),
                      ),
                      child: Text(
                        'Sign Up',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  
                  // Already have account
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Already have an account?",
                        style: TextStyle(color: Colors.white),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Login(),
                                   )
                              );
                        },
                        child: Text(
                          "Login here",
                          style: TextStyle(
                            color: Colors.blue, 
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
