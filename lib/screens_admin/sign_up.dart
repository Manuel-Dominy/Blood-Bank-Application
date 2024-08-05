import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:reddot/screens_admin/blood.dart';
import 'package:reddot/widget/customfield.dart';
import 'package:reddot/widget/customscaffold.dart';
import 'dart:math';
import 'package:http/http.dart' as http;

class Signup extends StatefulWidget {
  Signup({super.key, required this.hospital});
  final String hospital;

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final name = TextEditingController();
  final phono = TextEditingController();
  final age = TextEditingController();
  final address = TextEditingController();

  String _dropdownvalue = 'Male';

  var _items = ['Male', 'Female'];

  Map? mapresponse;
  int did = Random().nextInt(9999);
  Future<void> fun() async {
    http.Response response;
    response = await http
        .post(Uri.parse('http://192.168.0.109/project/query4.php'), body: {
      'name': name.text,
      'address': address.text,
      'phono': phono.text,
      'sex': _dropdownvalue,
      'id': did.toString(),
      'age': age.text,
    });
    mapresponse = jsonDecode(response.body);
    print(mapresponse);
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      child: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 30, left: 276.0),
              child: Container(
                width: 70,
                height: 70,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(40))),
                child: Image.asset(
                  "assets/hospital.jpg",
                  scale: 12.7,
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Center(
              child: Text(
                widget.hospital,
                style: const TextStyle(
                  fontSize: 25,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            const Text("Fill the Form"),
            const SizedBox(
              height: 20,
            ),
            Customfield(
              control: name,
              hint: 'Name',
              s: false,
            ),
            const SizedBox(height: 20),
            Customfield(
              control: address,
              hint: 'Address',
              s: false,
            ),
            const SizedBox(height: 20),
            Customfield(
              hint: 'Age',
              control: age,
              s: false,
            ),
            Container(
              height: 80,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              width: 150,
              child: DropdownButton(
                items: _items
                    .map((String item) =>
                        DropdownMenuItem(value: item, child: Text(item)))
                    .toList(),
                onChanged: (String? newvalue) {
                  setState(() {
                    _dropdownvalue = newvalue!;
                  });
                },
                value: _dropdownvalue,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Customfield(
              hint: 'Phonenumber',
              control: phono,
              s: false,
            ),
            const SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () {
                fun();
                Navigator.of(context)
                    .pushReplacement(MaterialPageRoute(builder: (contxet) {
                  return Bloodregister(
                    hosname: widget.hospital,
                    bid: did,
                  );
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
            )
          ],
        ),
      ),
    );
  }
}
