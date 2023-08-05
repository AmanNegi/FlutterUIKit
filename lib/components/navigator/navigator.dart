import 'dart:async';

import 'package:feature_discovery/feature_discovery.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/data.dart';
import 'package:flutter_ui_kit/globals.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class NavigatorWidget extends StatefulWidget {
  final PageController pageController;

  const NavigatorWidget({
    super.key,
    required this.pageController,
  });

  @override
  State<NavigatorWidget> createState() => _NavigatorWidgetState();
}

class _NavigatorWidgetState extends State<NavigatorWidget> {
  ValueNotifier<bool> isFadedAway = ValueNotifier(false);
  bool allowChangingValue = true;

  late PageController pageController;
  int currentPage = 0;

  @override
  void initState() {
    this.pageController = widget.pageController;
    super.initState();

    pageController.addListener(() {
      currentPage = pageController.page!.round();
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onVerticalDragUpdate: (DragUpdateDetails details) async {
        if (details.delta.dy < 0) {
          // On swipe up
          Navigator.of(context).pushNamed(pageList[currentPage].routeName);
        } else if (details.delta.dy > 0) {
          // On swipe down
          if (allowChangingValue) {
            isFadedAway.value = !isFadedAway.value;
            // (locked) To prevent the user from changing the value too fast
            allowChangingValue = false;
          }
          Timer(Duration(seconds: 1), () {
            allowChangingValue = true;
          });
        }
      },
      onHorizontalDragUpdate: (DragUpdateDetails details) {
        if (details.delta.dx < 0) {
          // On swipe right
          pageController.nextPage(
              duration: Duration(milliseconds: 250),
              curve: Curves.easeInToLinear);
        } else if (details.delta.dx > 0) {
          // On swipe left
          pageController.previousPage(
              duration: Duration(milliseconds: 250),
              curve: Curves.easeInToLinear);
        }
      },
      child: ValueListenableBuilder(
        valueListenable: isFadedAway,
        builder: (BuildContext context, bool value, Widget? child) {
          return Container(
            height: 0.08 * getHeight(context),
            decoration: BoxDecoration(
              color: value ? Colors.black.withOpacity(0.2) : Colors.black,
              borderRadius: BorderRadius.circular(30.0),
            ),
            child: child,
          );
        },

        /// Ignore [OverflowError] as widget will transition
        child: OverflowBox(
          minHeight: 0,
          minWidth: 0,
          child: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                DescribedFeatureOverlay(
                  barrierDismissible: false,
                  featureId: "left",
                  overflowMode: OverflowMode.wrapBackground,
                  contentLocation: ContentLocation.above,
                  title: Text("Swipe left to go to the previous page"),
                  tapTarget: Icon(MdiIcons.chevronDoubleLeft),
                  child: Icon(
                    MdiIcons.chevronDoubleLeft,
                    color: Colors.grey[700],
                    size: 30,
                  ),
                ),
                DescribedFeatureOverlay(
                  barrierDismissible: false,
                  featureId: "down",
                  overflowMode: OverflowMode.wrapBackground,
                  contentLocation: ContentLocation.above,
                  title: Text("Swipe down to reduce opacity"),
                  tapTarget: Icon(MdiIcons.chevronDoubleDown),
                  child: DescribedFeatureOverlay(
                    barrierDismissible: false,
                    featureId: "up",
                    overflowMode: OverflowMode.wrapBackground,
                    contentLocation: ContentLocation.above,
                    title: Text("Swipe up to open the current page"),
                    tapTarget: Icon(MdiIcons.chevronDoubleUp),
                    child: Icon(
                      MdiIcons.chevronDoubleUp,
                      color: Colors.grey[700],
                      size: 30,
                    ),
                  ),
                ),
                DescribedFeatureOverlay(
                  barrierDismissible: false,
                  featureId: "right",
                  overflowMode: OverflowMode.wrapBackground,
                  contentLocation: ContentLocation.above,
                  title: Text("Swipe right to go to the next page"),
                  tapTarget: Icon(MdiIcons.chevronDoubleRight),
                  child: Icon(
                    MdiIcons.chevronDoubleRight,
                    color: Colors.grey[700],
                    size: 30,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
