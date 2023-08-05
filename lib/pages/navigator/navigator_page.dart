import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'package:feature_discovery/feature_discovery.dart';

import 'package:flutter_ui_kit/pages/navigator/components/horizontal_list.dart';
import 'package:flutter_ui_kit/pages/navigator/components/vertical_list.dart';
import 'package:flutter_ui_kit/layout/side_drawer.dart';

class NavigatorPage extends StatefulWidget {
  static const String route = "/NavigatorPage";

  @override
  _NavigatorPageState createState() => _NavigatorPageState();
}

class _NavigatorPageState extends State<NavigatorPage> {
  var height, width;
  bool showList = false;

  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      FeatureDiscovery.discoverFeatures(
          context, <String>['pageView', 'left', "up", "down", "right"]);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;

    return Scaffold(
      key: _scaffoldKey,
      drawer: SideDrawer(),
      appBar: _getAppBar(),
      body: showList ? VerticalList() : HorizontalList(),
    );
  }

  AppBar _getAppBar() {
    return AppBar(
      automaticallyImplyLeading: false,
      actions: [
        DescribedFeatureOverlay(
          barrierDismissible: false,
          featureId: "pageView",
          title: Text("Change Viewing mode using this button"),
          tapTarget: Icon(MdiIcons.viewDayOutline),
          child: IconButton(
              tooltip: "Change viewing mode",
              icon: Icon(
                !showList
                    ? MdiIcons.viewDayOutline
                    : MdiIcons.viewCarouselOutline,
              ),
              onPressed: () {
                showList = !showList;
                setState(() {});
              }),
        )
      ],
      leading: IconButton(
        icon: Icon(
          MdiIcons.sortVariant,
        ),
        onPressed: () => _scaffoldKey.currentState!.openDrawer(),
      ),
      title: Text(
        "Index Page",
      ),
      elevation: 0,
      centerTitle: true,
    );
  }
}
