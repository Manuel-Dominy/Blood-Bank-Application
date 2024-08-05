import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Usernotexist extends StatelessWidget {
  const Usernotexist({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Padding(
        child: Text("Hospital not registered"),
        padding: EdgeInsets.only(top: 50, left: 5),
      ),
    );
  }
}
