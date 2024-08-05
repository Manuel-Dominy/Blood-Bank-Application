import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CustomContainer extends StatelessWidget {
  const CustomContainer(
      {super.key,
      required this.color,
      required this.text1,
      required this.text2,
      required this.string});
  final Color color;
  final Widget text1;
  final Widget text2;
  final String string;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Container(
        height: 200,
        decoration: BoxDecoration(
          color: color,
          borderRadius: const BorderRadius.all(Radius.circular(8)),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 16.0, left: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              text1,
              text2,
              Padding(
                padding: const EdgeInsets.only(left: 80.0),
                child: SizedBox(height: 80, child: Image.asset(string)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
