// (local) List of images used
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

List<String> _images = [
  "https://images.pexels.com/photos/4503273/pexels-photo-4503273.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940",
  "https://images.pexels.com/photos/808510/pexels-photo-808510.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940",
  "https://images.pexels.com/photos/1055379/pexels-photo-1055379.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
];

/// List of [ImageModel] to be consumed
List<ImageModel> imageList = [
  ImageModel("Herbs", _images[0]),
  ImageModel("Succlents", _images[1]),
  ImageModel("Palms", _images[2]),
];

/// Model to intertwine the image and its name
class ImageModel {
  String name;
  String image;

  ImageModel(this.name, this.image);
}

// App Bar
PreferredSizeWidget getAppBar() {
  return AppBar(
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
  );
}
