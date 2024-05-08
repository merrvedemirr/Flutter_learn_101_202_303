import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_veli_bacik1/product/language/language_items.dart';

class TextFieldLearn extends StatefulWidget {
  const TextFieldLearn({super.key});

  @override
  State<TextFieldLearn> createState() => _TextFieldLearnState();
}

class _TextFieldLearnState extends State<TextFieldLearn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          TextField(
            maxLength: 20,
            textInputAction:
                TextInputAction.next, //*bir sonraki textFielde geçmek için klavyede button simgesi değişir.
            inputFormatters: [_TextProjectInputFormmatter()._formmatter],
            keyboardType: TextInputType.emailAddress, //*klavye değişiyor.
            autofillHints: [AutofillHints.email], //*Mailleri kalvye üstünde tamamlayabiliyor.
            buildCounter: (context, {int? currentLength, bool? isFocused, maxLength}) {
              return _animatedContainer(currentLength);
            },
            decoration: _InputDecorator()._emailinput,
          ),
          TextField(),
        ],
      ),
    );
  }

  AnimatedContainer _animatedContainer(int? currentLength) {
    //*ÖRN. sadece bak
    return AnimatedContainer(
        duration: Duration(milliseconds: 100), height: 10, width: 10.0 * (currentLength ?? 0), color: Colors.green);
  }
}

class _TextProjectInputFormmatter {
  final _formmatter = TextInputFormatter.withFunction((oldValue, newValue) {
    if (newValue.text == "a") {
      //*A HARFİNİ YAZMAYA MÜSADE ETMEZ.
      return oldValue;
    } else {
      return newValue;
    }
  });
}

class _InputDecorator {
  final _emailinput = InputDecoration(
      prefixIcon: Icon(Icons.mail), //Todo: Sola İkon Koyduk.
      border: OutlineInputBorder(), //todo: Kutu gibi şekli oluyor.
      labelText: LanguageItems.mail);
}
