import 'package:flutter/material.dart';
import '../layout/back_layout.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';


class PlantPage extends StatefulWidget {
  static const String route = "/PlantDetailPage";
  @override
  _PlantPageState createState() => _PlantPageState();
}

List<String> images = [
  "https://images.pexels.com/photos/4503273/pexels-photo-4503273.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940",
  "https://images.pexels.com/photos/808510/pexels-photo-808510.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940",
  "https://images.pexels.com/photos/1055379/pexels-photo-1055379.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
];

class _PlantPageState extends State<PlantPage> {
  late double width, height;

  List<ImageModel> imageList = [
    ImageModel("Herbs", images[0]),
    ImageModel("Succlents", images[1]),
    ImageModel("Palms", images[2]),
  ];

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constrainsts) {
      height = constrainsts.maxHeight;
      width = constrainsts.maxWidth;
      return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              icon: Icon(MdiIcons.dotsVertical),
              onPressed: () {},
            ),
          ],
          automaticallyImplyLeading: false,
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: Container(
            child: Row(
              children: [
                Icon(MdiIcons.leaf),
                SizedBox(width: 5),
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Plant",
                        style: TextStyle(color: Colors.black, fontSize: 16),
                      ),
                      Text(
                        "Planner",
                        style: TextStyle(color: Colors.black, fontSize: 13),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        body: BackLayout(
            size: Size(width, height),
            child: ScrollConfiguration(
              behavior: MyBehavior(),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 10.0),
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                          prefixIcon:
                              Icon(Icons.search, color: Colors.grey[500]),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Column(
                      children: List.generate(imageList.length,
                          (index) => _buildItem(imageList[index])),
                    )
                  ],
                ),
              ),
            )),
      );
    });
  }

  _buildItem(ImageModel model) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15.0),
        child: Container(
          width: 0.9 * width,
          height: 0.3 * height,
          child: Stack(
            children: [
              Container(
                width: 0.9 * width,
                height: 0.3 * height,
                child: Center(
                  child: Image.network(
                    model.image,
                    width: 0.9 * width,
                    height: 0.3 * height,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Center(
                child: Container(
                  width: 0.9 * width,
                  height: 0.3 * height,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [
                        Colors.black54,
                        Colors.transparent,
                        Colors.transparent
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                right: 20,
                bottom: 10,
                child: Text(
                  model.name,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w700),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ImageModel {
  String name;
  String image;

  ImageModel(this.name, this.image);
}

class MyBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}
