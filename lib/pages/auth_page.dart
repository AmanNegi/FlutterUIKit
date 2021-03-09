import 'package:Flutter30Days/pages/signup_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mdi/mdi.dart';

import 'login_page.dart';

class AuthPage extends StatefulWidget {
  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  double height, width;

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            "assets/bg.jpg",
            fit: BoxFit.cover,
            height: height,
            width: double.infinity,
          ),
          _buildColumn(),
        ],
      ),
    );
  }

  _buildColumn() {
    return Container(
      height: height,
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Spacer(),
          Icon(
            Mdi.heartBroken,
            color: Colors.white,
            size: 40,
          ),
          RichText(
            text: TextSpan(
              style: GoogleFonts.poppins(fontSize: 26),
              children: [
                TextSpan(
                  text: "heart",
                  style: TextStyle(
                    fontWeight: FontWeight.w100,
                  ),
                ),
                TextSpan(
                  text: " link",
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ],
            ),
          ),
          Spacer(),
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => SignUpPage(),
              ));
            },
            child: Container(
              height: 0.075 * height,
              width: 0.8 * width,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(30.0)),
              child: Center(
                child: Text(
                  "Sign Up",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
          GestureDetector(
            onTap: () => Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => LoginPage(),
            )),
            child: Container(
              height: 0.075 * height,
              width: 0.8 * width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30.0),
                color: Colors.white,
              ),
              child: Center(
                child: Text(
                  "Log in",
                  style: TextStyle(color: Colors.lightBlueAccent, fontSize: 20),
                ),
              ),
            ),
          ),
          Spacer(),
        ],
      ),
    );
  }
}
