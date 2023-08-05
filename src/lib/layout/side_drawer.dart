import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'package:url_launcher/url_launcher.dart';
import '../dialogs/about_us.dart';
import 'dart:core';

class SideDrawer extends StatefulWidget {
  @override
  _SideDrawerState createState() => _SideDrawerState();
}

class _SideDrawerState extends State<SideDrawer> {
  late double height, width;

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;

    return Drawer(
      child: Column(
        children: [
          Container(height: 0.1 * height),
          Image.asset(
            "assets/logo.png",
            height: 0.1 * height,
            fit: BoxFit.fitHeight,
          ),
          SizedBox(height: 0.05 * height),
          ListTile(
            dense: true,
            leading: Icon(MdiIcons.github, size: 30),
            title: Text("Source Code"),
            subtitle: Text("Find the code on GitHub"),
            onTap: () async {
              await launchUrl(
                  Uri.parse("https://github.com/AmanNegi/FlutterUIKit"));
            },
          ),
          ListTile(
            dense: true,
            leading: Icon(MdiIcons.accountBoxOutline, size: 30),
            title: Text("Contact Us"),
            subtitle: Text("Write us a mail"),
            onTap: () {
              final Uri _emailLaunchUri = Uri(
                  scheme: 'mailto',
                  path: 'asterjoules@gmail.com',
                  queryParameters: {'subject': '30DaysOfFlutterChallenge App'});
              launchUrl(Uri.parse(_emailLaunchUri.toString()));
            },
          ),
          ListTile(
            dense: true,
            leading: Icon(MdiIcons.currencyUsd, size: 30),
            title: Text("Support Us"),
            subtitle: Text("Buy me a coffee"),
            onTap: () {
              launchUrl(Uri.parse("https://www.buymeacoffee.com/asterjoules"));
            },
          ),
          ListTile(
            dense: true,
            leading: Icon(Icons.info_outline, size: 30),
            title: Text("About Us"),
            onTap: () => showDialog(
              context: context,
              builder: (context) => AboutUsDialog(),
            ),
          ),
        ],
      ),
    );
  }
}
