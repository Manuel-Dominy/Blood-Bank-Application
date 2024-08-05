import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:reddot/screens_admin/hospital.dart';
import 'package:reddot/screens_admin/hossign.dart';
import 'package:reddot/screens_admin/usernotexist.dart';
import 'package:reddot/widget/customfield.dart';
import 'package:http/http.dart' as http;

class Signin extends StatefulWidget {
  Signin({super.key});

  @override
  State<Signin> createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  final hname = TextEditingController();

  final password = TextEditingController();
  String value = "";

  Future<void> sign() async {
    http.Response response;
    response = await http.post(
        Uri.parse('http://192.168.0.109/project/query8.php'),
        body: {'hname': hname.text, 'phno': password.text});

    setState(() {
      value = jsonDecode(response.body);
    });
    print(value);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16, top: 215),
          child: Column(
            children: [
              const Text(
                "Blood Bank",
                style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                    fontSize: 30),
              ),
              const SizedBox(height: 20),
              Customfield(hint: 'Hospital Name', control: hname,s: false,),
              const SizedBox(
                height: 20,
              ),
              Customfield(hint: 'Password', control: password,s: true,),
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  sign();
                  print(value);
                  if (value == "true") {
                    Navigator.of(context)
                        .pushReplacement(MaterialPageRoute(builder: (context) {
                      return UserBlood(text: hname.text, phono: password.text);
                    }));
                  } else {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) {
                      return const Usernotexist();
                    }));
                  }
                },
                child: Container(
                  height: 50,
                  width: 170,
                  decoration: const BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.all(Radius.circular(40))),
                  child: const Center(
                    child: Text(
                      "Login",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              const Text("OR"),
              TextButton(
                  onPressed: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) {
                      return const HospitalSign();
                    }));
                  },
                  child: const Text(
                    "Signup",
                    style: TextStyle(fontSize: 20),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
