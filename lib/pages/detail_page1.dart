import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expire_notifier/services/fsservices.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class DetailPageFirst extends StatefulWidget {
  final String text;
  const DetailPageFirst({super.key, required this.text});

  @override
  State<DetailPageFirst> createState() => _DetailPageFirstState();
}

class _DetailPageFirstState extends State<DetailPageFirst> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 202, 224, 239),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 202, 224, 239),
        title: Center(
            child: Text(
          widget.text,
          style: const TextStyle(fontWeight: FontWeight.w600),
        )),
      ),
      body: FutureBuilder<DocumentSnapshot>(
        future: gettypestream(),
        builder: (context, snapshot) {
          print(snapshot.hasData);
          // print(snapshot);
          if (snapshot.hasData) {
            Map<String, dynamic> data =
                snapshot.data?.data() as Map<String, dynamic>;
            print(data);
            // return Text('');
            List typelist = [];
            var datas = [];
            try {
              for (var i in data[widget.text]) {
                // print(i[widget.text]);
                try {
                  print(i);
                  datas.add(i);
                } catch (e) {
                  print(e.toString());
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
                    child: const Padding(
                      padding: EdgeInsets.all(30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'No Notes',
                            style: TextStyle(
                                color: Color.fromARGB(255, 212, 232, 237),
                                fontSize: 20),
                          ),
                        ],
                      ),
                    ),
                  );
                }
              }
            } catch (e) {
              print(e);
            }
            List itemtype = datas;
            print(itemtype.length);
            if (itemtype.isEmpty) {
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
                child: const Padding(
                  padding: EdgeInsets.all(30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'No Notes',
                        style: TextStyle(
                            color: Color.fromARGB(255, 212, 232, 237),
                            fontSize: 20),
                      ),
                    ],
                  ),
                ),
              );
            }
            print("length" + itemtype.length.toString());
            return ListView.builder(
                itemCount: itemtype.length,
                itemBuilder: (context, index) {
                  String temp = itemtype[index];
                  int u = 0;
                  for (int i = temp.length - 1; i >= 0; i--) {
                    if (temp[i] == '(') {
                      u = i;
                    }
                  }
                  String items = temp.substring(0, u - 1);
                  DateTime now = DateTime.now();
                  String time = temp.substring(u + 1, temp.length - 1);
                  if (now.year >= int.parse("20" + time.split(' ')[2]) &&
                      now.month >= int.parse(time.split(' ')[1]) &&
                      now.day > int.parse(time.split(' ')[0])) {
                    deletenote(widget.text, index);
                  }
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
                    child: Slidable(
                      endActionPane: ActionPane(
                        motion: const StretchMotion(),
                        children: [
                          SlidableAction(
                            onPressed: (context) {
                              deletenote(widget.text, index);
                            },
                            icon: Icons.delete,
                            backgroundColor: Color.fromARGB(255, 245, 53, 53),
                            borderRadius: BorderRadius.circular(12),
                          )
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(30),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              (items.length > 10)
                                  ? items.substring(0, 10) + "..."
                                  : items,
                              style: const TextStyle(
                                  color: Color.fromARGB(255, 212, 232, 237),
                                  fontSize: 20),
                            ),
                            Text(
                              time.split(' ')[0] +
                                  "-" +
                                  time.split(' ')[1] +
                                  "-20" +
                                  time.split(' ')[2],
                              style: const TextStyle(
                                  color: Color.fromARGB(255, 212, 232, 237),
                                  fontSize: 20),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                });
          } else {
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
              child: const Padding(
                padding: EdgeInsets.all(30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'No Notes',
                      style: TextStyle(
                          color: Color.fromARGB(255, 212, 232, 237),
                          fontSize: 20),
                    ),
                  ],
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
/*


                
                GridView.builder(
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 500,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 30,
                  childAspectRatio: 2.5),
              itemBuilder: (context, index) {
                DocumentSnapshot document = typelist[index];
                Map<String, dynamic> data =
                    document.data() as Map<String, dynamic>;
                List datas = data[widget.text];
                print(data[widget.text]);
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
                                    DetailPageFirst(text: "a")));
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        // children: [
                        //   icons1[index],
                        //   Text(
                        //     texts[index],
                        //     style: const TextStyle(
                        //         color: Color.fromARGB(255, 212, 232, 237),
                        //         fontSize: 20),
                        //   ),
                        //   icons2[index],
                        // ],
                      ),
                    ),
                  ),
                );
              },
              itemCount: .length,
            ); */