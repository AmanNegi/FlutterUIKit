import 'package:flutter_30_days/helper/hex_code.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../layout/back_layout.dart';

class ExplorePage extends StatefulWidget {
  static const String route = "/ExplorePage";
  @override
  _ExplorePageState createState() => _ExplorePageState();
}

Color accentColor = HexColor("#806fc0");
Color secondaryColor = HexColor("#292f53");
Color mainColor = HexColor("#151a37");
Color whiteSecondaryColor = HexColor("#fbfcfd");

class _ExplorePageState extends State<ExplorePage> {
  var height, width;
  int categoryIndex = 0;
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        height = constraints.maxHeight;
        width = constraints.maxWidth;

        return Scaffold(
          backgroundColor: mainColor,
          body: _buildBody(),
        );
      },
    );
  }

  _buildBody() {
    return BackLayout(
      size: Size(width, height),
      child: SafeArea(
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 15.0, top: 15.0),
                  child: Text(
                    "Explore",
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.9),
                      fontSize: 45,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Row(
                    children: [
                      Text(
                        "Books",
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.5),
                          fontSize: 30,
                        ),
                      ),
                      Spacer(),
                      Container(
                        width: 0.5 * width,
                        height: 0.06 * height,
                        decoration: BoxDecoration(
                          color: secondaryColor,
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        child: Row(
                          children: [
                            SizedBox(width: 15),
                            Icon(
                              Icons.search,
                              color: Colors.white.withOpacity(0.5),
                            ),
                            SizedBox(width: 5),
                            Text(
                              "Search",
                              style: TextStyle(
                                color: Colors.white.withOpacity(0.5),
                              ),
                            ),
                            Spacer(),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                height: 0.75 * height,
                decoration: BoxDecoration(
                  color: secondaryColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30.0),
                    topRight: Radius.circular(30.0),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 15.0, top: 15.0, right: 15.0, bottom: 10.0),
                      child: Text(
                        "Categories",
                        style: TextStyle(
                          color: whiteSecondaryColor,
                          fontSize: 27,
                        ),
                      ),
                    ),
                    Container(
                      height: 0.25 * height,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          _buildCategoryItem("General", MdiIcons.bat, 0),
                          _buildCategoryItem("Science", MdiIcons.fire, 1),
                          _buildCategoryItem("Plants", MdiIcons.spa, 2),
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
                height: 0.4 * height,
                decoration: BoxDecoration(
                  color: whiteSecondaryColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30.0),
                    topRight: Radius.circular(30.0),
                  ),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        children: [
                          Text(
                            "Trending Books",
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Spacer(),
                          Icon(
                            MdiIcons.dotsVertical,
                            size: 26.0,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 0.275 * height,
                      child: ListView(
                        children: [
                          _buildBooksItem(
                            HexColor("#22c8bA"),
                            "assets/book1.jpg",
                          ),
                          _buildBooksItem(
                            HexColor("#e24443"),
                            "assets/book2.jpg",
                          ),
                          _buildBooksItem(
                            HexColor("#90b0d5"),
                            "assets/book3.jpg",
                          ),
                        ],
                        scrollDirection: Axis.horizontal,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _buildBooksItem(Color color, String image) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 0.4 * width,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              boxShadow: [
                BoxShadow(
                  blurRadius: 2.0,
                  spreadRadius: 1.0,
                  color: Colors.black.withOpacity(0.1),
                  offset: Offset(2.0, 7.0),
                ),
              ],
              image: DecorationImage(
                image: AssetImage(
                  image,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  _buildCategoryItem(String text, IconData icon, int index) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          categoryIndex = index;
          setState(() {});
        },
        child: Container(
          width: 0.29 * width,
          decoration: BoxDecoration(
            color: index == categoryIndex ? accentColor : HexColor("#333b60"),
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Column(
            children: [
              Spacer(),
              Icon(
                icon,
                size: 50,
                color: Colors.white,
              ),
              SizedBox(height: 5),
              Text(
                text,
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 17,
                ),
              ),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
