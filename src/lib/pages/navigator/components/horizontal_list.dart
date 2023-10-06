import 'package:flutter/material.dart';

import 'package:flutter_ui_kit/components/navigator/navigator.dart';
import 'package:flutter_ui_kit/data.dart';
import 'package:flutter_ui_kit/globals.dart';

class HorizontalList extends StatefulWidget {
  const HorizontalList({super.key});

  @override
  State<HorizontalList> createState() => _HorizontalListState();
}

class _HorizontalListState extends State<HorizontalList> {
  late PageController pageController;

  @override
  void initState() {
    pageController = new PageController(
      viewportFraction: 0.975,
      initialPage: 0,
      keepPage: false,
    );

    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        PageView.builder(
          allowImplicitScrolling: false,
          pageSnapping: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: pageList.length,
          controller: pageController,
          itemBuilder: (context, index) {
            return LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
                return Center(
                  child: PageItem(destination: pageList[index].page),
                );
              },
            );
          },
          scrollDirection: Axis.horizontal,
        ),
        _buildNavigator(),
      ],
    );
  }

  _buildNavigator() {
    return Positioned(
      bottom: 60,
      left: 0.2 * getWidth(context),
      right: 0.2 * getWidth(context),
      child: Hero(
        tag: "herotagfor1",
        child: NavigatorWidget(
          pageController: pageController,
        ),
      ),
    );
  }
}

class PageItem extends StatelessWidget {
  final Widget destination;

  const PageItem({required this.destination});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15.0),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 8.0,
                        offset: Offset(6.0, 6.0),
                        spreadRadius: 5.0),
                  ],
                ),
                child: destination,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
