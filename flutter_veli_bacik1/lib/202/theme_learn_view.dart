import 'package:flutter/material.dart';
import 'package:flutter_veli_bacik1/demos/password_textField.dart';

class ThemeLearnView extends StatefulWidget {
  const ThemeLearnView({super.key});

  @override
  State<ThemeLearnView> createState() => _ThemeLearnViewState();
}

class _ThemeLearnViewState extends State<ThemeLearnView> {
  bool? value = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          PasswordTextField(),
          CheckboxListTile(
            title: Text("seçiniz"),
            value: value,
            onChanged: (newValue) {
              setState(() {
                value = newValue;
              });
            },
          )
        ],
      ),
    );
  }
}
