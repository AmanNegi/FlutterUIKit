import 'package:flutter/material.dart';

import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:flutter_ui_kit/layout/back_layout.dart';

/// NOTE: Do not copy [SettingsPage] widget
/// Copy the [SettingsWidget] widget

class SettingsPage extends StatefulWidget {
  static const String route = "/SettingsPage";
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
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
          ),
          child: Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              backgroundColor: Colors.transparent,
              elevation: 0,
              title: Text(
                "Settings",
                style: TextStyle(color: Colors.black),
              ),
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: Text(
                    "Aa",
                    style: TextStyle(color: Colors.grey[400]),
                  ),
                )
              ],
            ),
            body: BackLayout(
              size: Size(width, height),
              child: SettingsWidget(width, height),
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

class SettingsWidget extends StatefulWidget {
  final double height, width;
  const SettingsWidget(this.width, this.height, {super.key});

  @override
  State<SettingsWidget> createState() => _SettingsWidgetState();
}

class _SettingsWidgetState extends State<SettingsWidget> {
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

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            _getGradientContainer(),
            _getProfileImage(),
          ],
        ),
        Divider(),
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Text(
            "Account",
            style: TextStyle(color: Colors.grey[400], fontSize: 13),
          ),
        ),
        Divider(),
        _buildItem(
          "Email",
          "alice@email.com",
          MdiIcons.sendOutline,
          Color(0xFF75abb5),
        ),
        SizedBox(height: 10),
        _buildItem(
          "Change Password",
          "",
          MdiIcons.keyOutline,
          Color(0xFF927ae4),
        ),
        Divider(),
        Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: Text(
            "General Settings",
            style: TextStyle(color: Colors.grey[400], fontSize: 13),
          ),
        ),
        Divider(),
        _buildItem(
          "Language",
          "English",
          MdiIcons.earth,
          Color(0xFFc77099),
        ),
        SizedBox(height: 10),
        _buildItem(
          "Notifications",
          "",
          MdiIcons.bellOutline,
          Color(0xFFedd18a),
        ),
        Divider(),
      ],
    );
  }

  Positioned _getProfileImage() {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Row(
        children: [
          Spacer(),
          Column(
            children: [
              CircleAvatar(
                radius: 45,
                backgroundImage: NetworkImage(
                  "https://images.unsplash.com/photo-1598897516650-e4dc73d8e417?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=700&q=80",
                ),
              ),
              Text("Alice Margret"),
              Text(
                "@aliceMargret",
                style: TextStyle(color: Colors.grey[400]),
              ),
            ],
          ),
          Spacer(),
        ],
      ),
    );
  }

  Container _getGradientContainer() {
    return Container(
      height: 0.275 * height,
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10.0),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xFF75abb5),
                  Color(0xFFafc8cf),
                  Color(0xFFd1cdc)
                ],
              ),
              borderRadius: BorderRadius.circular(15.0),
              boxShadow: [
                BoxShadow(
                  blurRadius: 5.0,
                  offset: Offset(3.0, 3.0),
                  color: Colors.black.withOpacity(0.05),
                  spreadRadius: 4.0,
                ),
              ],
            ),
            height: 0.175 * height,
          )
        ],
      ),
    );
  }

  _buildItem(String text, String text2, IconData icon, Color color) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
      child: Row(
        children: [
          Icon(icon, color: color),
          SizedBox(width: 10),
          Text(text),
          Spacer(),
          Text(
            text2,
            style: TextStyle(color: Colors.grey, fontSize: 12),
          ),
          Icon(
            MdiIcons.chevronRight,
            color: Colors.grey,
          ),
        ],
      ),
    );
  }
}
