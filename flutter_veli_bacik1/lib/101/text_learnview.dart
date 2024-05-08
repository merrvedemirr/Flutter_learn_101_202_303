import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextLearnView extends StatelessWidget {
  TextLearnView({super.key});
  final String name = "Merve";

  final ProjectKeys keys = ProjectKeys();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "hello world by ${name.length}",
              maxLines: 2, //satır sayısı
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.end,
              style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                    color: ProjectColor.welcomeColor,
                  ),
            ),
            Text(
              "hello world by ${name.length + 1}",
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.end,
              style: ProjectStyles.welcomeStyle,
            ),
            Text(keys.welcome),
          ],
        ),
      ),
    );
  }
}

class ProjectStyles {
  static TextStyle welcomeStyle = const TextStyle(
    decoration: TextDecoration.underline,
    fontStyle: FontStyle.italic,
    wordSpacing: 2,
    letterSpacing: 2,
    fontSize: 16,
    fontWeight: FontWeight.w600,
  );
}

class ProjectColor {
  static Color get welcomeColor => Colors.green;
}

class ProjectKeys {
  final String welcome = "Merhaba dünya";
}
