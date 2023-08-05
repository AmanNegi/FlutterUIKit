import "package:flutter/material.dart";
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'package:flutter_ui_kit/sheets/normal_bottom_sheet.dart';
import 'package:flutter_ui_kit/dialogs/plain_dialog.dart';
import 'package:flutter_ui_kit/dialogs/popup_dialog.dart';
import 'package:flutter_ui_kit/painters/book_painter.dart';

import 'package:flutter_ui_kit/layout/back_layout.dart';

import 'helper.dart';

/// NOTE: Do not copy [AuthPage] widget
/// Copy the [AuthWidget] widget

class ChairHomePage extends StatefulWidget {
  static const String route = "/ChairHomePage";
  @override
  _ChairHomePageState createState() => _ChairHomePageState();
}

class _ChairHomePageState extends State<ChairHomePage> {
  late double height, width;
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      height = constraints.maxHeight;
      width = constraints.maxWidth;
      return Scaffold(
        key: _scaffoldKey,
        extendBodyBehindAppBar: true,
        appBar: _buildAppBar(),
        body: ChairHomeWidget(width, height),
      );
    });
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: IconButton(
        icon: Icon(
          MdiIcons.sortVariant,
          color: Colors.black,
        ),
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) => PlainDialog(),
          );
        },
      ),
      actions: [
        IconButton(
          icon: Icon(
            MdiIcons.textBox,
            color: Colors.black,
          ),
          onPressed: () {
            showSnackbar();
          },
        ),
        IconButton(
          icon: Icon(
            MdiIcons.paperCutVertical,
            color: Colors.black,
          ),
          onPressed: () {
            _scaffoldKey.currentState!.showBottomSheet(
              (context) => NormalBottomSheet(),
            );
          },
        ),
        IconButton(
          icon: Icon(
            MdiIcons.searchWeb,
            color: Colors.black,
          ),
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) => PopupDialog(),
            );
          },
        ),
      ],
    );
  }

  showSnackbar() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          "You clicked on a icon!",
          style: TextStyle(
            color: Colors.black,
            fontFamily: Theme.of(context).textTheme.bodyLarge!.fontFamily,
          ),
        ),
        duration: Duration(seconds: 2),
        elevation: 30,
        backgroundColor: Theme.of(context).canvasColor,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        action: SnackBarAction(
          label: "Ok",
          textColor: ChairHomeWidget.primaryColor,
          onPressed: () {},
        ),
      ),
    );
  }
}

/// NOTE: Copy the below widget
/// Remember to wrap the contents in a [Scaffold] widget
/// You can remove the contructor values [height] and [width]

class ChairHomeWidget extends StatefulWidget {
  final double height, width;
  static Color primaryColor = Color(0xFF005dff);

  const ChairHomeWidget(this.width, this.height, {super.key});

  @override
  State<ChairHomeWidget> createState() => _ChairHomeWidgetState();
}

class _ChairHomeWidgetState extends State<ChairHomeWidget> {
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

    return CustomPaint(
      painter: BookPainter(),
      child: Container(
        height: height,
        width: width,
        child: BackLayout(
          size: Size(width, height),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).padding.top + 54,
                ),
                Container(
                  height: 0.325 * height,
                  child: Container(
                    margin: EdgeInsets.only(
                        left: 40.0, right: 40.0, bottom: 40.0, top: 20.0),
                    child: Center(
                      child: Image.asset(
                        "assets/birds.png",
                        alignment: Alignment.centerRight,
                        fit: BoxFit.cover,
                      ),
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 10.0,
                          spreadRadius: 10.0,
                          color: Colors.black.withOpacity(0.05),
                        ),
                      ],
                      color: Colors.white,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Text(
                    "BEST SELLING",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                Container(
                  height: 0.4 * height,
                  child: ListView.builder(
                    itemBuilder: (BuildContext context, int index) {
                      return _buildItem(
                          index % 2 == 0 ? listOfItems[0] : listOfItems[1]);
                    },
                    scrollDirection: Axis.horizontal,
                    itemCount: 5,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Text(
                    "TRENDING",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                Container(
                  height: 0.435 * height,
                  child: ListView.builder(
                    itemBuilder: (BuildContext context, int index) {
                      return _buildItem(
                          index % 2 == 0 ? listOfItems[1] : listOfItems[0]);
                    },
                    scrollDirection: Axis.horizontal,
                    itemCount: 5,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _buildItem(Chair item) {
    return Container(
      margin: EdgeInsets.all(8.0),
      width: 0.5 * width,
      child: Stack(
        children: [
          Center(
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: Container(
                width: 0.5 * width,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15.0),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        blurRadius: 10.0,
                        spreadRadius: 10.0),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 0.2 * height,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset(item.image),
                      ),
                    ),
                    Spacer(),
                    Padding(
                      padding: EdgeInsets.only(left: 8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            item.title,
                            maxLines: 1,
                            overflow: TextOverflow.fade,
                            style: TextStyle(
                              fontWeight: FontWeight.w800,
                              fontSize: 18,
                            ),
                          ),
                          Text(
                            item.subTitle,
                            maxLines: 1,
                            overflow: TextOverflow.fade,
                            style: TextStyle(color: Colors.grey),
                          ),
                          Text(
                            "₹ " + item.price,
                            maxLines: 1,
                            overflow: TextOverflow.fade,
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w900,
                              color: ChairHomeWidget.primaryColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Spacer(),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            right: 0,
            bottom: 0,
            child: Container(
              decoration: BoxDecoration(
                color: ChairHomeWidget.primaryColor,
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(
                  MdiIcons.bookmarkOutline,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
