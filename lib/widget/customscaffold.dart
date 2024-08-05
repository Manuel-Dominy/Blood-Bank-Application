import 'package:flutter/material.dart';

class CustomScaffold extends StatelessWidget {
  const CustomScaffold({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
                width: double.infinity,
                height: 200,
                decoration: const BoxDecoration(color: Colors.red),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                        height: 50,
                        child: Image.asset(
                            'assets/lovepik-a-drop-of-blood-png-image_401339392_wh1200-removebg-preview.png')),
                    const Text(
                      "LifeSource",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    )
                  ],
                )),
            SizedBox(
              child: child,
            ),
          ],
        ),
      ),
    );
  }
}
