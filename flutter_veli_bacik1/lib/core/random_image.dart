import 'package:flutter/material.dart';

//CORE =  YANİ GENEL KALIP WİDGETLERDİR
//PRODUCT = PROJEYE ÖZGÜ WİDGETLERDİR.

class RandomImage extends StatelessWidget {
  const RandomImage(
      {super.key, this.height = 100}); //değer verilmezse default = 100 olur

  final imageUrl = "https://picsum.photos/200/300";
  final double height;

  @override
  Widget build(BuildContext context) {
    return Image.network(
      imageUrl,
      height: height,
      fit: BoxFit.cover,
    );
  }
}
