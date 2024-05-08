import 'package:flutter/material.dart';
import 'package:flutter_veli_bacik1/demos/colors_demos_view.dart';

class ColorLifeCycleView extends StatefulWidget {
  const ColorLifeCycleView({super.key});

  @override
  State<ColorLifeCycleView> createState() => _ColorLifeCycleViewState();
}

class _ColorLifeCycleViewState extends State<ColorLifeCycleView> {
  Color? _backgroundColor; //null olabilir.

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: _changeBackgroundColor, //*yazılan kodu dışarı aldık.
              icon: Icon(Icons.clear)),
        ], //*SOl üst köşe yeri
      ),
      body: Column(
        children: [
          Spacer(), //*Boşluk bırakmka için
          Expanded(
              child: ColorDemos(
            initialColor: _backgroundColor, //*başlangıç rengini biz verdik.
          )),
        ],
      ),
    );
  }

  void _changeBackgroundColor() {
    setState(() {
      _backgroundColor = Colors.pink;
    });
  }
}
