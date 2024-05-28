import 'package:flutter/material.dart';

class IndicatorLearn extends StatelessWidget {
  const IndicatorLearn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [const CenterIndicator()],
      ),
      body: const LinearProgressIndicator(),
    );
  }
}

class CenterIndicator extends StatelessWidget {
  const CenterIndicator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
        child: CircularProgressIndicator(
      //color: Colors.blue, //themeden de rengi verilir kendine ait theme'si var.
      strokeWidth: 10,
      value: 0.9, //animasyon olarak şuan yarıya kadar dolar.
    ));
  }
}
