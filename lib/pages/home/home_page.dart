import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'package:flutter_30_days/pages/home/helper.dart';
import 'package:flutter_30_days/painters/curved_painter.dart';

import 'package:flutter_30_days/helper/no_glow_scroll_behaviour.dart';
import 'package:flutter_30_days/globals.dart';
import '../../layout/back_layout.dart';

/// NOTE: Do not copy [HomePage] widget
/// Copy the [HomeWidget] widget

class HomePage extends StatefulWidget {
  static const String route = "/HomePage";
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentBottomNavBarIndex = 0;
  var width, height;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        height = constraints.maxHeight;
        width = constraints.maxWidth;

        return Scaffold(
          body: BackLayout(
            child: HomeWidget(width, height),
            size: Size(width, height),
          ),
          bottomNavigationBar: Stack(
            children: [
              Container(
                height: kBottomNavigationBarHeight,
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildBottomNavBarItem(MdiIcons.viewGridOutline, 0),
                    _buildBottomNavBarItem(MdiIcons.homeOutline, 1),
                    _buildBottomNavBarItem(MdiIcons.bellOutline, 2),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  _buildBottomNavBarItem(IconData icon, int index) {
    return GestureDetector(
      onTap: () {
        currentBottomNavBarIndex = index;
        setState(() {});
      },
      child: Container(
        decoration: BoxDecoration(
          gradient: _isCurrentIndex(index)
              ? LinearGradient(colors: [
                  Color(0xFFf6b09b),
                  Color(0xFFf9937c),
                ])
              : null,
          shape: BoxShape.circle,
        ),
        child: Padding(
          padding: const EdgeInsets.all(11.0),
          child: Icon(
            icon,
            color: _isCurrentIndex(index) ? Colors.white : Colors.grey,
            size: 27,
          ),
        ),
      ),
    );
  }

  bool _isCurrentIndex(int index) => index == currentBottomNavBarIndex;
}

/// NOTE: Copy the below widget
/// Remember to wrap the contents in a [Scaffold] widget
/// You can remove the contructor values [height] and [width]

class HomeWidget extends StatefulWidget {
  final double height, width;

  const HomeWidget(this.width, this.height, {super.key});

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
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
      painter: CurvedPainter(),
      child: SafeArea(
        child: Container(
          height: height,
          width: width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 15.0, horizontal: 15.0),
                child: Row(
                  children: [
                    Text(
                      "Beranda",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 26,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Spacer(),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white24,
                        shape: BoxShape.circle,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Icon(
                          MdiIcons.searchWeb,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15.0, bottom: 10.0),
                child: Text(
                  "Connect to People Like you",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w400),
                ),
              ),
              Container(
                height: 0.3 * height,
                child: buildListView(),
              ),
              Padding(
                padding: EdgeInsets.all(15.0),
                child: Text(
                  "Explore Communities",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 19,
                  ),
                ),
              ),
              Expanded(
                child: ScrollConfiguration(
                  behavior: NoGlowScrollBehaviour(),
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                    ),
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15.0),
                            boxShadow: [
                              BoxShadow(
                                  blurRadius: 17.0,
                                  color: Colors.black.withOpacity(0.05),
                                  offset: Offset(5.0, 10.0)),
                            ],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CircleAvatar(
                                  radius: isFullScreen(
                                    Size(width, height),
                                    Size(MediaQuery.of(context).size.width,
                                        MediaQuery.of(context).size.height),
                                  )
                                      ? (0.0425 * height)
                                      : (0.034 * height),
                                  backgroundImage: AssetImage(
                                      _getCurrentItem(index, threeCount: true)
                                          .image),
                                ),
                                SizedBox(height: 5),
                                Wrap(
                                  children: [
                                    Text(
                                      randomNames[index],
                                      maxLines: 1,
                                      overflow: TextOverflow.fade,
                                      style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black87,
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                    itemCount: 9,
                    scrollDirection: Axis.horizontal,
                  ),
                ),
              ),
              SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }

  buildListView() {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.all(15.0),
          child: Container(
            width: 0.8 * width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  blurRadius: 6.0,
                  color: Colors.black.withOpacity(0.05),
                  offset: Offset(0.0, 10.0),
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 35,
                        backgroundImage: AssetImage(
                          _getCurrentItem(index).image,
                        ),
                      ),
                      SizedBox(width: 0.025 * width),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            _getCurrentItem(index).name,
                            overflow: TextOverflow.fade,
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 18,
                            ),
                          ),
                          Text(
                            _getCurrentItem(index).subtitle,
                          )
                        ],
                      ),
                    ],
                  ),
                  Spacer(),
                  Text(
                    _getCurrentItem(index).detail,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(color: Colors.black54, fontSize: 15),
                  ),
                  Spacer(),
                ],
              ),
            ),
          ),
        );
      },
      itemCount: 6,
      scrollDirection: Axis.horizontal,
    );
  }

  Person _getCurrentItem(int index, {bool threeCount = false}) =>
      index % (threeCount ? 3 : 2) == 0 ? list[0] : list[1];
}
