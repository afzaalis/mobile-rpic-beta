import 'package:flutter/material.dart';

class Login extends StatelessWidget {
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
            child: Container(
              width: 300,
              height: 200,
               decoration: BoxDecoration(
              color: Color(0xFF15162F),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0), 
                  child: Text(
                    'Login',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
          ),
      ),
    )
      )
    );
  }
}
