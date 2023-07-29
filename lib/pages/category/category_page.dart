import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'package:flutter_30_days/layout/back_layout.dart';
import 'package:flutter_30_days/globals.dart';

import 'helper.dart';

/// NOTE: Do not copy [CategoryPage] widget
/// Copy the [CategoryWidget] widget

class CategoryPage extends StatefulWidget {
  static const String route = "/CategoryPage";
  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  int _bottomNavIndex = 0;
  late double width, height;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        width = constraints.maxWidth;
        height = constraints.maxHeight;
        return Scaffold(
          bottomNavigationBar: _buildBottomNavBar(),
          appBar: AppBar(
            automaticallyImplyLeading: false,
            leading: IconButton(
              icon: Icon(
                MdiIcons.chevronLeft,
                color: Colors.black,
              ),
              onPressed: () {
                if (isFullScreen(Size(width, height), getSize(context)))
                  Navigator.pop(context);
              },
            ),
            backgroundColor: Colors.white,
            elevation: 0,
            title: Text(
              "Categories",
              style: TextStyle(
                fontWeight: FontWeight.w900,
                color: Colors.black,
              ),
            ),
          ),
          body: BackLayout(
            size: Size(width, height),
            child: CategoryWidget(width, height),
          ),
        );
      },
    );
  }

  Container _buildBottomNavBar() {
    return Container(
      height: kBottomNavigationBarHeight,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15.0),
          topRight: Radius.circular(15.0),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _buildNavBarItem("HOME", MdiIcons.home, 0),
          _buildNavBarItem("INBOX", MdiIcons.chat, 1),
          _buildNavBarItem("SETTINGS", MdiIcons.cog, 2),
        ],
      ),
    );
  }

  _buildNavBarItem(String text, IconData icon, int index) {
    return GestureDetector(
      onTap: () {
        this._bottomNavIndex = index;
        setState(() {});
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color:
                index == _bottomNavIndex ? Colors.blue[900] : Colors.grey[400],
          ),
          Text(
            text,
            style: TextStyle(
              color: index == _bottomNavIndex
                  ? Colors.blue[900]
                  : Colors.grey[400],
            ),
          ),
        ],
      ),
    );
  }
}

/// NOTE: Copy the below widget
/// Remember to wrap the contents in a [Scaffold] widget
/// You can remove the contructor values [height] and [width]
/// Feel free to take the [AppBar] and [BottomNavigationBar] widgets from above

class CategoryWidget extends StatefulWidget {
  final double height, width;
  const CategoryWidget(this.width, this.height, {super.key});

  @override
  State<CategoryWidget> createState() => _CategoryWidgetState();
}

class _CategoryWidgetState extends State<CategoryWidget> {
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
    return GridView.builder(
      padding: EdgeInsets.all(5.0),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 10.0,
            horizontal: 10.0,
          ),
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 20.0,
                    spreadRadius: 15.0,
                    color: Colors.black.withOpacity(0.05),
                    offset: Offset.zero,
                  ),
                ],
                color: Colors.white),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  categories[index].icon,
                  size: 40,
                  color: categories[index].color,
                ),
                SizedBox(height: 10),
                Text(
                  categories[index].title,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                  ),
                ),
                Text(
                  categories[index].subTitle,
                  style: TextStyle(
                    color: Colors.grey[400],
                    fontSize: 15,
                  ),
                )
              ],
            ),
          ),
        );
      },
      itemCount: categories.length,
    );
  }
}
