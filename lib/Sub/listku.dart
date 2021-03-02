import 'package:flutter/material.dart';

class Listku extends StatelessWidget {
  const Listku({
    Key key,
    @required this.history,
  }) : super(key: key);

  final List<String> history;

  @override
  Widget build(BuildContext context) {
    return Expanded(
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
    );
  }
}
