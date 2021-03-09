import 'package:Flutter30Days/painters/radial_painter.dart';
import 'package:flutter/material.dart';

class ProgressPage extends StatefulWidget {
  @override
  _ProgressPageState createState() => _ProgressPageState();
}

class _ProgressPageState extends State<ProgressPage>
    with SingleTickerProviderStateMixin {
  double goalCompleted = 0;

  AnimationController _animationController;
  Animation<double> _progressAnimation;

  final Duration fillDuration = Duration(milliseconds: 500);

  double progressDegrees = 0;
  var count = 0;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: fillDuration);

    _progressAnimation = Tween(begin: 0.0, end: 0.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeIn),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Spacer(),
          _buildAnimatedBuilder(),
          Spacer(),
          _buildSlider(),
          Spacer(),
          GestureDetector(
            onTap: () {
              _progressAnimation = Tween(begin: 0.0, end: 0.0).animate(
                CurvedAnimation(
                    parent: _animationController, curve: Curves.easeIn),
              );
              setState(() {});
            },
            child: Center(
              child: Container(
                height: 60,
                width: double.infinity,
                margin: EdgeInsets.symmetric(horizontal: 30.0, vertical: 20.0),
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(30.0),
                ),
                child: Center(
                  child: Text(
                    "Reset",
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  _buildSlider() {
    return Slider(
      activeColor: Colors.green,
      onChanged: (value) {
        if ((goalCompleted - value).abs() > 0.2) _animationController.reset();
        _progressAnimation = Tween(begin: goalCompleted, end: value).animate(
            CurvedAnimation(
                parent: _animationController, curve: Curves.easeIn));

        _animationController.forward();
        goalCompleted = value;
        setState(() {});
      },
      value: goalCompleted,
    );
  }

  _buildAnimatedBuilder() {
    return AnimatedBuilder(
      animation: _progressAnimation,
      builder: (context, child) {
        return CustomPaint(
          child: Container(
            height: 200.0,
            width: 200.0,
            padding: EdgeInsets.symmetric(vertical: 40.0),
            child: Center(
              child: Text(
                (_progressAnimation.value * 100).round().toString() + "%",
                style: TextStyle(
                  fontSize: 65,
                  color: Colors.grey[700],
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
          painter: RadialPainter(_progressAnimation.value * 360.0),
        );
      },
    );
  }
}
