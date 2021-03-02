import 'package:flutter/material.dart';

class Text1 extends StatelessWidget {
  const Text1({
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
