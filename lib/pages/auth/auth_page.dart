import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../layout/back_layout.dart';

/// NOTE: Do not copy [AuthPage] widget
/// Copy the [AuthWidget] widget

class AuthPage extends StatefulWidget {
  static const String route = "/AuthPage";
  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  late double height, width;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        height = constraints.maxHeight;
        width = constraints.maxWidth;
        return Scaffold(
          body: BackLayout(
            size: Size(width, height),
            child: AuthWidget(width, height),
          ),
        );
      },
    );
  }
}

/// NOTE: Copy the below widget
/// Remember to wrap the contents in a [Scaffold] widget
/// You can remove the contructor values [height] and [width]

class AuthWidget extends StatefulWidget {
  final double height, width;
  const AuthWidget(this.width, this.height, {super.key});

  @override
  State<AuthWidget> createState() => _AuthWidgetState();
}

class _AuthWidgetState extends State<AuthWidget> {
  late double height, width;

  @override
  void initState() {
    height = widget.height;
    width = widget.width;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    /// If you remove the constructor values, then
    /// You can initialize the [height] and [width] variables here
    /// -------------------------------------------------------
    /// Uncomment the below lines to do so:
    /// height = MediaQuery.of(context).size.height;
    /// width = MediaQuery.of(context).size.width; 
    return Stack(
      children: [
        Image.asset(
          "assets/bg.jpg",
          fit: BoxFit.cover,
          width: double.infinity,
          height: height,
        ),
        _getLayout(),
      ],
    );
  }

  _getLayout() {
    return Container(
      height: height,
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Spacer(),
          Icon(
            MdiIcons.heartBroken,
            color: Colors.white,
            size: 40,
          ),
          _getRichText(),
          Spacer(),
          _getButtons(),
          Spacer(),
        ],
      ),
    );
  }

  RichText _getRichText() {
    return RichText(
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
    );
  }

  _getButtons() {
    return Column(
      children: [
        GestureDetector(
          onTap: () {},
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
          onTap: () {},
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
      ],
    );
  }
}
