import 'package:flutter/material.dart';

class WidgetSizeEnumLearnView extends StatefulWidget {
  const WidgetSizeEnumLearnView({super.key});

  @override
  State<WidgetSizeEnumLearnView> createState() => _WidgetSizeEnumLearnViewState();
}

class _WidgetSizeEnumLearnViewState extends State<WidgetSizeEnumLearnView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Card(
        child: Container(
          height: WidgetSize.normalCardHeight.value(), //todo: Extension yazılmaz.!!
          color: Colors.green,
        ),
      ),
    );
  }
}

enum WidgetSize { normalCardHeight, circleProfileWidth }

//todo: enuma hayat vermek için extension yazdık.
extension WidgetSizeExtension on WidgetSize {
  double value() {
    switch (this) {
      case WidgetSize.normalCardHeight:
        return 100.0;
      case WidgetSize.circleProfileWidth:
        return 30.0;
    }
  }
}
