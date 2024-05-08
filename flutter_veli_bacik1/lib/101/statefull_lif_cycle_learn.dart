import 'package:flutter/material.dart';

class StatefullLifeCycleLearn extends StatefulWidget {
  const StatefullLifeCycleLearn({super.key, required this.message});

  final String message;

  @override
  State<StatefullLifeCycleLearn> createState() => _StatefullLifeCycleLearnState();
}

class _StatefullLifeCycleLearnState extends State<StatefullLifeCycleLearn> {
  String _message = "";
  late final bool _isOdd; //daha sonra değer ataması için late kullanılır.
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    print("c");
  }

  void didUpdateWidget(covariant StatefullLifeCycleLearn oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.message != widget.message) {
      //!Gönderilen mesaj değiştiğinde çalışır ve ekranı yeniler.
      _message = widget.message;
      _computeName();
      setState(() {});
    }
  }

  @override
  void dispose() {
    // TODO: Sayfa Öldüğünde çalışır. Örn: Değişkenleri sıfırlama işlemi yapılabilir.
    super.dispose();
  }

  void initState() {
    //!İNİTSTATE METHODU STATEFULL DAHA ÇİZİLMEDEN ÖNCE OLUŞUR VE BİTER YANİ İÇİNDE VİEW GÜNCELLEYEMEYİZ.
    super.initState();
    _message = widget.message;

    _isOdd = widget.message.length.isOdd;

    _computeName();
    print("a");
  }

  void _computeName() {
    if (_isOdd) {
      _message += " Tek";
    } else {
      _message += " Çift";
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _isOdd ? Text("Kelime Tek") : Text("Kelime Çift"),
      ),
      body: _isOdd
          ? TextButton(onPressed: () {}, child: Text(_message))
          : ElevatedButton(onPressed: () {}, child: Text(_message)),
    );
  }
}
