import 'package:flutter/material.dart';

import 'package:flutter/gestures.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:google_fonts/google_fonts.dart';

class AboutUsDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 20,
            ),
            Center(
              child: Image.asset(
                "assets/logo.png",
                height: 100,
                fit: BoxFit.fitHeight,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: RichText(
                text: TextSpan(
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: GoogleFonts.poppins().fontFamily),
                  children: [
                    TextSpan(
                      text:
                          """FlutterUIKit is a comprehensive collection of demo screens showcasing various layout designs and components in Flutter. This repository serves as a valuable resource for beginners to learn about creating beautiful and responsive user interfaces using Flutter. Get the source code on """,
                    ),
                    TextSpan(
                        style: TextStyle(
                          color: Colors.indigo,
                          fontWeight: FontWeight.w900,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () async {
                            //TODO: CHECK THE LINK
                            await launchUrl(
                              Uri.parse(
                                  "https://github.com/AmanNegi/FlutterUIKit"),
                            );
                          },
                        text: "Github. "),
                    TextSpan(
                        text:
                            "\n\nPlease don't copy the whole project as it's AGPL-3.0 licensed, you can copy/use small snippets of code. Please don't reupload the same apk on any stores. "),
                  ],
                ),
              ),
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
