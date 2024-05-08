import 'package:flutter/material.dart';

class ColumnRowLearn extends StatelessWidget {
  const ColumnRowLearn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          //Ekranı 10 parça gibi düşündük 4+2+1+3
          Expanded(
              flex: 4,
              child: Container(
                color: Colors.red,
              )),
          Expanded(
              flex: 2,
              child: Container(
                color: Colors.green,
              )),
          Spacer(
            flex: 1,
          ),
          Expanded(
              flex: 3,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text("data"),
                  Text("data1"),
                  Text("data2"),
                  Text("data3"),
                ],
              )),
        ],
      ),
    );
  }
}
