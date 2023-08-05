import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'package:flutter_ui_kit/globals.dart';
import 'package:flutter_ui_kit/layout/back_layout.dart';

/// NOTE: Do not copy [SearchPage] widget
/// Copy the [SearchWidget] widget

class SearchPage extends StatefulWidget {
  static const String route = "/SearchPage";
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  late double height, width;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        height = constraints.maxHeight;
        width = constraints.maxWidth;

        return Scaffold(
          floatingActionButton: FloatingActionButton(
            onPressed: () {},
            backgroundColor: SearchWidget.fadedWhite,
            child: Icon(
              Icons.add,
              size: 30,
            ),
          ),
          backgroundColor: SearchWidget.accentColor,
          body: BackLayout(
            size: Size(width, height),
            child: SearchWidget(width, height),
          ),
        );
      },
    );
  }
}

/// NOTE: Copy the below widget
/// Remember to wrap the contents in a [Scaffold] widget
/// You can remove the contructor values [height] and [width]

class SearchWidget extends StatefulWidget {
  final double height, width;

  static Color accentColor = Color(0xFF382f80);
  static Color fadedWhite = Color(0xFFf5f5f5);

  const SearchWidget(this.width, this.height, {super.key});

  @override
  State<SearchWidget> createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
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
    return Stack(
      children: [
        SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  MdiIcons.menu,
                  color: Colors.white,
                  size: 30,
                ),
                SizedBox(
                  width: width,
                  height: !isFullScreen(
                    Size(width, height),
                    Size(MediaQuery.of(context).size.width,
                        MediaQuery.of(context).size.height),
                  )
                      ? 0.1 * height
                      : 0.15 * height,
                ),
                Text(
                  "Hi Jason",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 27,
                      fontWeight: FontWeight.w700),
                ),
                Text(
                  "What are you looking for?",
                  style: TextStyle(color: Colors.white, fontSize: 21),
                ),
                SizedBox(height: 10),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.white,
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Search",
                      prefixIcon: Icon(Icons.search),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30.0),
                topRight: Radius.circular(30.0),
              ),
            ),
            height: 0.52 * height,
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    left: 20.0,
                    top: 20.0,
                  ),
                  child: Text(
                    "Friends",
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 20,
                    ),
                  ),
                ),
                Container(
                  height: 0.09 * height,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      _buildFriends(0),
                      _buildFriends(1),
                      _buildFriends(2),
                      _buildFriends(3),
                      _buildFriends(4),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Container(
            decoration: BoxDecoration(
              color: SearchWidget.fadedWhite,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30.0),
                topRight: Radius.circular(30.0),
              ),
            ),
            height: 0.35 * height,
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.only(left: 20.0, top: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Recent Files",
                    style: TextStyle(
                      fontSize: 22,
                    ),
                  ),
                  SizedBox(height: 10),
                  _buildIconText("Text Results"),
                  _buildIconText("Resume 2019"),
                  _buildIconText("Presentation "),
                  _buildIconText("Presumed Values"),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  _buildIconText(String text) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Icon(MdiIcons.filePdfBox),
          SizedBox(width: 10),
          Text(
            text,
            style: TextStyle(fontSize: 17),
          ),
          Spacer(),
        ],
      ),
    );
  }

  _buildFriends(int index) {
    return Container(
      width: 0.2 * width,
      margin: EdgeInsets.all(5.0),
      height: 0.2 * width,
      decoration: BoxDecoration(
        color: SearchWidget.fadedWhite,
        shape: BoxShape.circle,
      ),
      child: CircleAvatar(
        backgroundImage: AssetImage(
            index % 2 == 0 ? "assets/person1.jpg" : "assets/person2.jpg"),
      ),
    );
  }
}
