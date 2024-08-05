import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:reddot/screens/screen_profile.dart';
import 'package:reddot/widget/customblood.dart';
import 'package:http/http.dart' as http;

class Blood extends StatefulWidget {
  Blood({super.key, required this.text, required this.phono});
  final String text;
  final String phono;

  @override
  State<Blood> createState() => _BloodState();
}

class _BloodState extends State<Blood> {
  List listresponse = [];
  var blood = 'A+';
  var pic;
  var name;

  Future<void> api(text, blood) async {
    http.Response response;
    response = await http.post(
        Uri.parse('http://192.168.0.109/project/query2.php'),
        body: {'hosname': text, 'bloodtype': blood});
    listresponse = jsonDecode(response.body);
    print(listresponse);
  }

  @override
  void initState() {
    api(widget.text, blood);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: 200,
            decoration: const BoxDecoration(color: Colors.red),
            child: Padding(
              padding: const EdgeInsets.only(top: 35),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      IconButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          icon: const Icon(
                            Icons.arrow_back,
                          )),
                      Padding(
                        padding: const EdgeInsets.only(left: 276.0),
                        child: Container(
                          width: 70,
                          height: 70,
                          decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(40))),
                          child: Image.asset(
                            "assets/hospital.jpg",
                            scale: 12.7,
                          ),
                        ),
                      )
                    ],
                  ),
                  Center(
                    child: Text(
                      widget.text,
                      style: const TextStyle(
                        fontSize: 25,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 240, top: 30),
                    child: Text(
                      "Contact no:${widget.phono}",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 10.0,
              left: 3,
              right: 3,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                    onTap: () {
                      setState(() {
                        blood = 'A+';
                      });
                      api(widget.text, blood);
                    },
                    child: const Customblood(text: "A+")),
                GestureDetector(
                  child: const Customblood(text: "A-"),
                  onTap: () {
                    setState(() {
                      blood = 'A-';
                    });
                    api(widget.text, blood);
                  },
                ),
                GestureDetector(
                  child: const Customblood(text: "B+"),
                  onTap: () {
                    setState(() {
                      blood = 'B+';
                    });
                    api(widget.text, blood);
                  },
                ),
                GestureDetector(
                  child: const Customblood(text: "B-"),
                  onTap: () {
                    setState(() {
                      blood = 'B-';
                    });
                    api(widget.text, blood);
                  },
                ),
                GestureDetector(
                  child: const Customblood(text: "O+"),
                  onTap: () {
                    setState(() {
                      blood = 'O+';
                    });

                    api(widget.text, blood);
                  },
                ),
                GestureDetector(
                  child: const Customblood(text: "O-"),
                  onTap: () {
                    setState(() {
                      blood = 'O-';
                    });
                    api(widget.text, blood);
                  },
                ),
                GestureDetector(
                  child: const Customblood(text: "AB+"),
                  onTap: () {
                    setState(() {
                      blood = 'AB+';
                    });
                    api(widget.text, blood);
                  },
                ),
                GestureDetector(
                  child: const Customblood(text: "AB-"),
                  onTap: () {
                    setState(() {
                      blood = 'AB-';
                    });
                    api(widget.text, blood);
                  },
                ),
              ],
            ),
          ),
          SizedBox(
            height: 300,
            width: double.infinity,
            child: FutureBuilder(
                future: api(widget.text, blood),
                builder: (context, snapshot) {
                  return ListView.separated(
                    itemBuilder: (context, index) {
                      name = listresponse[index]['name'];
                      return ListTile(
                          onTap: () {
                            Navigator.of(context)
                                .push(MaterialPageRoute(builder: (context) {
                              return Profile(
                                hname: widget.text,
                                  phono: listresponse[index]['phno'].toString(),
                                  age: listresponse[index]['age'].toString(),
                                  address: listresponse[index]['address'],
                                  blood: blood,
                                  name: listresponse[index]['name'],
                                  pic: gender(listresponse[index]['sex']));
                            }));
                          },
                          leading: CircleAvatar(
                              child: gender(listresponse[index]['sex'])),
                          title: Text(listresponse[index]['name']));
                    },
                    separatorBuilder: (context, index) {
                      return const Divider();
                    },
                    itemCount: listresponse.length,
                  );
                }),
          ),
        ],
      ),
    );
  }

  Widget gender(gen) {
    if (gen == 'Male') {
      return Image.asset("assets/male-removebg-preview.png");
    } else {
      return Image.asset("assets/female-removebg-preview.png");
    }
  }
}
