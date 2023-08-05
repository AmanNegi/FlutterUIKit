import 'package:flutter/material.dart';

import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:flutter_ui_kit/styles.dart';
import 'package:flutter_ui_kit/layout/back_layout.dart';
import 'package:flutter_ui_kit/helper/hex_code.dart';
import 'helper.dart';

/// NOTE: Do not copy [PropertyPage] widget
/// Copy the [PropertyWidget] widget

class PropertyPage extends StatefulWidget {
  static const String route = "/PropertyPage";
  @override
  _PropertyPageState createState() => _PropertyPageState();
}

class _PropertyPageState extends State<PropertyPage> {
  Color mainColor = Color(0XFFEEF3F7);
  late double height, width;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        width = constraints.maxWidth;
        height = constraints.maxHeight;
        return Theme(
          data: ThemeData(
            fontFamily: GoogleFonts.poppins().fontFamily,
            scaffoldBackgroundColor: mainColor,
            primaryColor: Colors.black87,
          ),
          child: Scaffold(
            body: BackLayout(
              size: Size(width, height),
              child: PropertyWidget(width, height),
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

class PropertyWidget extends StatefulWidget {
  final double height, width;
  const PropertyWidget(this.width, this.height, {super.key});

  @override
  State<PropertyWidget> createState() => _PropertyWidgetState();
}

class _PropertyWidgetState extends State<PropertyWidget> {
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

    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: MediaQuery.of(context).padding.top + 10),
          Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                  padding: EdgeInsets.all(5.0),
                  child: Icon(MdiIcons.sortVariant),
                ),
                Spacer(),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: Text(
              "Discover\nProperties",
              style: Theme.of(context)
                  .textTheme
                  .headlineMedium!
                  .copyWith(fontWeight: FontWeight.w700, color: Colors.black),
            ),
          ),
          SizedBox(height: 0.05 * height),
          _buildSearchBar(),
          SizedBox(height: 10),
          Container(
            height: 0.325 * height,
            child: ListView.builder(
              padding: EdgeInsets.only(left: 10.0),
              scrollDirection: Axis.horizontal,
              itemCount: listImages.length,
              itemBuilder: (context, index) => _buildItem(context, index),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15.0, top: 8.0, bottom: 8.0),
            child: Text("Recommended Properties",
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(fontWeight: FontWeight.w600)),
          ),
          ListView.builder(
            shrinkWrap: true,
            itemCount: listImages.length,
            itemBuilder: (context, index) => _buildVerticalItem(context, index),
            physics: NeverScrollableScrollPhysics(),
            padding: EdgeInsets.only(left: 10.0, bottom: 10.0),
          ),
        ],
      ),
    );
  }

  _buildVerticalItem(BuildContext context, int index) {
    return Container(
      margin: EdgeInsets.all(8.0),
      padding: EdgeInsets.all(8.0),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            blurRadius: 5.0,
            offset: Offset(0.0, 3.0),
            color: Colors.black.withOpacity(0.05),
            spreadRadius: 2.0,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 0.25 * height,
            width: double.infinity,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: Image.network(listImages[index], fit: BoxFit.cover),
            ),
          ),
          SizedBox(height: 8),
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "White Smith Villa",
                    style: TextStyle(fontWeight: FontWeight.w700),
                  ),
                  Text("Meriose Venue",
                      style: Theme.of(context).textTheme.bodySmall),
                ],
              ),
              Spacer(),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 4.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0),
                  color: HexColor("#ffcfa9"),
                ),
                child: Text(
                  "\$250/mo",
                  style: TextStyle(
                    color: Colors.red,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  _buildItem(BuildContext context, int index) {
    return Container(
      margin: EdgeInsets.all(8.0),
      padding: EdgeInsets.all(8.0),
      width: 0.5 * width,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: boxShadow,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: Image.network(
                listImages[index],
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            ),
          ),
          SizedBox(height: 8),
          Text(
            "White Smith Villa",
            style: TextStyle(fontWeight: FontWeight.w700),
          ),
          Text(
            "Meriose Venue",
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ],
      ),
    );
  }

  _buildSearchBar() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            blurRadius: 5.0,
            offset: Offset(3.0, 3.0),
            color: Colors.black.withOpacity(0.05),
            spreadRadius: 4.0,
          ),
        ],
      ),
      padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 4.0),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Search",
                  contentPadding: EdgeInsets.only(left: 20.0)),
            ),
          ),
          Container(
            padding: EdgeInsets.all(10.0),
            decoration: BoxDecoration(
                color: Colors.black, borderRadius: BorderRadius.circular(10.0)),
            child: Icon(Icons.search, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
