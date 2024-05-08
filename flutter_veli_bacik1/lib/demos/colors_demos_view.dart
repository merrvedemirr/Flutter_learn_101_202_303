//Bir ekran olacak
//bu ekranda 3 button ve bunlara basınca renk değişimi olacak
//secili olan button selected icon olsun.

import 'package:flutter/material.dart';

class ColorDemos extends StatefulWidget {
  const ColorDemos({super.key, required this.initialColor});

  final Color?
      initialColor; //!BU CLASS KULLANILACAĞI ZAMAN EN BAŞTA RENK PARAMETRESİ ALIR. NEDEN NULLABLE OLDU? : DİĞER CLASSLARDAN GELEN PARAMETRE NULL OLABİLİR. örn: Bİr şeye tıklansın renk değiştirilmek istensin.
  @override
  State<ColorDemos> createState() => _ColorDemosState();
}

class _ColorDemosState extends State<ColorDemos> {
  Color? _background; //*EN BAŞTA BU RENK OLSUN.

  @override
  void initState() {
    //bu kodu deneme-yanılma ile yazdı olması gereken didupdate olan
    super.initState();
    _background = widget.initialColor ??
        Colors
            .transparent; //todo: üstteki statefull classındaki initialCOlor değerini alabilmek için widget. yaptık. üstten gelen renk null olursa transparent olsun dedim.
  }

  @override
  void didUpdateWidget(covariant ColorDemos oldWidget) {
    super.didUpdateWidget(oldWidget);

    //inspect(widget); //!DEBUG YAPMADA YARDIMCI OLUYOR LOG ÇIKTISINDA OBJENİN ÖZELLİKLERİNİ GÖSTERİR.
    if (widget.initialColor != _background && widget.initialColor != null) {
      _ChangeBackgroundColor(widget.initialColor!);
    }
  }

//*Buttona basıldığında arka plan rengi değişmesi için özel bir fun yaptık.
  void _ChangeBackgroundColor(Color backgroundColor) {
    setState(() {
      _background = backgroundColor;
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _background,
      bottomNavigationBar: BottomNavigationBar(
          onTap: _colorOnTap, //*Yazdığımız kodu dışarı aldık.
          items: const [
            BottomNavigationBarItem(
                icon: _ColorContainer(
                  color: Colors.red,
                ),
                label: "Red"),
            BottomNavigationBarItem(
                icon: _ColorContainer(
                  color: Colors.yellow,
                ),
                label: "yellow"),
            BottomNavigationBarItem(icon: _ColorContainer(color: Colors.blue), label: "Blue"),
          ]),
      appBar: AppBar(),
      body: Column(),
    );
  }

  void _colorOnTap(int value) {
    //!BUTONA GÖRE ARKA PLAN DEĞİŞTİREN BİR UYGULAMA.
    /* ÇOK DA KULLANIŞLI BİR KOD DEĞİLDİR
  
         if (value == 0) {
            _ChangeBackgroundColor(Colors.red);
          } else if (value == 1) {
            _ChangeBackgroundColor(Colors.yellow);
          } else {
            _ChangeBackgroundColor(Colors.blue);
          }*/

    if (value == _MyColors.red.index) {
      _ChangeBackgroundColor(Colors.red);
    } else if (value == _MyColors.yellow.index) {
      _ChangeBackgroundColor(Colors.yellow);
    } else if (value == _MyColors.blue.index) {
      _ChangeBackgroundColor(Colors.blue);
    }
  }
}

enum _MyColors {
  red, //0
  yellow, //1
  blue, //2
}

//*CONTAİNER OLAN KISMI DIŞARI ÇIKARDIK DAHA DÜZENLİ VE KOD TEKRARI ÖNLENDİ
//*DIŞARIDAN RENK PARAMETRESİNİ ALDIK.
class _ColorContainer extends StatelessWidget {
  const _ColorContainer({
    super.key,
    required this.color,
  });

  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      width: 20,
      height: 20,
    );
  }
}
