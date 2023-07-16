import 'package:flutter/material.dart';

import 'package:flutter_30_days/components/navigator/navigator.dart';
import 'package:flutter_30_days/data.dart';
import 'package:flutter_30_days/globals.dart';

class HorizontalList extends StatefulWidget {
  const HorizontalList({super.key});

  @override
  State<HorizontalList> createState() => _HorizontalListState();
}

class _HorizontalListState extends State<HorizontalList> {
  late PageController pageController;
  int currentPage = 0;

  ValueNotifier<bool> isFadedAway = ValueNotifier(false);
  bool allowChangingValue = true;

  @override
  void initState() {
    pageController = new PageController(
        viewportFraction: 0.985, initialPage: 0, keepPage: false);

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
          onPageChanged: (int page) {
            currentPage = page;
            setState(() {});
          },
          itemCount: pageList.length,
          controller: pageController,
          itemBuilder: (context, index) {
            return LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
                double value = 1.0;
                if (pageController.position.haveDimensions) {
                  value = pageController.page! - index;
                  value = (1 - (value.abs() * 0.4)).clamp(0.0, 1.0);
                }

                return Center(
                  child: Transform.scale(
                    scale: Curves.easeOut.transform(value),
                    child: PageItem(destination: pageList[index].page),
                  ),
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
          pageController: this.pageController,
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
