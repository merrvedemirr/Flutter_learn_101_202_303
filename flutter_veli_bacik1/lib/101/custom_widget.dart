import 'package:flutter/material.dart';

class CustomWidgetView extends StatelessWidget {
  CustomWidgetView({super.key});
  final String title = "Click";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Center(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: SizedBox(
              width: MediaQuery.of(context)
                  .size
                  .width, //Her ekrana göre responsive tasarım
              child: CustomFootButton(
                onPressed: () {},
                buttonText: title,
              ),
            ),
          )),
          SizedBox(
            height: 100,
          ),
          Center(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: CustomFootButton(
              buttonText: title,
              onPressed: () {},
            ),
          )),
        ],
      ),
    );
  }
}

class CustomFootButton extends StatelessWidget with _PaddingUtility {
  CustomFootButton(
      {super.key, required this.buttonText, required this.onPressed});
  final String buttonText;
  final void Function() onPressed; //buttonun ne iş yapacağı bueaya yazılır.

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Theme.of(context).colorScheme.error,
          shape: StadiumBorder(),
        ),
        onPressed: onPressed,
        child: Padding(
          padding: normalPadding,
          child: Text(
            buttonText,
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                color: Theme.of(context).colorScheme.primary,
                fontWeight: FontWeight.bold),
          ),
        ));
  }
}

mixin class _PaddingUtility {
  final EdgeInsets normalPadding = EdgeInsets.all(8.0);
  final EdgeInsets normal2xPadding = EdgeInsets.all(15.0);
}
