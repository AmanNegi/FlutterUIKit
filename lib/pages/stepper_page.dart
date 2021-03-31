import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../layout/back_layout.dart';

class StepperPage extends StatefulWidget {
  static const String route = "/StepperPage";
  @override
  _StepperPageState createState() => _StepperPageState();
}

class _StepperPageState extends State<StepperPage> {
  double width, height;
  int currentStep = 0;
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      height = constraints.maxHeight;
      width = constraints.maxWidth;
      return Theme(
        data: ThemeData(
          primarySwatch: Colors.green,
          fontFamily: GoogleFonts.ubuntu().fontFamily,
        ),
        child: Scaffold(
          appBar: AppBar(
            title: Text("Stepper Page"),
          ),
          body: BackLayout(
            size: Size(width, height),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(width: width),
                  Stepper(
                    onStepContinue: () {
                      if (currentStep < 5) currentStep++;
                      setState(() {});
                    },
                    onStepCancel: () {
                      if (currentStep >= 1) {
                        currentStep--;
                        setState(() {});
                      }
                    },
                    currentStep: currentStep,
                    onStepTapped: (value) {
                      currentStep = value;
                      setState(() {});
                    },
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
                          )),
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
                              Text("I agree to the terms and conditions"),
                            ],
                          )),
                      _buildStep(
                          2,
                          "Give Permissions",
                          "Grant permissions for proper functioning of app",
                          Column(
                            children: [],
                          )),
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
                          )),
                      _buildStep(
                          4,
                          "Get Started",
                          "",
                          Column(
                            children: [],
                          )),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }

  _buildStep(int index, String text, String subtitle, Widget content) {
    return Step(
      content: content,
      title: Text(text),
      isActive: currentStep == index,
      subtitle: Text(subtitle),
    );
  }
}
