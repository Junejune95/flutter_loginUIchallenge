import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:loginUIchallenge/screen/login1/login1_form.dart';

class Login1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: size.width,
            height: size.height,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/bg1.jpeg'),
                fit: BoxFit.cover,
              ),
            ),
            // to make backgroud image blur
            child: BackdropFilter(
              child: Container(
                color: Colors.white10,
              ),
              filter: ImageFilter.blur(sigmaY: 3, sigmaX: 3),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildLoginText(),
                SizedBox(
                  height: 30,
                ),
                Login1Form(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildClickableText('Password'),
                    Container(
                      margin: EdgeInsets.all(20),
                      height: 20,
                      width: 2,
                      color: Colors.white70,
                    ),
                    _buildClickableText('Register'),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Text _buildClickableText(String label) {
    return Text(
      label,
      style: TextStyle(
        fontSize: 18,
        color: Colors.white,
      ),
    );
  }

  Text _buildLoginText() {
    return Text(
      'LOGIN',
      style: TextStyle(
        color: Colors.white.withOpacity(0.9),
        decoration: TextDecoration.none,
        fontSize: 50,
      ),
    );
  }
}
