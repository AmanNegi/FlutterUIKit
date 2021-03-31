import 'package:Flutter30Days/helper/hex_code.dart';
import 'package:flutter/material.dart';
import 'package:mdi/mdi.dart';
import '../layout/back_layout.dart';

class SliverPage extends StatefulWidget {
  static const String route = "/SliverPage";
  @override
  _SliverPageState createState() => _SliverPageState();
}

class _SliverPageState extends State<SliverPage> {
  ValueNotifier<double> intValueNotifier;
  var width, height;
  ScrollController scrollController = ScrollController();
  @override
  void initState() {
    super.initState();
    scrollController.addListener(() {
      double percent = (scrollController.position.pixels /
              scrollController.position.maxScrollExtent) *
          100;

      intValueNotifier.value = (width / 100) * percent;
    });
  }

  @override
  Widget build(BuildContext context) {
    intValueNotifier = ValueNotifier(0);

    return LayoutBuilder(
      builder: (context, constraints) {
        width = constraints.maxWidth;
        height = constraints.maxHeight;
        return Scaffold(
          body: _buildBody(context),
        );
      },
    );
  }

  _buildBody(BuildContext context) {
    return BackLayout(
      child: CustomScrollView(
        controller: scrollController,
        slivers: [
          SliverAppBar(
            leading: IconButton(
              icon: Icon(Mdi.chevronLeft),
              onPressed: () => Navigator.pop(context),
            ),
            actions: [
              IconButton(
                icon: Icon(Icons.help_outline),
                onPressed: () {},
              ),
            ],
            forceElevated: true,
            expandedHeight: 0.6 * height,
            backgroundColor: HexColor("#11998e"),
            pinned: true,
            flexibleSpace: LayoutBuilder(
              builder: (context, constraints) {
                return FlexibleSpaceBar(
                  title: Text("Sliver App Bar"),
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
      ),
      size: Size(width, height),
    );
  }

  List<Widget> getListItems(int count) {
    List<Widget> toReturn = new List.empty(growable: true);
    for (int i = 0; i < count; i++) {
      if (i == 0) {
        toReturn.add(SizedBox(
          height: 20,
        ));
        toReturn.add(_buildItem());
      } else if ((i - 1) == count) {
        toReturn.add(_buildItem());
        toReturn.add(SizedBox(
          height: 20,
        ));
      } else
        toReturn.add(_buildItem());
    }
    return toReturn;
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
                boxShadow: [
                  BoxShadow(
                      blurRadius: 5.0,
                      color: Colors.black.withOpacity(0.05),
                      spreadRadius: 5.0)
                ]),
          ),
          ValueListenableBuilder(
            valueListenable: intValueNotifier,
            builder: (context, value, child) {
              return Container(
                width: value,
                height: 0.15 * height,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        HexColor("#11998e").withOpacity(0.5),
                        HexColor("#38ef7d").withOpacity(0.5),
                      ],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ),
                    borderRadius: BorderRadius.circular(20.0),
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 5.0,
                          color: Colors.black.withOpacity(0.05),
                          spreadRadius: 5.0)
                    ]),
              );
            },
          ),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(20.0),
                boxShadow: [
                  BoxShadow(
                      blurRadius: 5.0,
                      color: Colors.black.withOpacity(0.05),
                      spreadRadius: 5.0)
                ]),
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
        // Expanded(
        //   child: Container(
        //     decoration: BoxDecoration(
        //       color: Colors.green.withOpacity(0.6),
        //       borderRadius: BorderRadius.only(
        //           topRight: Radius.circular(20.0),
        //           bottomRight: Radius.circular(20.0)),
        //     ),
        //   ),
        // )
      ],
    );
  }
}
