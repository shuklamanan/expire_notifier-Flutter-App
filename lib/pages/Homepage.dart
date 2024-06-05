import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expire_notifier/dialogue%20box/dg_box.dart';
import 'package:expire_notifier/pages/detail_page1.dart';
import 'package:expire_notifier/services/fsservices.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

const List<String> texts = <String>[
  'Medicine',
  'Documents',
  'Snacks & Drinks',
  'Recharge',
  'Cosmetics'
];

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Icon> icons1 = const [
    Icon(
      Icons.abc,
      color: Color.fromARGB(255, 250, 107, 30),
    ),
    Icon(
      Icons.abc_outlined,
      color: Color.fromARGB(255, 250, 107, 30),
    ),
    Icon(
      Icons.ac_unit,
      color: Color.fromARGB(255, 250, 107, 30),
    ),
    Icon(
      Icons.ac_unit_sharp,
      color: Color.fromARGB(255, 250, 107, 30),
    ),
    Icon(
      Icons.abc_outlined,
      color: Color.fromARGB(255, 250, 107, 30),
    ),
  ];
  List<Icon> icons2 = const [
    Icon(Icons.forward_outlined),
    Icon(Icons.forward_outlined),
    Icon(Icons.forward_outlined),
    Icon(Icons.forward_outlined),
    Icon(Icons.forward_outlined)
  ];
  int icons1index = 0, icons2index = 0, cnt = 0;
  Future<void> mailing() async {
    const url = 'http://192.168.207.225:8000/';
    const List<String> texts = <String>[
      'Medicine',
      'Documents',
      'Snacks & Drinks',
      'Recharge',
      'Cosmetics'
    ];
    DateTime now = DateTime.now();
    for (var i in texts) {
      List? deletedata =
          (await FirebaseFirestore.instance.collection('users').doc(u).get())
              .data()?[i];
      try {
        List temp = deletedata!;
        for (var j = 0; j < temp.length; j++) {
          String helper = temp[j];
          var index;
          for (int id = 0; id < helper.length; id++) {
            if (helper[id] == '(') {
              index = id;
            }
          }
          String upper = helper.substring(0, index - 1);
          String lower = helper.substring(index + 1, helper.length - 1);
          if ((int.parse(lower.split(' ')[0])) <= (now.day + 10) &&
              int.parse(lower.split(' ')[1]) == now.month &&
              int.parse("20" + lower.split(' ')[2]) == now.year) {
            listsi.add(upper);
            listt.add(i);
          } else if (now.day <= 31 &&
              now.day >= 22 &&
              (int.parse(lower.split(' ')[1])) == (now.month + 1) &&
              int.parse("20" + lower.split(' ')[2]) == now.year) {
            listsi.add(upper);
            listt.add(i);
          }
        }
      } catch (e) {
        // print('no data in $i');
        continue;
      }
    }
    print("Mail reached...........");
    // sendmail(listsi, listt);
    if (listsi.isNotEmpty || listt.isNotEmpty) {
      try {
        var req = {"email": mail, "item": listsi, "type": listt};
        print(req);
        print(listsi);
        print(listt);
        var response = await http.post(
          Uri.parse(url),
          headers: {'Content-type': 'application/json'},
          body: jsonEncode(req),
        );
        print(response.statusCode);
        print(response.body.toString());
        if (response.statusCode == 200) {
          var responsedata = jsonDecode(response.body);
          print(responsedata);
        }
        // var jsonresponse = jsonDecode(response.body);
        // if (jsonresponse['status'] == 200) {
        //   print('done...');
        // } else {
        //   print("not work in homepage");
        // }
        print(response.headers);
      } catch (e) {
        print(e.toString());
      }
    }
    listsi = [];
    listt = [];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 202, 224, 239),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 202, 224, 239),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Expire Notifier',
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
            GestureDetector(
              onTap: () {
                signout();
              },
              child: Text('Sign Out'),
            )
          ],
        ),
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 500,
            mainAxisSpacing: 10,
            crossAxisSpacing: 30,
            childAspectRatio: 2.5),
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              boxShadow: const [
                BoxShadow(
                    color: Color.fromARGB(255, 122, 121, 120),
                    offset: Offset(0, 5),
                    blurRadius: 15,
                    blurStyle: BlurStyle.normal)
              ],
              borderRadius: BorderRadius.circular(20),
              gradient: const LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [
                    Color.fromARGB(255, 14, 6, 255),
                    Color.fromARGB(255, 1, 175, 244)
                  ]),
            ),
            child: Padding(
              padding: const EdgeInsets.all(30),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              DetailPageFirst(text: texts[index])));
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    icons1[index],
                    Text(
                      texts[index],
                      style: const TextStyle(
                          color: Color.fromARGB(255, 212, 232, 237),
                          fontSize: 20),
                    ),
                    icons2[index],
                  ],
                ),
              ),
            ),
          );
        },
        itemCount: texts.length,
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) {
                return dg();
              });
        },
        elevation: 10,
        backgroundColor: const Color.fromARGB(255, 21, 178, 250),
        label: const Icon(
          Icons.add,
          size: 30,
        ),
      ),
    );
  }
}
