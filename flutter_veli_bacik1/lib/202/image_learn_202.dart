import 'package:flutter/material.dart';

class ImageLearn202 extends StatefulWidget {
  const ImageLearn202({super.key});

  @override
  State<ImageLearn202> createState() => _ImageLearn202State();
}

class _ImageLearn202State extends State<ImageLearn202> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ImagePath.yemekler.toWidget(height: 300), //!ADVANCE IMAGE WİDGET YAPMA YÖNTEMİDİR.
      //*Farklı olmasını istiyorsak da böyle verebiliriz.
    );
  }
}

enum ImagePath { yemekler }

extension ImagePathsExtension on ImagePath {
  String path() {
    return "lib/Assets/png/$name.jpg"; //todo: name burada özel enumdaki değerlere referans veriyor
  }

  Widget toWidget({double height = 24}) {
    //örneğim tüm ekranlarda fotolar aynı yükseklikte olması gerekiyor ise böyle verebiliriz.
    return Image.asset(
      path(),
      height: height,
    );
  }
}
