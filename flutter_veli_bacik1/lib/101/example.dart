import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    var appName = 'App name';
    var text2 = "Create an Account";
    var text3 = "Enter your email to sign up for this app";
    var text4 = "or continue with";
    var data = "Sign up with email";
    var data2 = "Google";
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            TextView(text: appName, textKalinligi: fontWeight().boldX, textSize: fontWeight().fontSizeLarge),
            const SizedBox(
              height: 100,
            ),
            TextView(
              text: text2,
              textKalinligi: fontWeight().bold,
              textSize: fontWeight().fontSizeNormal,
            ),
            const SizedBox(
              height: 5,
            ),
            TextView(text: text3, textKalinligi: fontWeight().slim, textSize: fontWeight().fontSizeSlim),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
              child: const _TextFieldWidget(),
            ),
            _ElevatedButtonView(data: data),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 14),
              child: TextView(
                text: text4,
                textKalinligi: fontWeight().slim,
                textSize: fontWeight().fontSizeSlim,
                textColor: Theme.of(context).colorScheme.onSurface,
              ),
            ),
            _ElevatedButtonView(
              data: data2,
              buttonBackgroundColor: Theme.of(context).colorScheme.onSurface,
            )
          ],
        ),
      ),
    );
  }
}

class _ElevatedButtonView extends StatelessWidget {
  const _ElevatedButtonView({super.key, required this.data, this.buttonBackgroundColor = Colors.black});

  final String data;
  final Color buttonBackgroundColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: 390,
      child: ElevatedButton(
        onPressed: () {},
        child: Text(
          data,
          style: const TextStyle(color: Colors.white),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: buttonBackgroundColor,
          //padding: EdgeInsets.symmetric(horizontal: 120, vertical: 15)
        ),
      ),
    );
  }
}

class _TextFieldWidget extends StatelessWidget {
  const _TextFieldWidget({
    super.key,
  });
  final String hintText2 = 'email@domain.com';

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        hintText: hintText2,
        hintStyle: TextStyle(color: Theme.of(context).colorScheme.onSurface),
      ),
    );
  }
}

class TextView extends StatelessWidget {
  const TextView(
      {super.key,
      required this.text,
      required this.textKalinligi,
      required this.textSize,
      this.textColor = Colors.black});

  final String text;
  final FontWeight textKalinligi;
  final double textSize;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context)
          .textTheme
          .headlineLarge
          ?.copyWith(fontWeight: textKalinligi, fontSize: textSize, color: textColor),
    );
  }
}

class fontWeight {
  final FontWeight boldX = FontWeight.w700;
  final FontWeight bold = FontWeight.w500;
  final FontWeight normal = FontWeight.normal;
  final FontWeight slim = FontWeight.w300;
  final double fontSizeNormal = 25;
  final double fontSizeLarge = 30.0;
  final double fontSizeSlim = 18.0;
}
