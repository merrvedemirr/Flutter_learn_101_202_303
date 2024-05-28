import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FormLearnview extends StatefulWidget {
  const FormLearnview({super.key});

  @override
  State<FormLearnview> createState() => _FormLearnviewState();
}

class _FormLearnviewState extends State<FormLearnview> {
  //todo: _key üzerinden globalKey' e erişip FormState özelliklerini kullabiliyoruz.
  //bir nevi buton ve formu bağladık.

  GlobalKey<FormState> _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Form(
        key: _key,
        autovalidateMode:
            AutovalidateMode.always, //*boş girildi hata yazıyor ekranda sonra harf girmeye başlayınca hata hemen gider.
        onChanged: () {
          print("a");
        },
        child: Column(
          children: [
            TextFormField(
              validator: FormFieldValidator().isNotEmpty, //bu kısmı classa taşıdık.
            ),
            TextFormField(
              validator: FormFieldValidator().isNotEmpty,
            ),
            DropdownButtonFormField<String>(
              validator: FormFieldValidator().isNotEmpty,
              items: [
                DropdownMenuItem(
                  child: Text("a"),
                  value: "a",
                ),
                DropdownMenuItem(
                  child: Text("b"),
                  value: "b",
                ),
                DropdownMenuItem(
                  child: Text("c"),
                  value: "c",
                ),
              ],
              onChanged: (value) {},
            ),
            ElevatedButton(
                onPressed: () {
                  if (_key.currentState?.validate() ?? false) {
                    print("okey");
                  }
                },
                child: Text("Save")),
          ],
        ),
      ),
    );
  }
}

class FormFieldValidator {
  String? isNotEmpty(String? data) {
    return (data?.isNotEmpty ?? false) ? null : ValidatorMessage().notEmptyMessage;
  }
}

class ValidatorMessage {
  final String notEmptyMessage = "Bu alan bos gecilemez";
}
