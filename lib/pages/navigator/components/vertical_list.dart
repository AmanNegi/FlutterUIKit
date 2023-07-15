import 'package:flutter/material.dart';
import 'package:flutter_30_days/globals.dart';

class VerticalList extends StatelessWidget {
  const VerticalList({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(width: double.infinity, height: 15),
          Wrap(
            children: List.generate(buttonList.length, (index) {
              return ButtonListItem(
                text: buttonList[index].text,
                route: buttonList[index].route,
              );
            }),
          ),
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: Text(
              "@ Aster Joules",
              style: TextStyle(
                letterSpacing: 1.1,
                color: Colors.grey[700],
                fontWeight: FontWeight.w600,
              ),
            ),
          )
        ],
      ),
    );
  }
}

class ButtonListItem extends StatelessWidget {
  final String text;
  final String route;

  const ButtonListItem({required this.text, required this.route});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0, top: 8.0),
      child: ElevatedButton(
        onPressed: () => Navigator.of(context).pushNamed(route),
        child: Text(text),
      ),
    );
  }
}
