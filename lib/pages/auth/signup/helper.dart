import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'package:flutter_ui_kit/globals.dart';

/// Static Data used in [SignUpPage]

List<Color> listColor = [
  Color(0xFF7541ee),
  Color(0xFFf4b512),
  Color(0xFFfa517a),
];
List<String> titleText = [
  "What is your\nname?",
  "What skills\ndo you have?",
  "When were\nyou born?"
];

List<String> hintText = ["Name", "Skills", "Date Month Year"];

List<Image> listImage = [
  Image.asset('assets/name.png'),
  Image.asset("assets/music.png"),
  Image.asset("assets/birth.png")
];

/// AppBar used in [SignUpPage]

AppBar buildAppBar(BuildContext context, double width, height) {
  return AppBar(
    backgroundColor: Colors.transparent,
    elevation: 0,
    centerTitle: true,
    leading: GestureDetector(
        onTap: () {
          if (isFullScreen(Size(width, height), getSize(context)))
            Navigator.pop(context);
        },
        child: Icon(
          MdiIcons.chevronLeft,
          color: SignUpColors.blackColor,
        )),
    title: Text(
      "Sign Up",
      style: TextStyle(
        color: SignUpColors.blackColor,
      ),
    ),
    actions: [
      Transform(
        alignment: Alignment.center,
        transform: Matrix4.rotationY(math.pi),
        child: IconButton(
          onPressed: () {},
          icon: Icon(
            MdiIcons.sortVariant,
            color: SignUpColors.blackColor,
          ),
        ),
      ),
    ],
  );
}

/// Colors used in [SignUpPage]

class SignUpColors {
  static Color blackColor = Color(0xFF101010);
  static Color primaryColor = Color(0xFF7541ee);
}
