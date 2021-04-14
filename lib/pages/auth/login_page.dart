import 'package:flutter_30_days/helper/hex_code.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mdi/mdi.dart';
import '../../globals.dart';
import '../../layout/back_layout.dart';

class LoginPage extends StatefulWidget {
  static const String route = "/LoginPage";
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  Color _color = HexColor("#007991");
  double height, width;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(primaryColor: _color),
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          height = constraints.maxHeight;
          width = constraints.maxWidth;
          return Scaffold(
            body: _buildBody(context),
          );
        },
      ),
    );
  }

  _buildBody(BuildContext context) {
    return BackLayout(
      size: Size(width, height),
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              _color,
              HexColor("#78ffd6"),
            ],
          ),
        ),
        child: Column(
          children: [
            SizedBox(
              height: isFullScreen(
                Size(width, height),
                Size(MediaQuery.of(context).size.width,
                    MediaQuery.of(context).size.height),
              )
                  ? 0.2 * height
                  : 0.1 * height,
            ),
            Icon(
              Mdi.heartBroken,
              size: 50,
              color: Colors.white,
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
            SizedBox(
                height: isFullScreen(
              Size(width, height),
              Size(MediaQuery.of(context).size.width,
                  MediaQuery.of(context).size.height),
            )
                    ? (0.05 * height)
                    : (0.025 * height)),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Card(
                elevation: 20,
                shadowColor: Colors.white30,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0)),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text("Enter your credentials",
                          style: GoogleFonts.poppins(
                            fontSize: 23,
                            color: Colors.black.withOpacity(0.675),
                            fontWeight: FontWeight.w500,
                          )),
                      SizedBox(height: 12),
                      _buildTextField("Email"),
                      _buildTextField("Password"),
                      SizedBox(height: 20),
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          height: 0.075 * height,
                          width: 0.8 * width,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30.0),
                            border: Border.all(color: _color),
                          ),
                          child: Center(
                            child: Text(
                              "Log in",
                              style: TextStyle(color: _color, fontSize: 20),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      RichText(
                        text: TextSpan(style: GoogleFonts.poppins(), children: [
                          TextSpan(
                              text: "Don't have an account?",
                              style: TextStyle(color: Colors.black)),
                          TextSpan(
                              text: " Sign Up now",
                              style: TextStyle(color: _color))
                        ]),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _buildTextField(String text) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(30.0),
        ),
        child: TextField(
          decoration: InputDecoration(
              hintText: text,
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(left: 20.0)),
        ),
      ),
    );
  }
}
