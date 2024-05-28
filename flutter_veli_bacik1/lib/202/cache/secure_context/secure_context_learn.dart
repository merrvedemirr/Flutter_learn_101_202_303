import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class ShareContextLearn extends StatefulWidget {
  const ShareContextLearn({super.key});

  @override
  State<ShareContextLearn> createState() => _ShareContextLearnState();
}

enum SecureKeys { token } //!key isimlerin yönetimi burada yapılır.

class _ShareContextLearnState extends State<ShareContextLearn> {
  final _storage = FlutterSecureStorage();
  String _title = "";
  TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    getSecureItem();
  }

  Future<void> getSecureItem() async {
    //todo: Bellek de tutulan değeri alıp title atıyoruz.
    _title = (await _storage.read(key: SecureKeys.token.name) ?? "");
    if (_title.isNotEmpty) {
      _controller.text = _title;
    }

    setState(() {});
  }

  void saveItems(String data) {
    setState(() {
      _title = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_title),
      ),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () async {
            await _storage.write(key: SecureKeys.token.name, value: _title);
          },
          label: Text("Save")),
      body: TextField(
        controller: _controller,
        onChanged: saveItems,
        maxLines: 4,
        minLines: 1,
      ),
    );
  }
}
