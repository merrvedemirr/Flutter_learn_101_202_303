import 'package:flutter/material.dart';

class NavigateLearn extends StatefulWidget {
  const NavigateLearn({super.key, this.isOkey = false});

  final isOkey;
  @override
  State<NavigateLearn> createState() => _NavigateLearnState();
}

class _NavigateLearnState extends State<NavigateLearn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Center(
          child: ElevatedButton.icon(
            onPressed: () {
              Navigator.of(context).pop(!widget.isOkey); //Sayfaya geri dön
            },
            icon: Icon(
              Icons.check,
              color: widget.isOkey ? Colors.red : Colors.green,
            ),
            label: widget.isOkey ? Text("reddet") : Text("onayla"),
          ),
        ));
  }
}
