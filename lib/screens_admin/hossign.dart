import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:reddot/screens_admin/adminhome.dart';
import 'package:reddot/widget/customfield.dart';
import 'package:reddot/widget/customscaffold.dart';
import 'package:http/http.dart' as http;

class HospitalSign extends StatelessWidget {
  const HospitalSign({super.key});

  @override
  Widget build(BuildContext context) {
    final hosname = TextEditingController();
    final phno = TextEditingController();
    final address = TextEditingController();
    Map? mapresponse;
    Future<void> hos() async {
      http.Response response;
      response = await http
          .post(Uri.parse('http://192.168.0.109/project/query7.php'), body: {
        'hname': hosname.text,
        'phone': phno.text,
        'haddress': address.text,
      });
      mapresponse = jsonDecode(response.body);
      print(mapresponse);
    }

    return CustomScaffold(
      child: Padding(
        padding: EdgeInsets.only(top: 215, right: 10, left: 10),
        child: Column(
          children: [
            const Text("Fill the Details"),
            const SizedBox(
              height: 20,
            ),
            Customfield(hint: 'Hospital Name', control: hosname,s: false,),
            const SizedBox(height: 20),
            Customfield(hint: 'Phone Number', control: phno,s: false,),
            const SizedBox(height: 20),
            Customfield(hint: 'Address', control: address,s: false,),
            const SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                hos();
                Navigator.of(context)
                    .pushReplacement(MaterialPageRoute(builder: (contxet) {
                  return  Signin();
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
