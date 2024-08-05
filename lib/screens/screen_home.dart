import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:reddot/screens/screen_blood.dart';
import 'package:reddot/widget/customscaffold.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List listresponse = [];
  var hey, halo;

  Future apicall() async {
    http.Response response;
    response =
        await http.get(Uri.parse('http://192.168.0.109/project/query1.php'));
    listresponse = json.decode(response.body);
  }

  @override
  void initState() {
    apicall();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 140, left: 20),
            child: Container(
              height: 200,
              width: 340,
              decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 228, 220, 220),
                  borderRadius: BorderRadius.all(Radius.circular(16))),
              child: Row(
                children: [
                  Expanded(
                      flex: 1,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(left: 8),
                            child: Text(
                              "World Blood Donation Day",
                              style: TextStyle(
                                  color: Colors.red,
                                  fontSize: 25,
                                  fontStyle: FontStyle.italic),
                            ),
                          ),
                          Container(
                              height: 40,
                              width: 130,
                              decoration: const BoxDecoration(
                                  color: Colors.red,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20))),
                              child: const Center(
                                  child: Text(
                                "JUNE 14 2024",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              )))
                        ],
                      )),
                  Expanded(
                    flex: 1,
                    child: Image.asset('assets/blood-removebg-preview.png'),
                  )
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            width: double.infinity,
            height: 500,
            child: FutureBuilder(
                future: apicall(),
                builder: (context, snapshot) {
                  return ListView.separated(
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(listresponse[index]['hname']),
                        subtitle: Text(listresponse[index]['haddress']),
                        onTap: () {
                          hey = listresponse[index]['hname'];
                          halo = listresponse[index]['hphono'].toString();
                          Navigator.of(context)
                              .push(MaterialPageRoute(builder: (context) {
                            return Blood(
                              text: hey,
                              phono: halo,
                            );
                          }));
                        },
                      );
                    },
                    separatorBuilder: (context, index) {
                      return const Divider();
                    },
                    itemCount: listresponse.length,
                  );
                }),
          )
        ],
      ),
    );
  }
}
