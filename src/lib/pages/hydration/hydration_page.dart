import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'dart:math';

import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_ui_kit/layout/back_layout.dart';
import "./painter.dart";

/// NOTE: Do not copy [HydrationPage] widget
/// Copy the [HydrationWidget] widget

class HydrationPage extends StatefulWidget {
  static const String route = "/HydrationPage";
  @override
  _HydrationPageState createState() => _HydrationPageState();
}

class _HydrationPageState extends State<HydrationPage> {
  late double height, width;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      width = constraints.maxWidth;
      height = constraints.maxHeight;
      return Theme(
        data: ThemeData(
          primaryColor: HydrationWidget.mainColor,
          fontFamily: GoogleFonts.montserrat().fontFamily,
        ),
        child: Scaffold(
          body: BackLayout(
            size: Size(width, height),
            child: HydrationWidget(width, height),
          ),
        ),
      );
    });
  }
}

/// NOTE: Copy the below widget
/// Remember to wrap the contents in a [Scaffold] widget
/// You can remove the contructor values [height] and [width]

class HydrationWidget extends StatefulWidget {
  final double height, width;

  static final Color mainColor = Color(0xFF7e7cf8);
  const HydrationWidget(this.width, this.height, {super.key});

  @override
  State<HydrationWidget> createState() => _HydrationWidgetState();
}

class _HydrationWidgetState extends State<HydrationWidget> {
  late double height, width;

  @override
  void initState() {
    this.height = widget.height;
    this.width = widget.width;
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

    return Column(
      children: [
        SizedBox(height: 0.075 * height),
        Text(
          "Current Hydration",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        Spacer(),
        CustomPaint(
          painter: RadialPainter(270),
          child: Container(
            height: 0.3 * height,
            width: 0.3 * height,
            child: Container(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "84%",
                      style:
                          TextStyle(fontSize: 37, fontWeight: FontWeight.w900),
                    ),
                    Text("1,290 ml")
                  ],
                ),
              ),
            ),
          ),
        ),
        Spacer(),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                children: [
                  _buildItem(
                    MdiIcons.waterOutline,
                    HydrationWidget.mainColor.withOpacity(0.45),
                  ),
                  SizedBox(width: 10),
                  _buildItem(
                    MdiIcons.bottleSodaOutline,
                    HydrationWidget.mainColor.withOpacity(0.3),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  _buildItem(
                    MdiIcons.cupOutline,
                    HydrationWidget.mainColor.withOpacity(0.2),
                  ),
                  SizedBox(width: 10),
                  _buildItem(
                    MdiIcons.bottleTonicOutline,
                    HydrationWidget.mainColor.withOpacity(0.1),
                  ),
                ],
              ),
            ],
          ),
        ),
        Spacer(),
        Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(
                MdiIcons.waterOutline,
                size: 30,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(30.0),
                ),
                child: Icon(
                  MdiIcons.circleOutline,
                  color: Colors.white,
                ),
              ),
              Icon(
                MdiIcons.squareRoundedOutline,
                size: 30,
              ),
            ],
          ),
        ),
        SizedBox(height: 0.025 * height),
      ],
    );
  }

  _buildItem(IconData icon, Color color) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(15.0),
        ),
        padding: EdgeInsets.all(20.0),
        child: Row(
          children: [
            Spacer(),
            Icon(icon),
            SizedBox(width: 10),
            Text(Random().nextInt(1000).toString() + " ml"),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
