import 'package:flutter/material.dart';
import 'package:mdi/mdi.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import '../dialogs/about_us.dart';
import 'dart:core';

class SideDrawer extends StatefulWidget {
  @override
  _SideDrawerState createState() => _SideDrawerState();
}

class _SideDrawerState extends State<SideDrawer> {
  double height, width;
  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Drawer(
      child: Column(
        children: [
          Container(height: 0.075 * height),
          Image.asset(
            "assets/icon.png",
            height: 0.2 * height,
            fit: BoxFit.fitHeight,
          ),
          SizedBox(height: 0.025 * height),
          ListTile(
            dense: true,
            leading: Icon(Mdi.github, size: 30),
            title: Text("Source Code"),
            subtitle: Text("Find the code on github"),
            onTap: () async {
              await launch("https://github.com/AmanNegi/30_days_of_flutter");
            },
          ),
          ListTile(
            dense: true,
            leading: Icon(Mdi.accountBoxOutline, size: 30),
            title: Text("Contact Us"),
            subtitle: Text("Write us a mail"),
            onTap: () {
              final Uri _emailLaunchUri = Uri(
                  scheme: 'mailto',
                  path: 'asterjoules@gmail.com',
                  queryParameters: {'subject': '30DaysOfFlutterChallenge App'});
              launch(_emailLaunchUri.toString());
            },
          ),
          ListTile(
            dense: true,
            leading: Icon(Mdi.currencyUsd, size: 30),
            title: Text("Support us"),
            subtitle: Text("Buy me a coffee"),
            onTap: () {
              launch("https://www.buymeacoffee.com/asterjoules");
            },
          ),
          ListTile(
            dense: true,
            leading: Icon(Icons.info_outline, size: 30),
            title: Text("About us"),
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
