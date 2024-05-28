import 'package:flutter/material.dart';
import 'package:flutter_veli_bacik1/101/image_learn.dart';
import 'package:flutter_veli_bacik1/101/stack_learn.dart';
import 'package:flutter_veli_bacik1/101/text_learnview.dart';

class PageViewLearn extends StatefulWidget {
  const PageViewLearn({super.key});

  @override
  State<PageViewLearn> createState() => _PageViewLearnState();
}

class _PageViewLearnState extends State<PageViewLearn> {
  final _pageController = PageController(
      viewportFraction: 0.7); //componentin controllerini dışarı taşıdık diğer özelliklere de erişebilmek için

  int _currntPageIndex = 0;

  void _UpdatePageIndex(int index) {
    setState(() {
      _currntPageIndex =
          index; //!Componentten gelen index değerini değişkene atıp setState ile ekran çıktısında güncelliyoruz.
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: _PaddingUtility()._paddingValue,
            child: Text("$_currntPageIndex"),
          ),
          const Spacer(),
          FloatingActionButton(
            onPressed: () {
              _pageController.previousPage(duration: _DurationUtility()._durationLow, curve: Curves.slowMiddle);
            },
            child: Icon(Icons.chevron_left_outlined),
          ),
          Padding(
            padding: _PaddingUtility()._paddingValue,
            child: FloatingActionButton(
              onPressed: () {
                _pageController.nextPage(
                    duration: _DurationUtility()._durationLow,
                    curve: Curves.slowMiddle); //*bir sonraki sayfaya geçmek için
              },
              child: Icon(Icons.chevron_right_outlined),
            ),
          ),
        ],
      ),
      appBar: AppBar(),
      body: PageView(
        //!KENDİSİ STATEFUL BİR WİDGET ZATEN.
        padEnds: false, //*baştan başlar boşluk bırakmaz
        onPageChanged: _UpdatePageIndex, //*DİREK DATAYI BU FUN. GÖNDERİR.
        controller: _pageController,
        children: [ImageLearnView(), StackLearn(), TextLearnView()],
      ),
    );
  }
}

class _DurationUtility {
  final _durationLow = Duration(seconds: 1);
}

class _PaddingUtility {
  final _paddingValue = EdgeInsets.only(left: 20);
}
