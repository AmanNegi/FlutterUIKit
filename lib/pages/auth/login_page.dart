import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../layout/back_layout.dart';

/// NOTE: Do not copy [LoginPage] widget
/// Copy the [LoginWidget] widget

class LoginPage extends StatefulWidget {
  static const String route = "/LoginPage";
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late double height, width;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        primaryColor: LoginWidget.color,
        fontFamily: GoogleFonts.poppins().fontFamily,
      ),
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          height = constraints.maxHeight;
          width = constraints.maxWidth;
          return Scaffold(
            body: BackLayout(
                size: Size(width, height), child: LoginWidget(width, height)),
          );
        },
      ),
    );
  }
}

/// NOTE: Copy the below widget
/// Remember to wrap the contents in a [Scaffold] widget
/// You can remove the contructor values [height] and [width]

class LoginWidget extends StatefulWidget {
  final double height, width;
  // Page Theme colors
  static Color color = Color(0xFF007991);
  static Color secondaryColor = const Color(0xFF78ffd6);

  const LoginWidget(this.width, this.height, {super.key});

  @override
  State<LoginWidget> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  late double height, width;

  @override
  void initState() {
    height = widget.height;
    width = widget.width;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    /// If you remove the constructor values
    /// First, Remove the initState above
    /// Then, You can initialize the [height] and [width] variables here
    /// -------------------------------------------------------
    /// Uncomment the below lines to do so:
    /// height = MediaQuery.of(context).size.height;
    /// width = MediaQuery.of(context).size.width;

    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [LoginWidget.color, LoginWidget.secondaryColor],
        ),
      ),
      child: Column(
        children: [
          SizedBox(height: 0.15 * height),
          Icon(
            MdiIcons.heartBroken,
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
          SizedBox(height: 0.05 * height),
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
                    Text(
                      "Enter your credentials",
                      style: GoogleFonts.poppins(
                        fontSize: 23,
                        color: Colors.black.withOpacity(0.675),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 12),
                    _buildTextField("Email"),
                    _buildTextField("Password"),
                    SizedBox(height: 20),
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Container(
                        height: 0.075 * height,
                        width: 0.8 * width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30.0),
                          border: Border.all(color: LoginWidget.color),
                        ),
                        child: Center(
                          child: Text(
                            "Log in",
                            style: TextStyle(
                                color: LoginWidget.color, fontSize: 20),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    _buildSignUpOption(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextField(String text) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(30.0),
        ),
        child: TextField(
          onChanged: (value) {
            // Handle data here or attach a controller
          },
          decoration: InputDecoration(
              hintText: text,
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(left: 20.0)),
        ),
      ),
    );
  }

  Widget _buildSignUpOption() {
    return RichText(
      text: TextSpan(
        style: GoogleFonts.poppins(),
        children: [
          TextSpan(
            text: "Don't have an account?",
            style: TextStyle(color: Colors.black),
          ),
          TextSpan(
            text: " Sign Up now",
            style: TextStyle(color: LoginWidget.color),
          )
        ],
      ),
    );
  }
}
