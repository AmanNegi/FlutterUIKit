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
                "assets/icon.png",
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
                      text: "This app is a collection of all the pages made by",
                    ),
                    TextSpan(
                        style: TextStyle(
                          color: Colors.indigo,
                          fontWeight: FontWeight.w900,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () async {
                            await launchUrl(
                              Uri.parse("https://github.com/AmanNegi"),
                            );
                          },
                        text: " me "),
                    TextSpan(
                        text:
                            "in the 30 days of flutter challenge. Hope you like it. The source code is available on"),
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
                        text: " Github. "),
                    TextSpan(
                        text:
                            "\n\nPlease don't copy the whole project as it's MIT licensed, you can copy/use small snippets of code. Please don't reupload the same apk on any stores."),
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
