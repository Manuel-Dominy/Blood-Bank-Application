import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:reddot/adminorusin.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    splash();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.red,
        body: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
                'assets/lovepik-a-drop-of-blood-png-image_401339392_wh1200-removebg-preview.png',
                height: 70),
            const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "LifeSource",
                  style: TextStyle(fontSize: 40, color: Colors.white),
                ),
                Text(
                  "Donate because you can",
                  style: TextStyle(fontSize: 15, color: Colors.white),
                )
              ],
            ),
          ],
        ));
  }

  Future<void> splash() async {
    await Future.delayed(const Duration(seconds: 3));
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) {
      return const AorU();
    }));
  }
}
