import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Customfield extends StatelessWidget {
  const Customfield(
      {super.key, required this.hint, required this.control, required this.s});
  final String hint;
  final TextEditingController control;
  final bool s;

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: s,
      controller: control,
      decoration: InputDecoration(
        hintText: hint,
        border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(7))),
      ),
    );
  }
}
