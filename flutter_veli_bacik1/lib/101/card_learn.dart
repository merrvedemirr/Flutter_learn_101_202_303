import 'package:flutter/material.dart';

class CardLearnView extends StatelessWidget {
  const CardLearnView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          CustomCard(
              child: SizedBox(
            width: 300,
            height: 100,
            child: Center(child: _CardText(text: "Merhaba", textColor: Theme.of(context).colorScheme.secondary)),
          ))
        ],
      ),
    );
  }
}

class _CardText extends StatelessWidget {
  const _CardText({
    super.key,
    required this.text,
    required this.textColor,
  });

  final String text;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(color: textColor),
    );
  }
}

class CardMargin {
  static const cardMargin = EdgeInsets.all(10);
}

class CustomCard extends StatelessWidget {
  final Widget child;

  const CustomCard({super.key, required this.child});

  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).colorScheme.error,
      child: child,
    );
  }
}



//BORDER
//1- StadiumBorder()
//2- CircleBorder()
//3- RoundedRectangleBorder()