import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'package:flutter_30_days/layout/back_layout.dart';
import 'package:flutter_30_days/globals.dart';
import 'helper.dart';

class SliverPage extends StatefulWidget {
  static const String route = "/SliverPage";
  @override
  _SliverPageState createState() => _SliverPageState();
}

class _SliverPageState extends State<SliverPage> {
  late double width, height;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        width = constraints.maxWidth;
        height = constraints.maxHeight;
        return Scaffold(
          body: BackLayout(
            size: Size(width, height),
            child: SliverWidget(width, height),
          ),
        );
      },
    );
  }
}

class SliverWidget extends StatefulWidget {
  final double height, width;
  const SliverWidget(this.width, this.height, {super.key});

  @override
  State<SliverWidget> createState() => _SliverWidgetState();
}

class _SliverWidgetState extends State<SliverWidget> {
  late double height, width;
  // Notifies the items of the new width to take
  late ValueNotifier<double> itemWidthNotifier;

  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    height = widget.height;
    width = widget.width;
    super.initState();
    scrollController.addListener(() {
      // Calculate the percentage of the scroll
      double percent = (scrollController.position.pixels /
              scrollController.position.maxScrollExtent) *
          100;

      // Convert the percent in relation to the width
      itemWidthNotifier.value = (width / 100) * percent;
    });
  }

  @override
  Widget build(BuildContext context) {
    itemWidthNotifier = ValueNotifier(0);
    return CustomScrollView(
      controller: scrollController,
      slivers: [
        SliverAppBar(
          leading: IconButton(
            icon: Icon(
              MdiIcons.chevronLeft,
              color: Colors.white,
            ),
            onPressed: () {
              if (isFullScreen(Size(width, height), getSize(context)))
                Navigator.pop(context);
            },
          ),
          actions: [
            IconButton(
              icon: Icon(
                Icons.help_outline,
                color: Colors.white,
              ),
              onPressed: () {},
            ),
          ],
          forceElevated: true,
          expandedHeight: 0.6 * height,
          backgroundColor: Color(0xFF11998e),
          pinned: true,
          flexibleSpace: LayoutBuilder(
            builder: (context, constraints) {
              return FlexibleSpaceBar(
                title: Text(
                  "Sliver App Bar",
                  style: TextStyle(color: Colors.white),
                ),
                centerTitle: true,
                collapseMode: CollapseMode.parallax,
                stretchModes: [
                  StretchMode.blurBackground,
                  StretchMode.fadeTitle,
                ],
                background: Image.asset(
                  "assets/person1.jpg",
                  fit: BoxFit.cover,
                ),
              );
            },
          ),
        ),
        SliverList(
          delegate: SliverChildListDelegate(getListItems(20)),
        ),
      ],
    );
  }

  List<Widget> getListItems(int count) {
    List<Widget> children = [];
    for (int i = 0; i < count; i++) {
      if (i == 0) {
        // Add spacing at top
        children.add(SizedBox(height: 20));
        children.add(_buildItem());
      } else if ((i - 1) == count) {
        children.add(_buildItem());
        // Add spacing at bottom
        children.add(SizedBox(height: 20));
      } else
        children.add(_buildItem());
    }
    return children;
  }

  _buildItem() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            height: 0.15 * height,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20.0),
              boxShadow: boxShadow,
            ),
          ),
          ValueListenableBuilder(
            valueListenable: itemWidthNotifier,
            builder: (context, value, child) {
              return Container(
                width: value,
                height: 0.15 * height,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color(0xFF11998e).withOpacity(0.5),
                      Color(0xFF38ef7d).withOpacity(0.5),
                    ],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                  borderRadius: BorderRadius.circular(20.0),
                  boxShadow: boxShadow,
                ),
              );
            },
          ),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(20.0),
                boxShadow: boxShadow),
            height: 0.15 * height,
            child: _buildItemRow(),
          ),
        ],
      ),
    );
  }

  _buildItemRow() {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: Image.asset(
              "assets/person1.jpg",
              width: 0.25 * width,
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(width: 20),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Random Text",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              "Subtitle Text",
            ),
          ],
        ),
        SizedBox(width: 20),
      ],
    );
  }
}
