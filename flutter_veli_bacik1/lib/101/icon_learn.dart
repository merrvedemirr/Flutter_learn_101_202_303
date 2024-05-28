import 'package:flutter/material.dart';

class IconLearnView extends StatelessWidget {
  IconLearnView({super.key});

  final IconSize iconSize = IconSize(); //Initialization işlemi
  final IconColor iconColor = IconColor();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hello"),
      ),
      body: Column(
        children: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.message_outlined,
              color: Theme.of(context).colorScheme.error, //theme kullandık(en iyisi budur.)
              size: IconSize.iconSmallx2, //static yapısı kullandık
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.message_outlined,
              color: iconColor.Awesome, //class ile verdik
              size: iconSize.iconSmall, //class ile verdik
            ),
          ),
        ],
      ),
    );
  }
}

class IconSize {
  final double iconSmall = 40;
  static final double iconSmallx2 = 80;
}

class IconColor {
  final Color Awesome = const Color.fromRGBO(255, 28, 106, 100);
}
