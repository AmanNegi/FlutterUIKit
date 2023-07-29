import 'package:flutter/material.dart';

import 'package:flutter_30_days/layout/back_layout.dart';
import 'helper.dart';

/// NOTE: Do not copy [PlantPage] widget
/// Copy the [PlantWidget] widget

class PlantPage extends StatefulWidget {
  static const String route = "/PlantDetailPage";
  @override
  _PlantPageState createState() => _PlantPageState();
}

class _PlantPageState extends State<PlantPage> {
  late double height, width;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constrainsts) {
      height = constrainsts.maxHeight;
      width = constrainsts.maxWidth;
      return Scaffold(
        appBar: getAppBar(),
        body: BackLayout(
          size: Size(width, height),
          child: PlantWidget(width, height),
        ),
      );
    });
  }
}

/// NOTE: Copy the below widget
/// 1. Remember to wrap the contents in a [Scaffold] widget
/// 2. You can remove the contructor values [height] and [width]

class PlantWidget extends StatefulWidget {
  final double height, width;
  const PlantWidget(this.width, this.height, {super.key});

  @override
  State<PlantWidget> createState() => _PlantWidgetState();
}

class _PlantWidgetState extends State<PlantWidget> {
  late double width, height;

  @override
  void initState() {
    width = widget.width;
    height = widget.height;
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
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10.0),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(30.0),
            ),
            child: TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search, color: Colors.grey[500]),
                border: InputBorder.none,
              ),
            ),
          ),
          SizedBox(height: 10),
          Column(
            children: List.generate(
                imageList.length, (index) => _buildItem(imageList[index])),
          )
        ],
      ),
    );
  }

  _buildItem(ImageModel model) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15.0),
        child: Container(
          width: 0.9 * width,
          height: 0.3 * height,
          child: Stack(
            children: [
              // The Bottom Layer Image
              Container(
                width: 0.9 * width,
                height: 0.3 * height,
                child: Center(
                  child: Image.network(
                    model.image,
                    width: 0.9 * width,
                    height: 0.3 * height,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              // The Gradient Layer
              Center(
                child: Container(
                  width: 0.9 * width,
                  height: 0.3 * height,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [
                        Colors.black54,
                        Colors.transparent,
                        Colors.transparent
                      ],
                    ),
                  ),
                ),
              ),
              // The Text Layer
              Positioned(
                right: 20,
                bottom: 10,
                child: Text(
                  model.name,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w700),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
