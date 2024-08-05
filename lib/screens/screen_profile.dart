import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:reddot/adminorusin.dart';
import 'package:reddot/widget/customcontainer.dart';
import 'package:http/http.dart' as http;

class Profile extends StatefulWidget {
  const Profile(
      {super.key,
      required this.hname,
      required this.age,
      required this.phono,
      required this.address,
      required this.name,
      required this.pic,
      required this.blood});
  final String name;
  final Widget pic;
  final String blood;
  final String address;
  final String age;
  final String phono;
  final String hname;

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  List listreponse = [];
  String cost = "";
  String amount = "";
  String b_no = "";
  Future<void> hey() async {
    http.Response response;
    response = await http
        .post(Uri.parse("http://192.168.0.109/project/query3.php"), body: {
      'name': widget.name,
    });
    cost = jsonDecode(response.body);
  }

  @override
  void initState() {
    hey();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: const Column(
                children: [Icon(Icons.arrow_back), Text("Goback")],
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return const AorU();
                }));
              },
              child: const Column(
                children: [Icon(Icons.person), Text("Logout")],
              ),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 40.0, left: 10),
            child: Row(
              children: [
                Container(
                    height: 70,
                    width: 70,
                    decoration: BoxDecoration(
                        color: Color.fromARGB(255, 184, 212, 236),
                        borderRadius: BorderRadius.all(Radius.circular(32))),
                    child: widget.pic),
                Padding(
                  padding: EdgeInsets.only(left: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("profile"),
                      Text(
                        widget.name,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 40.0, left: 20),
            child: Container(
              height: 100,
              width: 400,
              decoration: BoxDecoration(color: Colors.white),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Age:-${widget.age}"),
                  Text(
                    widget.address,
                    style: TextStyle(fontSize: 20),
                  ),
                  Text("contact :-${widget.phono}"),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 40.0, left: 8, right: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomContainer(
                  string: "assets/blood1-removebg-preview.png",
                  color: const Color.fromARGB(255, 236, 202, 200),
                  text1: const Text(
                    "Blood Type",
                    style: TextStyle(color: Colors.pink, fontSize: 19),
                  ),
                  text2: Text(
                    widget.blood,
                    style: const TextStyle(
                        color: Colors.pink,
                        fontSize: 50,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                CustomContainer(
                  string: "assets/cost-removebg-preview.png",
                  text1: Text(
                    "Cost/litre",
                    style: TextStyle(color: Colors.black, fontSize: 19),
                  ),
                  text2: FutureBuilder(
                    future: hey(),
                    builder: (context, snapshot) {
                      print(cost);
                      return Text(
                        cost,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 50,
                            fontWeight: FontWeight.bold),
                      );
                    },
                  ),
                  color: Color.fromARGB(255, 192, 205, 215),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
