import 'package:Flutter30Days/helper/hex_code.dart';
import 'package:flutter/material.dart';

class PlainDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 20,
            ),
            Image.asset("assets/greencheck.png", height: 75, width: 75),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                "We've got you! Please check your email for a verification message.\n\nWe will let you in once you're verified.",
                textAlign: TextAlign.center,
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                child: Center(
                  child: Text(
                    "OK",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
                width: MediaQuery.of(context).size.width * 0.6,
                height: MediaQuery.of(context).size.height * 0.045,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0),
                  color: HexColor("#2135EC"),
                ),
              ),
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
    ;
  }
}
