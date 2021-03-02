import 'package:flutter/material.dart';

import 'Sub/input.dart';
import 'Sub/listku.dart';
import 'Sub/text1.dart';

void main() {
  runApp(MyApp());
}

List<String> opsi = ["Kelvin", "Reamur", "Fahrenheit"];

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final myController = TextEditingController();

  List<String> history = [];
  double result = 0;
  String newValue = "Kelvin";
  String temp;

  void hitung(double value, String pilihan) {
    setState(() {
      double temp2 = 0;
      if (pilihan == 'Kelvin') {
        temp2 = value + 273.15;
      } else if (pilihan == 'Fahrenheit') {
        temp2 = (this.result * 9 / 5) + 32;
      } else {
        temp2 = (4 / 5) * value;
      }
      this.result = double.parse(temp2.toStringAsFixed(1));
      temp = (this.result).toString() + " " + this.newValue;
      this.history.add(temp);
    });
  }

  @override
  Widget build(BuildContext context) {
    var materialApp = MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        resizeToAvoidBottomPadding: false,
        appBar: AppBar(
          title: Text("Temperature Converter"),
        ),
        body: Container(
          child: Column(
            children: <Widget>[
              Input(myController: myController),
              DropdownButton<String>(
                items: opsi.map((String value) {
                  return DropdownMenuItem(
                      value: value, child: Container(child: Text(value)));
                }).toList(),
                value: newValue,
                onChanged: (String changeValue) {
                  setState(() {
                    newValue = changeValue;
                    hitung(double.parse(myController.text), newValue);
                  });
                },
              ),
              Text1(result: result, newValue: newValue),
              Row(children: <Widget>[
                Expanded(
                    child: Container(
                  padding: const EdgeInsets.all(8.0),
                  child: RaisedButton(
                    onPressed: () =>
                        hitung(double.parse(myController.text), newValue),
                    child: const Text('Convert now!',
                        style: TextStyle(fontSize: 20)),
                    color: Colors.blue,
                    textColor: Colors.white,
                    elevation: 5,
                  ),
                )),
              ]),
              Column(
                children: <Widget>[
                  Container(
                    margin: const EdgeInsets.only(top: 10.0),
                    padding: const EdgeInsets.all(8.0),
                    alignment: Alignment.center,
                    child: Text("Historic Conversion",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 22, color: Colors.black87)),
                  ),
                ],
              ),
              Listku(history: history),
            ],
          ),
        ),
      ),
    );
    return materialApp;
  }
}
