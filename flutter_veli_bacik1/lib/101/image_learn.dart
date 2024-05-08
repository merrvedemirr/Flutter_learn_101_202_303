import 'package:flutter/material.dart';

class ImageLearnView extends StatelessWidget {
  ImageLearnView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          PngImages(name: ImageItems().yemekler),
          Image.network(
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRGEMvQJUukMs7K5KRuGc3TBoAedYZp-jk07cnkaSlmgr96WPS-90uim2iGMkqBqvws37U&usqp=CAU",
            errorBuilder: (context, error, stackTrace) =>
                PngImages(name: ImageItems().hamburger),
          ) //EĞE İMAGE ÇIKMAZ İSE BU SEÇTİĞİM İMAGE GÖSTERİLİR.
        ],
      ),
    );
  }
}

class ImageItems {
  final String hamburger = "resimler";
  final String yemekler = "yemekler";
}

class PngImages extends StatelessWidget {
  const PngImages({super.key, required this.name});

  final String name;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      _nameWithPath,
      fit: BoxFit.contain,
    );
  }

  String get _nameWithPath => "lib/Assets/png/$name.jpg";
}
