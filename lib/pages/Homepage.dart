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
