import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'package:flutter_ui_kit/layout/back_layout.dart';
import 'package:flutter_ui_kit/globals.dart';

/// NOTE: Do not copy [FurnitureDetailPage] widget
/// Copy the [FurnitureDetailWidget] widget

class FurnitureDetailPage extends StatefulWidget {
  static const String route = "/FurnitureDetailPage";
  @override
  _FurnitureDetailPageState createState() => _FurnitureDetailPageState();
}

class _FurnitureDetailPageState extends State<FurnitureDetailPage> {
  late double height, width;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        height = constraints.maxHeight;
        width = constraints.maxWidth;
        return Theme(
          data: ThemeData(
            primaryColor: FurnitureDetailWidget.mainColor,
            primarySwatch: Colors.cyan,
            fontFamily: GoogleFonts.quicksand().fontFamily,
          ),
          child: Scaffold(
            body: BackLayout(
              size: Size(width, height),
              child: FurnitureDetailWidget(width, height),
            ),
          ),
        );
      },
    );
  }
}

/// NOTE: Copy the below widget
/// Remember to wrap the contents in a [Scaffold] widget
/// You can remove the contructor values [height] and [width]

class FurnitureDetailWidget extends StatefulWidget {
  final double height, width;

  static Color mainColor = Color(0xFF21a5a7);
  const FurnitureDetailWidget(this.width, this.height, {super.key});

  @override
  State<FurnitureDetailWidget> createState() => _FurnitureDetailWidgetState();
}

class _FurnitureDetailWidgetState extends State<FurnitureDetailWidget> {
  late double height, width;

  @override
  void initState() {
    width = widget.width;
    height = widget.height;
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
    return Stack(
      children: [
        Positioned.fill(
          child: Image.network(
            "https://images.unsplash.com/photo-1532323544230-7191fd51bc1b?crop&w=1080&q=80",
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30.0),
                topRight: Radius.circular(30.0),
              ),
              color: Colors.white,
            ),
            child: Column(
              children: [
                SizedBox(height: 20),
                Text("Special Offer 40% off"),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Shop By Room",
                    style: TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 25,
                      fontFamily: GoogleFonts.quicksand().fontFamily,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 10.0),
                  child: Text(
                    "Small Space? No Problem, Make the room feel bigger with smart lighting",
                    textAlign: TextAlign.center,
                  ),
                ),
                Container(
                  height: 0.09 * height,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: FurnitureDetailWidget.mainColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30.0),
                      topRight: Radius.circular(30.0),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      "Shop Now",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 19,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          top: MediaQuery.of(context).padding.top + 10,
          left: 10,
          child: GestureDetector(
            onTap: () {
              if (isFullScreen(Size(width, height), getSize(context)))
                Navigator.of(context).pop();
            },
            child: Container(
              padding: EdgeInsets.all(10.0),
              decoration:
                  BoxDecoration(shape: BoxShape.circle, color: Colors.white),
              child: Icon(
                MdiIcons.chevronLeft,
                color: Colors.black,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
