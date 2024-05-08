import 'package:flutter/material.dart';

class StatelessLearn extends StatelessWidget {
  const StatelessLearn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amberAccent[400], //themeden farklı verdim.
      ),
      body: Column(
        children: [
          TitleWidget(text: "Merve"),
          _emptyBox(),
          TitleWidget(text: "Merve1"),
          _emptyBox(),
          TitleWidget(text: "Merve2"),
          _emptyBox(),
          TitleWidget(text: "Merve3"),
          _emptyBox(),
          TitleWidget(text: "Merve4"),
          _ContainerWidget(), //EXTRACT WİDGET YAPTIK
          _emptyBox(), //EXTRACT METHOD YAPTIK. BASİT Componentler İÇİN UYGUNDUR.
        ],
      ),
    );
  }

  SizedBox _emptyBox() => SizedBox(height: 10); //SADECE RETURN EDİLECEK İFADELER DE BÖYLE KULLANILABİLİR.
}

class _ContainerWidget extends StatelessWidget {
  const _ContainerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 10,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Theme.of(context).colorScheme.error,
      ),
    );
  }
}

class TitleWidget extends StatelessWidget {
  const TitleWidget({super.key, required this.text}); //Constructor Eklememiz Lazım!!
  //EĞER REQUİRED VAR İSE TEXT VERMEK ZORUNLU OLACAK.TRİCK=  _TİTLEWİDGET YAPARAK SADECE BU SAYFADA KULLANILMASINI SAĞLARIZ

  final String? text; //DIŞARIDAN MÜDAHALE EDİLEBİLİR BİR YAPI EKLEDİK

  @override
  Widget build(BuildContext context) {
    return Text(
      text!, //NULL OLMAMASI LAZIM
      style: Theme.of(context).textTheme.headlineLarge,
    );
  }
}

//STATELESS WİDGET DE BİLMEMİZ GEREKENLER
//1- KKOMPLEKS YAPILARDA BU WİDGET İLE KODLARI DÜZENLEMELİYİZ.
//2- DIŞARIDAN PARAMETRE ALIR HALDE BU WİDGETİ YAZMALIYIZ.
//3- İSİMLENDİRME DE _ KOYUP PRİVATE (SAYFAYA ÖZGÜ) YAPMALIYIZ.