import 'package:flutter/material.dart';

class Customblood extends StatelessWidget {
  const Customblood({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      width: 45,
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(7)),
          color: Colors.red),
      child: Center(
        child: Text(
          text,
          style: const TextStyle(color: Colors.white, fontSize: 20),
        ),
      ),
    );
  }
}
