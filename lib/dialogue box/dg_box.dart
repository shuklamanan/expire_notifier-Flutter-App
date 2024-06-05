import 'package:expire_notifier/services/fsservices.dart';
import 'package:flutter/material.dart';

const List<String> texts = <String>[
  'Medicine',
  'Documents',
  'Snacks & Drinks',
  'Recharge',
  'Cosmetics'
];

class dg extends StatefulWidget {
  @override
  State<dg> createState() => _dgState();
}

class _dgState extends State<dg> {
  String dropdefaultvalue = texts.first;
  int date = 0, month = 0, year = 0;
  final _item = TextEditingController();
  final _expiryyear = TextEditingController();
  final _expirymonth = TextEditingController();
  final _expirydate = TextEditingController();
  final _formkey = GlobalKey<FormState>();
  final _formkey2 = GlobalKey<FormState>();
  final _formkey3 = GlobalKey<FormState>();
  final _formkey4 = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(builder: (context, StateSetter setState) {
      return AlertDialog(
        backgroundColor: const Color.fromARGB(255, 202, 224, 239),
        title: const Center(
          child: Text(
            'Add New Item',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
          ),
        ),
        content: SingleChildScrollView(
          child: Container(
            height: 510,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 20,
                ),
                Form(
                  key: _formkey,
                  child: TextFormField(
                    decoration: const InputDecoration(
                      label: Text('Enter item'),
                      labelStyle: TextStyle(
                          color: Color.fromARGB(255, 101, 101, 101),
                          fontWeight: FontWeight.bold),
                      border: OutlineInputBorder(),
                      hintText: 'ex. Paracetamol',
                      hintStyle: TextStyle(color: Colors.grey),
                    ),
                    controller: _item,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please Fill';
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Container(
                  child: const Text(
                    'Item Type:',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                ),
                const SizedBox(
                  height: 7,
                ),
                DropdownButton<String>(
                  value: dropdefaultvalue,
                  elevation: 10,
                  dropdownColor: Color.fromARGB(255, 1, 175, 244),
                  borderRadius: BorderRadius.circular(10),
                  items: texts.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (String? value) {
                    setState(() {
                      dropdefaultvalue = value!;
                    });
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  child: const Text(
                    'Expiration Time:',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                ),
                const SizedBox(
                  height: 9,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Container(
                        width: 70,
                        child: Form(
                          key: _formkey2,
                          child: TextFormField(
                            keyboardType: TextInputType.number,
                            maxLength: 2,
                            decoration: const InputDecoration(
                              label: Text('Date'),
                              labelStyle: TextStyle(
                                  fontSize: 15,
                                  color: Color.fromARGB(255, 101, 101, 101),
                                  fontWeight: FontWeight.bold),
                              border: OutlineInputBorder(),
                              hintText: '1-31',
                              hintStyle: TextStyle(color: Colors.grey),
                            ),
                            controller: _expirydate,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Fill';
                              } else if (int.parse(value) > 31 ||
                                  int.parse(value) < 1) {
                                return '1-31';
                              }
                              date = int.parse(value);
                              return null;
                            },
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Container(
                        width: 70,
                        child: Form(
                          key: _formkey3,
                          child: TextFormField(
                            keyboardType: TextInputType.number,
                            maxLength: 2,
                            decoration: const InputDecoration(
                              label: Text('Month'),
                              labelStyle: TextStyle(
                                  fontSize: 15,
                                  color: Color.fromARGB(255, 101, 101, 101),
                                  fontWeight: FontWeight.bold),
                              border: OutlineInputBorder(),
                              hintText: '1-12',
                              hintStyle: TextStyle(color: Colors.grey),
                            ),
                            controller: _expirymonth,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Fill';
                              } else if (int.parse(value) > 12 ||
                                  int.parse(value) < 1) {
                                return '1-12';
                              }
                              if (int.parse(value) == 2 && date > 29) {
                                return 'date(1-29)';
                              }
                              month = int.parse(value);
                              return null;
                            },
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Container(
                        width: 70,
                        child: Form(
                          key: _formkey4,
                          child: TextFormField(
                            keyboardType: TextInputType.number,
                            maxLength: 2,
                            decoration: const InputDecoration(
                              label: Text('Year'),
                              labelStyle: TextStyle(
                                  fontSize: 15,
                                  color: Color.fromARGB(255, 101, 101, 101),
                                  fontWeight: FontWeight.bold),
                              border: OutlineInputBorder(),
                              hintText: '1-10',
                              hintStyle: TextStyle(color: Colors.grey),
                            ),
                            controller: _expiryyear,
                            validator: (value) {
                              if (value == null ||
                                  value.isEmpty ||
                                  int.parse(value) < 0) {
                                return 'Fill';
                              } else if (value.length == 1) {
                                return 'no allowed in Sigle digit';
                              }
                              year = int.parse(value);
                              return null;
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () {
                    DateTime now = new DateTime.now();
                    print(now.year);
                    print(int.parse("20" + _expiryyear.text));
                    print(now.month);
                    print(int.parse(_expirymonth.text));
                    print(now.day);
                    print(int.parse(_expirydate.text));
                    if (int.parse("20" + _expiryyear.text) < now.year ||
                        (int.parse("20" + _expiryyear.text) == now.year &&
                            int.parse(_expirymonth.text) < now.month) ||
                        (int.parse("20" + _expiryyear.text) == now.year &&
                            int.parse(_expirymonth.text) == now.month &&
                            int.parse(_expirydate.text) < now.day)) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                            backgroundColor: Color.fromARGB(255, 252, 82, 82),
                            shape: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                color: Colors.transparent,
                              ),
                            ),
                            elevation: 20,
                            content: const Text(
                              'You\'ve Entered past dates',
                              style: TextStyle(color: Colors.white),
                            )),
                      );
                      return;
                    } else if (_formkey.currentState!.validate() &&
                        _formkey2.currentState!.validate() &&
                        _formkey3.currentState!.validate() &&
                        _formkey4.currentState!.validate()) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                            backgroundColor: Color.fromARGB(255, 1, 175, 244),
                            shape: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                color: Colors.transparent,
                              ),
                            ),
                            elevation: 20,
                            content: Text(
                              'Adding in $dropdefaultvalue',
                              style: const TextStyle(color: Colors.white),
                            )),
                      );
                      submitdata(dropdefaultvalue, _item.text, _expirydate.text,
                          _expirymonth.text, _expiryyear.text);
                      _item.clear();
                      _expirydate.clear();
                      _expirymonth.clear();
                      _expiryyear.clear();
                      dropdefaultvalue = texts.first;
                    } else {
                      // print(_formkey.currentState!.validate() &&
                      //     _formkey2.currentState!.validate() &&
                      //     _formkey3.currentState!.validate() &&
                      //     _formkey4.currentState!.validate());

                      // print(_formkey.currentState!.validate());
                      // print(_formkey2.currentState!.validate());
                      // print(_formkey3.currentState!.validate());
                      // print(_formkey4.currentState!.validate());
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                            backgroundColor: Color.fromARGB(255, 252, 82, 82),
                            shape: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                color: Colors.transparent,
                              ),
                            ),
                            elevation: 20,
                            content: const Text(
                              'You\'ve Entered past dates or leaving any fields',
                              style: TextStyle(color: Colors.white),
                            )),
                      );
                    }
                    Navigator.pop(context);
                  },
                  child: Container(
                    width: 500,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7),
                      gradient: const LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: [
                            Color.fromARGB(255, 14, 6, 255),
                            Color.fromARGB(255, 1, 175, 244)
                          ]),
                    ),
                    child: const Center(
                      child: Text(
                        'Save',
                        style: TextStyle(
                            color: Color.fromARGB(255, 212, 232, 237),
                            fontSize: 20),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () {
                    _item.clear();
                    _expirydate.clear();
                    _expirymonth.clear();
                    _expiryyear.clear();
                    dropdefaultvalue = texts.first;
                    Navigator.pop(context);
                  },
                  child: Container(
                    width: 500,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7),
                      gradient: const LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: [
                            Color.fromARGB(255, 1, 175, 244),
                            Color.fromARGB(255, 14, 6, 255),
                          ]),
                    ),
                    child: const Center(
                      child: Text(
                        'Cancel',
                        style: TextStyle(
                            color: Color.fromARGB(255, 212, 232, 237),
                            fontSize: 20),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
