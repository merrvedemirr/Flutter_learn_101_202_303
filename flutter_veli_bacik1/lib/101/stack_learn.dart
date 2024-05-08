import 'package:flutter/material.dart';

class StackLearn extends StatelessWidget {
  const StackLearn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Stack(
        children: [
          Container(
            height: 100,
            color: Colors.red,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 70),
            child: Container(
              height: 100,
              color: Colors.blue,
            ),
          ),
          Positioned(
              right: 0,
              left: 0,
              height: 50,
              top: 65,
              child: Container(
                color: Colors.green,
              )),
          Positioned.fill(
              top: 126,
              child: Container(
                color: Colors.amber,
              ))
        ],
      ),
    );
  }
}
