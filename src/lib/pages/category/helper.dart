import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

List<Category> categories = [
  Category(
      icon: MdiIcons.materialDesign,
      subTitle: "9000+ jobs",
      title: "Design",
      color: Colors.blue),
  Category(
    icon: MdiIcons.usb,
    subTitle: "85000+ jobs",
    title: "IT",
    color: Colors.green,
  ),
  Category(
    icon: MdiIcons.graph,
    subTitle: "6500+ jobs",
    title: "Marketing",
    color: Colors.amber,
  ),
  Category(
    icon: MdiIcons.googleClassroom,
    subTitle: "8500+ jobs",
    title: "Teaching",
    color: Colors.orange,
  ),
  Category(
    icon: MdiIcons.compass,
    subTitle: "9500+ jobs",
    title: "Engineering",
    color: Colors.indigo,
  ),
  Category(
    icon: MdiIcons.heart,
    subTitle: "5000+ jobs",
    title: "Medical",
    color: Colors.pink,
  ),
];

class Category {
  String title;
  String subTitle;
  IconData icon;
  Color color;

  Category(
      {required this.icon,
      required this.subTitle,
      required this.title,
      required this.color});
}
