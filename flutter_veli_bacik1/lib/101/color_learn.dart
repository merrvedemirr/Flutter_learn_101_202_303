import 'package:flutter/material.dart';

class ColorLearnView extends StatelessWidget {
  const ColorLearnView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        color: Theme.of(context).errorColor, //theme den okuduk.
        child: Text(
          "Data",
          style: Theme.of(context).textTheme.headlineLarge?.copyWith(
              color: Theme.of(context)
                  .errorColor), //Theme den stilini ve rengini aldık.
        ),
      ),
    );
  }
}

class ColorItems {
  static const Color Grape = Color.fromRGBO(109, 29, 198, 1);
  static const Color Orange = Color.fromRGBO(255, 129, 3, 1);
}
