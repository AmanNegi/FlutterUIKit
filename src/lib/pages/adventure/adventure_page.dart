import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../layout/back_layout.dart';

/// NOTE: Do not copy [AdventurePage] widget
/// Copy the [AdventureWidget] widget

class AdventurePage extends StatefulWidget {
  static const String route = "/AdventurePage";
  @override
  _AdventurePageState createState() => _AdventurePageState();
}

class _AdventurePageState extends State<AdventurePage> {
  late double height, width;
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      height = constraints.maxHeight;
      width = constraints.maxWidth;
      return Scaffold(
        bottomNavigationBar: Container(
          height: kBottomNavigationBarHeight,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildBottomNavItem(0, MdiIcons.compass),
              _buildBottomNavItem(1, MdiIcons.grid),
              _buildBottomNavItem(2, MdiIcons.chat),
              _buildBottomNavItem(3, MdiIcons.homeAnalytics),
            ],
          ),
        ),
        body: _buildBody(),
      );
    });
  }

  _buildBody() {
    return BackLayout(
      size: Size(width, height),
      child: AdventureWidget(width, height),
    );
  }

  _buildBottomNavItem(int index, IconData icon) {
    return GestureDetector(
      onTap: () {
        this._currentIndex = index;
        setState(() {});
      },
      child: Container(
        decoration: BoxDecoration(
          color: index == _currentIndex
              ? AdventureWidget.basicColor
              : Colors.white,
          borderRadius: BorderRadius.circular(30.0),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20.0,
            vertical: 12.0,
          ),
          child: Icon(
            icon,
            color: index == _currentIndex
                ? Colors.white
                : AdventureWidget.basicColor.withOpacity(0.6),
          ),
        ),
      ),
    );
  }
}

/// NOTE: Copy the below widget
/// Remember to wrap the contents in a [Scaffold] widget
/// You can remove the contructor values [height] and [width]

class AdventureWidget extends StatefulWidget {
  static Color basicColor = Color(0xFF56756d);

  final double width, height;
  const AdventureWidget(this.width, this.height, {super.key});

  @override
  State<AdventureWidget> createState() => _AdventureWidgetState();
}

class _AdventureWidgetState extends State<AdventureWidget> {
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

    return SafeArea(
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildTopBar(),
              _buildHeading(),
              Container(
                height: 0.56 * height,
                width: width,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    _buildItem(1),
                    _buildItem(2),
                    _buildItem(4),
                    _buildItem(3),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Container _buildTopBar() {
    return Container(
      width: width,
      height: 0.05 * height,
      child: Padding(
        padding: const EdgeInsets.only(left: 15.0, right: 15.0, top: 10.0),
        child: Row(
          children: [
            Text(
              "Good Morning",
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
            Spacer(),
            CircleAvatar(
              backgroundImage: AssetImage("assets/person1.jpg"),
            ),
          ],
        ),
      ),
    );
  }

  Container _buildItem(int count) {
    return Container(
      margin: EdgeInsets.all(5.0),
      width: 0.675 * width,
      child: Stack(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15.0),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 8.0,
                        offset: Offset(6.0, 6.0),
                        spreadRadius: 5.0),
                  ],
                  image: DecorationImage(
                    image: AssetImage("assets/$count.jpg"),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Spacer(),
                      SizedBox(width: double.infinity),
                      Text(
                        "Heading $count",
                        maxLines: 1,
                        overflow: TextOverflow.fade,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w800,
                          fontSize: 23,
                        ),
                      ),
                      Text(
                        "Subheading",
                        maxLines: 1,
                        overflow: TextOverflow.fade,
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 18,
                        ),
                      ),
                      SizedBox(height: 20)
                    ],
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 0,
            right: 0.1 * width,
            child: Container(
              height: 0.125 * width,
              width: 0.125 * width,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AdventureWidget.basicColor,
              ),
              child: Center(
                child: Text(
                  "GO",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Padding _buildHeading() {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: RichText(
        text: TextSpan(
          style: TextStyle(
            fontFamily: GoogleFonts.poppins().fontFamily,
            fontSize: 30,
          ),
          children: [
            TextSpan(
              text: "The Best",
              style:
                  TextStyle(fontWeight: FontWeight.w800, color: Colors.black),
            ),
            TextSpan(
              text: "\nadventure trips\nIn the world",
              style: TextStyle(color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}
