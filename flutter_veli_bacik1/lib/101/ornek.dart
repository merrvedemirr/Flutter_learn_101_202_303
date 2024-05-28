import 'package:flutter/material.dart';

class TasarimEkrani extends StatelessWidget {
  const TasarimEkrani({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "FLUTTER TASARIM EKRANI",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w400),
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            Row(children: [
              _ElevatedButtonView(buttonColor: ProjectColor.black, text: "Tab", textColor: ProjectColor.white),
              _ElevatedButtonView(buttonColor: ProjectColor.white, text: "Tab", textColor: ProjectColor.black),
              _ElevatedButtonView(buttonColor: ProjectColor.white, text: "Tab", textColor: ProjectColor.black),
              _ElevatedButtonView(buttonColor: ProjectColor.white, text: "Tab", textColor: ProjectColor.black),
            ]),
            _Container(),
            Row(
              children: [
                CustomCard(child: Image.asset("lib/images/resimler.jpg")),
                CustomCard(child: Image.asset("lib/images/resimler.jpg")),
              ],
            ),
            _Container(),
          ],
        ),
      ),
    );
  }

  Container _Container() {
    return Container(
      margin: const EdgeInsets.only(top: 30, bottom: 10),
      child: Column(
        children: [
          _TabWidgetText(text: "Title", textColor: Colors.black),
          _TabWidgetText(text: "Subheading about this section", textColor: ProjectColor.grey),
        ],
      ),
    );
  }
}

class _ElevatedButtonView extends StatelessWidget {
  const _ElevatedButtonView({
    super.key,
    required this.buttonColor,
    required this.text,
    required this.textColor,
  });
  final Color buttonColor;
  final String text;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(3.0),
      child: ElevatedButton(
          onPressed: () {},
          child: _TabWidgetText(text: text, textColor: textColor),
          style: ElevatedButton.styleFrom(backgroundColor: buttonColor, shadowColor: Colors.grey, elevation: 10)),
    );
  }
}

class _TabWidgetText extends StatelessWidget {
  const _TabWidgetText({
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

class ProjectColor {
  static Color get black => Colors.black;
  static Color get white => Colors.white;
  static Color get grey => Colors.grey;
}

class CustomCard extends StatelessWidget {
  final Widget child;

  CustomCard({super.key, required this.child});

  Widget build(BuildContext context) {
    return Card(
        color: Theme.of(context).colorScheme.error,
        child: SizedBox(
          width: 150,
          height: 150,
          child: Container(
            width: 75,
            height: 75,
            child: child,
          ),
        ));
  }
}
