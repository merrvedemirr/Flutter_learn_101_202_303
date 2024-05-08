import 'package:flutter/material.dart';
import 'package:flutter_veli_bacik1/101/navigate_detail_learn.dart';

class NavigationLearn extends StatefulWidget {
  const NavigationLearn({super.key});

  @override
  State<NavigationLearn> createState() => _NavigationLearnState();
}

class _NavigationLearnState extends State<NavigationLearn> with NavigatorManager {
  List<int> selectedItems = [];

  void addSelected(int index, bool isAdd) {
    setState(() {
      isAdd ? selectedItems.add(index) : selectedItems.remove(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemBuilder: (context, index) {
          return TextButton(
            onPressed: () async {
              final response = await navigateToWidgetNormal<bool>(
                  context,
                  NavigateLearn(
                    isOkey: selectedItems.contains(index),
                  ));

              if (response is bool) {
                addSelected(index, response); //gelen değere göre ekranda placeholder rengi ayarlanıyor.
              }
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Placeholder(
                color: selectedItems.contains(index) ? Colors.green : Colors.red,
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.arrow_right_alt),
        onPressed: () {
          //todo: Butona tıklandığında istenilen widget sayfasına gidiyor.
        },
      ),
    );
  }
}

mixin NavigatorManager {
  //!BİR NEVİ ARAYÜZ(İNTERFACE) OLUR KULLANILMAK İSTENEN CLASS DA WİTH DİYE ENTEGRE EDİLİR.
  //todo: Hangi widget sayfasına gitmek istiyorsa bu classı kullanabilir.
  void navigateToWidget(BuildContext context, Widget widget) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => widget,
      fullscreenDialog: true, //*İos da anlaşılıyor.
      settings: RouteSettings(), //*sayfa geçişinde obje taşımamızı sağlar.
    ));
  }

  //Todo: DİĞER SAYFADAN VERİ ALMAK İÇİN GENERİC(FUTURE<T?>) YAPISINI KULLANIYORUZ. T BURADA SAYFADAN GELEN VERİNİN TİPİ. ÖNEMLİ!!!!

  Future<T?> navigateToWidgetNormal<T>(BuildContext context, Widget widget) {
    return Navigator.of(context).push<T>(MaterialPageRoute(
      builder: (context) => widget,
      //fullscreenDialog: true, //*İos da anlaşılıyor.
      settings: RouteSettings(), //*sayfa geçişinde obje taşımamızı sağlar.
    ));
  }
}
