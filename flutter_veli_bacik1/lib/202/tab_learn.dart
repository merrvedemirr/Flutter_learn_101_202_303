import 'package:flutter/material.dart';
import 'package:flutter_veli_bacik1/101/card_learn.dart';
import 'package:flutter_veli_bacik1/101/color_learn.dart';
import 'package:flutter_veli_bacik1/101/image_learn.dart';
import 'package:flutter_veli_bacik1/101/text_learnview.dart';

class TabLearn extends StatefulWidget {
  const TabLearn({super.key});

  @override
  State<TabLearn> createState() => _TabLearnState();
}

class _TabLearnState extends State<TabLearn> with TickerProviderStateMixin {
  late final TabController _tabController;
  final double _notchMargin = 10;
  @override
  void initState() {
    super.initState();
    _tabController =
        TabController(length: _MyTabViews.values.length, vsync: this); // vsync değeri ve with edilen değerler kalıptır
  }

  Widget build(BuildContext context) {
    return DefaultTabController(
        length: _MyTabViews.values.length,
        child: Scaffold(
          //TODO: BU TASARIM ÇOK İŞİNE YARAYACAK BUTTOMNAVİGATOR + FLOATİNG ACTİON BUTTON + EXTEND BODY + shape +notchMargin
          extendBody: true,
          floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              _tabController.animateTo(_MyTabViews.home.index);
            },
          ),
          bottomNavigationBar: BottomAppBar(
            notchMargin: _notchMargin,
            //shape: CircularNotchedRectangle(), Themeden verdik.
            child: _MyTabView(),
          ),
          appBar: AppBar(
              /*bottom: TabBar(controller: _tabController, tabs: [
              Tab(text: "Page 1"),
              Tab(text: "Page 1"),
            ]),*/
              ),
          body: _TabBarView(),
        ));
  }

  //!alt button kısmı oluşuyor.
  TabBar _MyTabView() {
    return TabBar(
        //diğer özellikleri themeden verdik.s
        padding: EdgeInsets.zero,
        onTap: (value) {},
        controller: _tabController,
        //todo: Enumdan tab isimlerini bu şekilde yazdırırız.
        tabs: _MyTabViews.values.map((e) => Tab(text: "${e.name}")).toList());
  }

  //! Ana ekran görünüm ywri oluşuyor.
  TabBarView _TabBarView() {
    return TabBarView(
        physics: NeverScrollableScrollPhysics(), //Scroll özelliği kapalı olur.
        controller: _tabController,
        children: [ImageLearnView(), CardLearnView(), TextLearnView(), ColorLearnView()]);
  }
}

enum _MyTabViews { home, settings, profile, favorite }

extension _MyTabViewExtension on _MyTabViews {
  //*classlara güç kazandırmak için extension yazılır.
}
