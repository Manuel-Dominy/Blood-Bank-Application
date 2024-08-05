import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:reddot/adminorusin.dart';
import 'package:reddot/widget/customfield.dart';
import 'package:reddot/widget/customscaffold.dart';
import 'dart:math';
import 'package:http/http.dart' as http;

class Bloodregister extends StatefulWidget {
  const Bloodregister({super.key, required this.hosname, required this.bid});
  final String hosname;
  final int bid;
  @override
  State<Bloodregister> createState() => _BloodregisterState();
}

class _BloodregisterState extends State<Bloodregister> {
  final bloodtype = TextEditingController();
  final amount = TextEditingController();
  final cost = TextEditingController();
  int bno = Random().nextInt(1000);
  int code = Random().nextInt(2000);
  Map? mapresponse;
  Map? map1response;
  Future<void> bloodbank() async {
    http.Response response;
    response = await http
        .post(Uri.parse('http://192.168.0.109/project/query5.php'), body: {
      'bloodtype': bloodtype.text,
      'amount': amount.text,
      'b_no': bno.toString(),
      'hospital': widget.hosname,
    });
    mapresponse = jsonDecode(response.body);
    print(mapresponse);
  }

/*blood moonji kedakkaaaaa php*/
  Future<void> blood() async {
    http.Response response;
    response = await http
        .post(Uri.parse('http://192.168.0.109/project/query6.php'), body: {
      'cost': cost.text,
      'code': code.toString(),
      'bid': widget.bid.toString(),
      'b_no': bno.toString(),
    });
    map1response = jsonDecode(response.body);
    print("hey");
    print(map1response);
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
        child: Padding(
      padding: const EdgeInsets.only(top: 215.0, left: 10, right: 10),
      child: Column(
        children: [
          const Text("Enter the Details"),
          const SizedBox(
            height: 20,
          ),
          Customfield(
            hint: "BloodType",
            control: bloodtype,
            s: false,
          ),
          const SizedBox(
            height: 20,
          ),
          Customfield(
            hint: "Amount(Litres)",
            control: amount,
            s: false,
          ),
          const SizedBox(
            height: 20,
          ),
          Customfield(
            hint: "Cost/Litre",
            control: cost,
            s: false,
          ),
          const SizedBox(
            height: 20,
          ),
          GestureDetector(
            onTap: () {
              bloodbank();
              blood();
              Navigator.of(context)
                  .pushReplacement(MaterialPageRoute(builder: (context) {
                return const AorU();
              }));
            },
            child: Container(
              height: 50,
              width: 170,
              decoration: const BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.all(Radius.circular(40))),
              child: const Center(
                child: Text(
                  "Submit",
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
