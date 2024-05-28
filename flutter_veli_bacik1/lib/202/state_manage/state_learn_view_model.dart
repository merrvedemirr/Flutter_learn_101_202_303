import 'package:flutter/material.dart';
import 'package:flutter_veli_bacik1/202/state_manage/state_manage_learn_view.dart';

//todo: StateManageLearnView CLASSINDAKİ İNİTSTATE SETSTATE YAPILARINI BU ŞEKİLDE TAŞIDIK. DAHA DÜZENLİ OLDU.
abstract class StateLearnViewModel extends State<StateManageLearnView> {
  @override
  void initState() {
    super.initState();
  }

  bool isVisible = false;
  bool isOpacity = false;

  void changeVisible() {
    setState(() {
      isVisible = !isVisible;
    });
  }

  void changeOpacity() {
    setState(() {
      isOpacity = !isOpacity;
    });
  }
}
