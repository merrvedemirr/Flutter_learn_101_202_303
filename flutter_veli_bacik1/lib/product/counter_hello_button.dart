//!SADECE BUTTON DA BİR DEĞİŞİKLİK OLDUĞU İÇİN SAYFAYI STATEFUL YAPMAK YERİNE O BUTONU YAPARIZ. DAHA PERFORMANSLI OLUR.

import 'package:flutter/material.dart';
import 'package:flutter_veli_bacik1/product/language/language_items.dart';

class CounterHelloButoonView extends StatefulWidget {
  const CounterHelloButoonView({super.key});

  @override
  State<CounterHelloButoonView> createState() => _CounterHelloButoonViewState();
}

class _CounterHelloButoonViewState extends State<CounterHelloButoonView> {
  int _buttonvalue = 0;
  final String _welcomeTitle = LanguageItems.welcome; //?değişmeyen bir değer final kullan.

  void _updateButton() {
    setState(() {
      ++_buttonvalue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          _updateButton();
        },
        child: Text("$_welcomeTitle $_buttonvalue"));
  }
}
