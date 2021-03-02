import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'Sub/input.dart';

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
  String _newValue = "Kelvin";
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
      temp = (this.result).toString() + " " + this._newValue;
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
                value: _newValue,
                onChanged: (String changeValue) {
                  setState(() {
                    _newValue = changeValue;
                  });
                },
              ),
              Text(result: result, newValue: _newValue),
              Row(children: <Widget>[
                Expanded(
                    child: Container(
                  padding: const EdgeInsets.all(8.0),
                  child: RaisedButton(
                    onPressed: () =>
                        hitung(double.parse(myController.text), _newValue),
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
              Expanded(
                child: ListView(
                    children: history.map((String value) {
                  return Container(
                      alignment: Alignment.centerLeft,
                      margin: EdgeInsets.all(8.0),
                      child: Text(
                        value,
                        style: TextStyle(fontSize: 18),
                      ));
                }).toList()),
              ),
            ],
          ),
        ),
      ),
    );
    return materialApp;
  }
}

class Text extends StatelessWidget {
  const Text({
    Key key,
    @required this.result,
    @required String newValue,
  })  : _newValue = newValue,
        super(key: key);

  final double result;
  final String _newValue;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        children: <Widget>[
          Expanded(
            child: Column(
              children: <Widget>[
                Expanded(
                  child: Column(
                    children: <Widget>[
                      Container(
                        margin: const EdgeInsets.only(top: 150.0),
                        padding: const EdgeInsets.all(8.0),
                        alignment: Alignment.center,
                        child: Text("Result : ",
                            textAlign: TextAlign.center,
                            style:
                                TextStyle(fontSize: 20, color: Colors.black54)),
                      ),
                      Container(
                        padding: const EdgeInsets.all(8.0),
                        alignment: Alignment.center,
                        child: Text("$result" + " " + _newValue,
                            style:
                                TextStyle(fontSize: 35, color: Colors.black)),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
