import 'package:flutter/material.dart';

class NormalBottomSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
              blurRadius: 60.0,
              color: Colors.black.withOpacity(0.2),
              spreadRadius: 50,
              offset: Offset(0.0, -10.0)),
        ],
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "How are you doing?",
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 30,
              ),
            ),
            Text(
              "Maybe we could help you get better",
              textAlign: TextAlign.center,
              style: TextStyle(),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 10.0,
                bottom: 10.0,
              ),
              child: Image.asset("assets/birds.png"),
            ),
          ],
        ),
      ),
    );
  }
}
