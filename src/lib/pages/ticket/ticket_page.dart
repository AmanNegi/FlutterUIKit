import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'package:flutter_ui_kit/globals.dart';
import 'package:flutter_ui_kit/painters/clip_clipper.dart';
import 'package:flutter_ui_kit/layout/back_layout.dart';

/// NOTE: Do not copy [TicketPage] widget
/// Copy the [TicketWidget] widget

class TicketPage extends StatefulWidget {
  static const String route = "/TicketPage";
  @override
  _TicketPageState createState() => _TicketPageState();
}

class _TicketPageState extends State<TicketPage> {
  late double width, height;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        height = constraints.maxHeight;
        width = constraints.maxWidth;
        return Scaffold(
          body: BackLayout(
            size: Size(width, height),
            child: TicketWidget(width, height),
          ),
        );
      },
    );
  }
}

/// NOTE: Copy the below widget
/// Remember to wrap the contents in a [Scaffold] widget
/// You can remove the contructor values [height] and [width]

class TicketWidget extends StatefulWidget {
  final double height, width;
  const TicketWidget(this.width, this.height, {super.key});

  @override
  State<TicketWidget> createState() => _TicketWidgetState();
}

class _TicketWidgetState extends State<TicketWidget> {
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
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xFF1f2736),
            Color(0xFF273347),
          ],
        ),
      ),
      child: Column(
        children: [
          Container(
            height: 0.2 * height,
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    top: MediaQuery.of(context).padding.top,
                  ),
                  child: Align(
                    alignment: Alignment.topRight,
                    child: Transform.rotate(
                      angle: math.pi,
                      child: IconButton(
                        icon: Icon(
                          MdiIcons.sortVariant,
                          color: Colors.white,
                        ),
                        onPressed: () {},
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Center(
            child: Text(
              "Check in",
              style: TextStyle(
                color: Colors.white,
                fontSize: 30,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          Text(
            "Enjoy the play!",
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 0.025 * height),
          _buildTicket(),
        ],
      ),
    );
  }

// TODO: Refactor this...
  _buildTicket() {
    return ClipPath(
      clipper: ClipClipper(1.25),
      child: Container(
        height: 0.55 * height,
        width: 0.8 * width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30.0),
          color: Colors.white,
        ),
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints boxConstraints) {
            double maxHeight = boxConstraints.maxHeight;
            double maxWidth = boxConstraints.maxWidth;
            return Stack(
              children: [
                Positioned(
                  bottom: (maxHeight * 0.2),
                  left: 0,
                  right: 0,
                  child: Row(
                    children: _getDashedChildren(
                      boxConstraints.maxWidth,
                    ),
                  ),
                ),
                Center(
                  child: Column(
                    children: [
                      _buildTicketHeading(maxHeight, maxWidth),
                      Container(
                        margin: EdgeInsets.all(30),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  "1 Adult Ticket",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Spacer(),
                                Text(
                                  "\$38",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                            Text(
                                "Musical by Alian Boubil and Claude Michel Schonberg"),
                            SizedBox(height: 0.05 * maxHeight),
                            Text(
                              "19:30\n Sondehim Theatre",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(
                              "51 Shaftesbury Ave, Soho, London W1D 68A, United Kingdom",
                            ),
                          ],
                        ),
                      ),
                      // Empty Spacing
                      Container(
                        height: isFullScreen(
                          Size(width, height),
                          Size(MediaQuery.of(context).size.width,
                              MediaQuery.of(context).size.height),
                        )
                            ? 0.2 * maxHeight
                            : 0.1*maxHeight,
                      ),
                      Container(
                        color: Colors.white,
                        child: Image.asset(
                          "assets/barcode.png",
                          fit: BoxFit.cover,
                          width: 0.7 * maxWidth,
                          height: 0.1 * maxHeight,
                        ),
                      ),
                      Spacer(),
                    ],
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }

  _buildTicketHeading(double maxHeight, double maxWidth) {
    return Container(
      height: 0.15 * maxHeight,
      width: maxWidth,
      decoration: BoxDecoration(
        color: Color(0xFF526ea0),
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.0), topRight: Radius.circular(30.0)),
      ),
      child: Row(
        children: [
          Spacer(),
          Text(
            "Les Miserables",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w800,
              fontSize: 20,
            ),
          ),
          Container(
            margin: EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              color: Color(0xFF8aa2d2),
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Center(
                child: Wrap(
                  children: [
                    Text(
                      "Nov 07",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Spacer(),
        ],
      ),
    );
  }

  List<Widget> _getDashedChildren(double maxWidth) {
    List<Widget> widgetList = new List.empty(growable: true);
    int countOfChildren = maxWidth ~/ 15;

    for (int i = 0; i < countOfChildren; i++)
      widgetList.add(
        Container(
          margin: EdgeInsets.only(left: 10.0),
          height: 2,
          width: 5,
          color: Colors.grey,
        ),
      );

    return widgetList;
  }
}
