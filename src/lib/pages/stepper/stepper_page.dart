import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'package:flutter_ui_kit/layout/back_layout.dart';

/// NOTE: Do not copy [StepperPage] widget
/// Copy the [StepperWidget] widget

class StepperPage extends StatefulWidget {
  static const String route = "/StepperPage";
  @override
  _StepperPageState createState() => _StepperPageState();
}

class _StepperPageState extends State<StepperPage> {
  late double width, height;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      height = constraints.maxHeight;
      width = constraints.maxWidth;
      return Theme(
        data: ThemeData(
          primarySwatch: Colors.indigo,
          primaryColor: StepperWidget.mainColor,
          fontFamily: GoogleFonts.ubuntu().fontFamily,
        ),
        child: Scaffold(
          body: BackLayout(
            size: Size(width, height),
            child: StepperWidget(width, height),
          ),
        ),
      );
    });
  }
}

/// NOTE: Copy the below widget
/// Remember to wrap the contents in a [Scaffold] widget
/// You can remove the contructor values [height] and [width]

class StepperWidget extends StatefulWidget {
  final double height, width;
  static final Color mainColor = Color(0xFF3a35f2);

  const StepperWidget(this.width, this.height, {super.key});

  @override
  State<StepperWidget> createState() => _StepperWidgetState();
}

class _StepperWidgetState extends State<StepperWidget> {
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

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xFFdbe3f6),
            Color(0xFFfcfdff),
          ],
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
        ),
      ),
      child: Column(
        children: [
          SizedBox(
              height: MediaQuery.of(context).padding.top + (0.05 * height)),
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0),
                  color: StepperWidget.mainColor,
                ),
                padding: EdgeInsets.all(7.0),
                child: Icon(
                  MdiIcons.circle,
                  color: Colors.white,
                  size: 15,
                ),
              ),
            ),
          ),
          _buildStepper(),
          Spacer(),
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              margin: EdgeInsets.only(left: 20.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.0),
                border: Border.all(
                  color: StepperWidget.mainColor.withOpacity(0.25),
                  width: 0.75,
                ),
              ),
              padding: EdgeInsets.all(10.0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    MdiIcons.progressQuestion,
                    color: StepperWidget.mainColor,
                    size: 30,
                  ),
                  SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Having troubles?",
                        style: Theme.of(context).textTheme.labelSmall!.copyWith(
                              color: Colors.grey[500],
                            ),
                      ),
                      SizedBox(height: 1),
                      Text(
                        "Contact Us",
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.w700),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
          Spacer(),
        ],
      ),
    );
  }

  _buildStepper() {
    return Container(
      child: Stepper(
        currentStep: 4,
        steps: [
          _buildStep(
            0,
            "Enter your details",
            "",
            Column(
              children: [
                TextField(
                  decoration: InputDecoration(
                    hintText: "Email",
                  ),
                ),
                TextField(
                  decoration: InputDecoration(
                    hintText: "Password",
                  ),
                ),
              ],
            ),
          ),
          _buildStep(
            1,
            "Agree Terms and Conditions",
            "",
            Row(
              children: [
                Checkbox(
                  value: true,
                  onChanged: (value) {},
                ),
                Text(
                  "I agree to the terms and conditions",
                  maxLines: 2,
                ),
              ],
            ),
          ),
          _buildStep(
            2,
            "Give Permissions",
            "Grant permissions for proper functioning of app",
            Column(
              children: [],
            ),
          ),
          _buildStep(
            3,
            "Enter your payment details",
            "",
            Column(
              children: [
                TextField(
                  decoration: InputDecoration(
                    hintText: "Card number",
                  ),
                ),
              ],
            ),
          ),
          _buildStep(
            4,
            "Get Started",
            "",
            Column(
              children: [],
            ),
          ),
        ],
      ),
    );
  }

  Step _buildStep(int index, String text, String subtitle, Widget content) {
    return Step(
      content: content,
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "STEP ${index + 1}",
            style: Theme.of(context).textTheme.labelSmall,
          ),
          SizedBox(height: 1),
          Text(
            text,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 16,
              color: isActive(index) ? Colors.black : Color(0xFF979da9),
            ),
          ),
        ],
      ),
      isActive: isActive(index),
      state: isActive(index) ? StepState.complete : StepState.indexed,
    );
  }

  bool isActive(index) => (index == 0 || index == 1);
}
