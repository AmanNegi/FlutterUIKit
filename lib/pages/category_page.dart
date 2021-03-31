import 'package:flutter/material.dart';
import 'package:mdi/mdi.dart';
import '../layout/back_layout.dart';

class CategoryPage extends StatefulWidget {
  static const String route = "/CategoryPage";
  @override
  _CategoryPageState createState() => _CategoryPageState();
}

List<Category> listCategory = [
  Category(
      icon: Mdi.materialDesign,
      subTitle: "9000+ jobs",
      title: "Design",
      color: Colors.blue),
  Category(
    icon: Mdi.usb,
    subTitle: "85000+ jobs",
    title: "IT",
    color: Colors.green,
  ),
  Category(
    icon: Mdi.graph,
    subTitle: "6500+ jobs",
    title: "Marketing",
    color: Colors.amber,
  ),
  Category(
    icon: Mdi.googleClassroom,
    subTitle: "8500+ jobs",
    title: "Teaching",
    color: Colors.orange,
  ),
  Category(
    icon: Mdi.compass,
    subTitle: "9500+ jobs",
    title: "Engineering",
    color: Colors.indigo,
  ),
  Category(
    icon: Mdi.heart,
    subTitle: "5000+ jobs",
    title: "Medical",
    color: Colors.pink,
  ),
];

class _CategoryPageState extends State<CategoryPage> {
  int _bottomNavIndex = 0;
  double width, height;
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
                  Mdi.chevronLeft,
                  color: Colors.black,
                ),
                onPressed: () => Navigator.pop(context)),
            backgroundColor: Colors.white,
            elevation: 0,
            title: Text(
              "Categories",
              style:
                  TextStyle(fontWeight: FontWeight.w900, color: Colors.black),
            ),
          ),
          body: BackLayout(
            size: Size(width, height),
            child: buildGridView(),
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
          _buildNavBarItem("HOME", Mdi.home, 0),
          _buildNavBarItem("INBOX", Mdi.chat, 1),
          _buildNavBarItem("SETTINGS", Mdi.cog, 2),
        ],
      ),
    );
  }

  buildGridView() {
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
                  listCategory[index].icon,
                  size: 40,
                  color: listCategory[index].color,
                ),
                SizedBox(height: 10),
                Text(
                  listCategory[index].title,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                  ),
                ),
                Text(
                  listCategory[index].subTitle,
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
      itemCount: listCategory.length,
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

class Category {
  String title;
  String subTitle;
  IconData icon;
  Color color;

  Category({this.icon, this.subTitle, this.title, this.color});
}
