import 'package:flutter/material.dart';

import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:flutter_ui_kit/layout/back_layout.dart';
import "helper.dart";

/// NOTE: Do not copy [SushiHomePage] widget
/// Copy the [SushiHomeWidget] widget

class SushiHomePage extends StatefulWidget {
  static const String route = "/SushiHomePage";
  @override
  _SushiHomePageState createState() => _SushiHomePageState();
}

class _SushiHomePageState extends State<SushiHomePage> {
  late double height, width;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        height = constraints.maxHeight;
        width = constraints.maxWidth;
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            leading: Icon(
              Icons.menu,
              color: Colors.white,
            ),
          ),
          extendBodyBehindAppBar: true,
          body: BackLayout(
            size: Size(width, height),
            child: SushiHomeWidget(width, height),
          ),
        );
      },
    );
  }
}

/// NOTE: Copy the below widget
/// Remember to wrap the contents in a [Scaffold] widget
/// You can remove the contructor values [height] and [width]

class SushiHomeWidget extends StatefulWidget {
  final double height, width;
  const SushiHomeWidget(this.width, this.height, {super.key});

  @override
  State<SushiHomeWidget> createState() => _SushiHomeWidgetState();
}

class _SushiHomeWidgetState extends State<SushiHomeWidget> {
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
        // The white background
        Container(
          height: height,
          width: double.infinity,
          color: Colors.grey[100],
        ),
        // The half page black background
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: Container(
            height: 0.6 * height,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(30.0),
                bottomLeft: Radius.circular(30.0),
              ),
            ),
          ),
        ),
        _buildPage(),
      ],
    );
  }

  _buildPage() {
    return SingleChildScrollView(
      child: Container(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 0.2 * height,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(MdiIcons.foodCroissant, size: 150, color: Colors.orange),
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "UMAMI",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 50,
                          fontFamily: GoogleFonts.oswald().fontFamily,
                        ),
                      ),
                      Text(
                        "SUSHI BAR",
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: GoogleFonts.oswald().fontFamily,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 0.075 * height),
            Container(
              height: 0.3 * height,
              child: ListView(
                  padding: EdgeInsets.only(left: 20.0),
                  scrollDirection: Axis.horizontal,
                  children: List.generate(listSushiItem.length,
                      (index) => _buildItem(listSushiItem[index]))),
            ),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 15.0, top: 10.0, bottom: 0.0),
                    child: Text(
                      "Categories",
                      style: TextStyle(
                          fontFamily: GoogleFonts.lato().fontFamily,
                          fontWeight: FontWeight.w500,
                          fontSize: 20),
                    ),
                  ),
                  Container(
                    height: 0.125 * height,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        _buildInfoItem("Sushi", MdiIcons.fire),
                        _buildInfoItem("Pork", MdiIcons.foodSteak),
                        _buildInfoItem("Top", MdiIcons.star),
                        _buildInfoItem("Veg", MdiIcons.foodApple),
                        _buildInfoItem("Drinks", MdiIcons.foodForkDrink),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  _buildInfoItem(String text, IconData icon) {
    return Container(
      margin: EdgeInsets.all(5.0),
      width: 0.1 * height,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon),
            Text(
              text,
              style: TextStyle(
                fontSize: 18,
                fontFamily: GoogleFonts.caveat().fontFamily,
              ),
            ),
          ],
        ),
      ),
    );
  }

  _buildItem(SushiItem item) {
    return Container(
      margin: EdgeInsets.only(top: 5.0, bottom: 5.0, right: 20.0),
      width: 0.45 * width,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Column(
        children: [
          Image.asset(
            item.image,
            height: 0.225 * height,
          ),
          Spacer(),
          Text(
            item.text,
            style: TextStyle(
                fontFamily: GoogleFonts.poppins().fontFamily,
                fontWeight: FontWeight.w700,
                fontSize: 16),
          ),
          SizedBox(height: 10)
        ],
      ),
    );
  }
}
