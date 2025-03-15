// ignore_for_file: sort_child_properties_last

import 'package:flutter/material.dart';
import "package:flutter/services.dart";
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeUi extends StatefulWidget {
  const HomeUi({super.key});

  @override
  State<HomeUi> createState() => _HomeUiState();
}

class _HomeUiState extends State<HomeUi> {
  showwarningdialog(context, message) async {
    await showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text(
                'Warning',
                style: TextStyle(color: Colors.red),
              ),
              content: Text(message),
              actions: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 168, 151, 141),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    'Close',
                    style: TextStyle(color: Colors.white),
                  ),
                )
              ],
            ));
  }

  int selectedSex = 1;
  double? result;

  TextEditingController weightScalecCtrl = TextEditingController();
  TextEditingController heightScaleCtrl = TextEditingController();
  TextEditingController ageCtrl = TextEditingController();

  calculate() {
    if (weightScalecCtrl.text.isEmpty ||
        weightScalecCtrl.text == '0' ||
        weightScalecCtrl.text == '0.0' ||
        weightScalecCtrl.text == '0.00') {
      showwarningdialog(context, 'น้ำหนักเป็น 0 หรือว่าง');
      return;
    } else if (heightScaleCtrl.text.isEmpty ||
        heightScaleCtrl.text == '0' ||
        heightScaleCtrl.text == '0.0' ||
        heightScaleCtrl.text == '0.00') {
      showwarningdialog(context, 'ส่วนสูงเป็น 0 หรือว่าง');
      return;
    } else if (ageCtrl.text.isEmpty || ageCtrl.text == '0') {
      showwarningdialog(context, 'อายุเป็น 0 หรือว่าง');
      return;
    } else {
      double weight = double.parse(weightScalecCtrl.text);
      double height = double.parse(heightScaleCtrl.text);
      int age = int.parse(ageCtrl.text);

      if (selectedSex == 1) {
        result = 66 + (13.7 * weight) + (5 * height) - (6.8 * age);
      } else if (selectedSex == 2) {
        result = 65 + (19.6 * weight) + (1.8 * height) - (4.7 * age);
      }
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 152, 108, 81),
        title: Text(
          'BMR app',
          style: TextStyle(
              fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 20, right: 20),
          child: Center(
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                Image.asset(
                  'assets/images/bmr_img.png',
                  height: 200,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.001,
                ),
                Row(
                  children: [
                    Icon(FontAwesomeIcons.venus),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.0001,
                    ),
                    Icon(FontAwesomeIcons.mars),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.002,
                    ),
                    Radio(
                        value: 1,
                        groupValue: selectedSex,
                        activeColor: const Color.fromARGB(255, 229, 198, 144),
                        onChanged: (value) {
                          setState(() {
                            selectedSex = value as int;
                            return;
                          });
                        }),
                    Text('ผู้ชาย'),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.002,
                    ),
                    Radio(
                        value: 2,
                        groupValue: selectedSex,
                        activeColor: const Color.fromARGB(255, 229, 198, 144),
                        onChanged: (value) {
                          setState(() {
                            selectedSex = value as int;
                          });
                        }),
                    Text('ผู้หญิง'),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                Row(
                  children: [
                    Icon(FontAwesomeIcons.weightScale),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.02,
                    ),
                    Flexible(
                      child: TextField(
                        controller: weightScalecCtrl,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          prefix: Text('   '),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                Row(
                  children: [
                    Icon(Icons.height_outlined),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.02,
                    ),
                    Flexible(
                      child: TextField(
                        controller: heightScaleCtrl,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          suffix: Text('CM.'),
                          prefix: Text('   '),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                Row(
                  children: [
                    Icon(Icons.grade_outlined),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.02,
                    ),
                    Flexible(
                      child: TextField(
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        controller: ageCtrl,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            prefix: Text('   '),
                            suffix: Text('Years old')),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                Row(
                  children: [
                    Expanded(
                        flex: 2,
                        child: ElevatedButton(
                          onPressed: () {
                            calculate();
                          },
                          child: Text(
                            'คำนวณ',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 15),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                const Color.fromARGB(255, 190, 142, 96),
                          ),
                        )),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.02,
                    ),
                    Expanded(
                        flex: 2,
                        child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              weightScalecCtrl.clear();
                              heightScaleCtrl.clear();
                              ageCtrl.clear();
                              result = null;
                            });
                          },
                          child: Text(
                            'ยกเลิก',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 15),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                const Color.fromARGB(255, 190, 142, 96),
                          ),
                        )),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                Divider(
                  height: 5,
                  color: const Color.fromARGB(255, 83, 63, 56),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                Text(
                  'อัตราการเผาผลาญไขมัน',
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                Text(
                  result != null ? result!.toStringAsFixed(2) : '-???-',
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
