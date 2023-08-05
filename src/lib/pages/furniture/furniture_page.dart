import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:flutter_ui_kit/layout/back_layout.dart';
import 'detail/furniture_detail_page.dart';
import "helper.dart";

/// NOTE: Do not copy [FurniturePage] widget
/// Copy the [FurnitureWidget] widget

class FurniturePage extends StatefulWidget {
  static const String route = "/FurniturePage";

  @override
  _FurniturePageState createState() => _FurniturePageState();
}

Color primaryColor = Color(0xFFeeb901);
Color disabledColor = Color(0xFF494949);

class _FurniturePageState extends State<FurniturePage> {
  late double height, width;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      width = constraints.maxWidth;
      height = constraints.maxHeight;

      return Theme(
        data: ThemeData(
          primaryColor: primaryColor,
          primarySwatch: Colors.amber,
          fontFamily: GoogleFonts.poppins().fontFamily,
        ),
        child: Scaffold(
          body: BackLayout(
            size: Size(width, height),
            child: FurnitureWidget(width, height),
          ),
        ),
      );
    });
  }
}

/// NOTE: Copy the below widget
/// Remember to wrap the contents in a [Scaffold] widget
/// You can remove the contructor values [height] and [width]

class FurnitureWidget extends StatefulWidget {
  final double height, width;
  const FurnitureWidget(this.width, this.height, {super.key});

  @override
  State<FurnitureWidget> createState() => _FurnitureWidgetState();
}

class _FurnitureWidgetState extends State<FurnitureWidget> {
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
    return SingleChildScrollView(
      child: Column(
        children: [
          // As no app bar is present adding empty space at top
          SizedBox(height: MediaQuery.of(context).padding.top + 20),
          _buildSearchBar(),
          SizedBox(height: 10),
          _buildBanner(),
          SizedBox(height: 10),
          _buildHeading("Category by Style"),
          SizedBox(height: 10),
          Container(
            height: 0.2 * height,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: List.generate(
                imageList.length,
                (index) => _buildItem(
                  nameList[index],
                  imageList[index],
                ),
              ),
            ),
          ),
          SizedBox(height: 10),
          _buildHeading("More Ideas"),
          SizedBox(height: 10),
          Container(
            height: 0.225 * height,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: List.generate(
                horizontalList.length,
                (index) => _buildHorizontalItem(
                  horizontalNameList[index],
                  horizontalList[index],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  _buildHorizontalItem(String text, String image) {
    return Container(
      margin: EdgeInsets.only(top: 5.0, bottom: 5.0, left: 10.0, right: 5.0),
      child: GestureDetector(
        onTap: () {},
        child: Column(
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15.0),
                child: Image.network(
                  image,
                  width: 0.25 * height,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Text(text)
          ],
        ),
      ),
    );
  }

  _buildItem(String text, String image) {
    return Container(
      margin: EdgeInsets.only(top: 5.0, bottom: 5.0, left: 10.0, right: 5.0),
      child: GestureDetector(
        onTap: () => Navigator.of(context).pushNamed(FurnitureDetailPage.route),
        child: Column(
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15.0),
                child: Image.network(
                  image,
                  width: 0.145 * height,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Text(text)
          ],
        ),
      ),
    );
  }

  _buildHeading(String text) {
    return Container(
      margin: EdgeInsets.only(left: 10.0, right: 10.0),
      child: Row(
        children: [
          Text(
            text,
            style: TextStyle(
              color: primaryColor,
              fontWeight: FontWeight.w900,
              fontSize: 16,
            ),
          ),
          Spacer(),
          Text(
            "View All",
            style: TextStyle(color: Colors.grey[400]),
          ),
        ],
      ),
    );
  }

  _buildBanner() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15.0),
        child: Stack(
          children: [
            Container(
              height: 0.25 * height,
              color: Colors.red,
              width: double.infinity,
              child: Image.network(
                bannerImage,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              height: 0.25 * height,
              width: double.infinity,
              color: Colors.black38,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "SAVE 25%",
                    style: TextStyle(
                      color: primaryColor,
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    "Enjoy flash sale & save\n up to 100%",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: primaryColor,
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    padding:
                        EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                    child: Text("Buy Now!"),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  _buildSearchBar() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10.0),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15.0),
          boxShadow: [
            BoxShadow(
              blurRadius: 5.0,
              offset: Offset(3.0, 3.0),
              color: Colors.black.withOpacity(0.05),
              spreadRadius: 4.0,
            ),
          ]),
      child: TextField(
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: "Search",
          prefixIcon: Icon(Icons.search),
        ),
      ),
    );
  }
}
