import 'package:flutter/material.dart';
import 'package:flutter_veli_bacik1/product/counter_hello_button.dart';
import 'package:flutter_veli_bacik1/product/language/language_items.dart';

//STATE İÇEREN CLASS-DIŞARISIYLA İLETİŞİM KURULAN YER
class StateFullLearn extends StatefulWidget {
  const StateFullLearn({super.key});

  @override
  State<StateFullLearn> createState() => _StateFullLearnState();
}

//İÇİNDE STATE TUTAN CLASS-KODLARIN YAZILDIĞI YER
class _StateFullLearnState extends State<StateFullLearn> {
  int _countValue = 0; //!FİLE PRİVATE OLMALI

  //!DATA GÜNCELLEMEK İÇİN KULLANILIR.BUİLD METHODUNU TEKRAR TETİKLER.(setState)

  void _updateCounter(bool isIncrement) {
    if (isIncrement) {
      _countValue += 1;
    } else {
      _countValue -= 1;
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(LanguageItems.welcome),
      ),
      floatingActionButton: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _incrementButton(),
          _deincrementButton(),
        ],
      ),
      body: Column(
        children: [
          Center(
              child: Text(
            _countValue.toString(),
            style: Theme.of(context).textTheme.headlineMedium,
          )),
          Placeholder(),
          CounterHelloButoonView(),
        ],
      ),
    );
  }

  FloatingActionButton _incrementButton() {
    print("burda");
    return FloatingActionButton(
      onPressed: () {
        _updateCounter(true);
      },
      child: Icon(Icons.add),
    );
  }

  Padding _deincrementButton() {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: FloatingActionButton(
        onPressed: () {
          _updateCounter(false);
        },
        child: Icon(Icons.remove),
      ),
    );
  }
}
