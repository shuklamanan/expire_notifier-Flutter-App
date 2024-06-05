import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart' as http;

final CollectionReference users =
    FirebaseFirestore.instance.collection('users');
String mail = '';

String u = "";
void get() {
  FirebaseAuth.instance.authStateChanges().listen((User? user) async {
    if (user != null) {
      u = user.uid;
    }
    mail = (await FirebaseFirestore.instance.collection('users').doc(u).get())
        .data()!['email'];
  });
}

List listsi = [], listt = [];

void submitdata(
    String type, String item, String date, String month, String year) {
  List typelist = [];
  String userid = "";
  FirebaseAuth.instance.authStateChanges().listen((User? user) async {
    if (user == null) {
      print('User is currently signed out!');
    } else {
      userid = user.uid;
      print('User is signed in!');
      var data = (await FirebaseFirestore.instance
              .collection('users')
              .doc(userid)
              .get())
          .data();
      if (data![type] != null) {
        typelist = data[type];
      }
      print(item);
      String concat =
          item.trim() + " (" + date + " " + month + " " + year + ")";
      typelist.add(concat.trim());
      FirebaseFirestore.instance
          .collection('users')
          .doc(userid)
          .update({type: typelist});
    }
  });
}

Future<void> delete() async {
  get();
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
        // String upper = helper.substring(0, index - 1);
        String lower = helper.substring(index + 1, helper.length - 1);
        if (int.parse(lower.split(' ')[0]) < now.day &&
            int.parse(lower.split(' ')[1]) < now.month &&
            int.parse("20" + lower.split(' ')[2]) < now.year) {
          deletenote(i, j);
        }
      }
    } catch (e) {
      continue;
    }
  }
}

Future<DocumentSnapshot> gettypestream() async {
  get();
  final data =
      (await FirebaseFirestore.instance.collection("users").doc(u).get());
  print(data);
  delete();
  print("helloe");
  mails();
  print("finish");
  return data;
}

Future<void> deletenote(String type, int index) async {
  get();
  List data =
      (await FirebaseFirestore.instance.collection('users').doc(u).get())
          .data()![type];
  List items = data;
  print(items.removeAt(index));
  FirebaseFirestore.instance.collection('users').doc(u).update({type: items});
  return;
}

void mails() async {
  const url = '';//Your IP Address
  // try {
  //   var ipAddress = IpAddress(type: RequestType.json);
  //   dynamic data = await ipAddress.getIpAddress();
  //   print(data.toString());
  //   String ip = data.toString().substring(5, data.toString().length - 1);
  //   print(ip);
  // } catch (e) {
  //   print(e);
  //   return;
  // }
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
      continue;
    }
  }
  print("Mail reached...........");
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
    print(response.headers);
  } catch (e) {
    print(e.toString());
  }
  listsi = [];
  listt = [];
  return;
}

Future<void> signout() {
  return FirebaseAuth.instance.signOut();
}
