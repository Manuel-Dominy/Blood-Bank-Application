import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:reddot/screens/screen_home.dart';
import 'package:reddot/screens_admin/adminhome.dart';

class AorU extends StatelessWidget {
  const AorU({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 100.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: SizedBox(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (context) {
                          return Signin();
                        }));
                      },
                      child: Container(
                        height: 100,
                        width: 100,
                        decoration: const BoxDecoration(
                            color: Colors.transparent,
                            borderRadius:
                                BorderRadius.all(Radius.circular(40))),
                        child: Center(
                          child: Image.asset(
                              'assets/icon-ico-files-admin-system-administrator-ico-icon-download-user-profile-password-megaphone-login-removebg-preview.png'),
                        ),
                      ),
                    ),
                    const Text("Admin"),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) {
                        return HomeScreen();
                      }));
                    },
                    child: Container(
                      height: 100,
                      width: 100,
                      decoration: const BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.all(Radius.circular(40))),
                      child: Center(
                        child:
                            Image.asset('assets/images-removebg-preview.png'),
                      ),
                    ),
                  ),
                  const Text('User'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
