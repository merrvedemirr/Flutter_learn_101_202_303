import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

final double kZero =
    0; //k dediğimzi özel bir şey var öğrenicez daha ama çok da bu şekilde kullanılmamalı sadece şimdilik böyle yazdık.

class AnimatedLearn extends StatefulWidget {
  const AnimatedLearn({super.key});

  @override
  State<AnimatedLearn> createState() => _AnimatedLearnState();
}

class _AnimatedLearnState extends State<AnimatedLearn> with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    controller = AnimationController(vsync: this, duration: _DurationItems.durationLow);
  }

  late AnimationController controller;

  bool _isVisible = false;
  bool _isOpacity = false;

  void _changeVisible() {
    setState(() {
      _isVisible = !_isVisible;
    });
  }

  void _changeOpacity() {
    setState(() {
      _isOpacity = !_isOpacity;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _placeHolderWidget(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _changeVisible();
          controller.animateTo(_isVisible ? 1 : 0);
        },
      ),
      body: Column(
        children: [
          ListTile(
            title: AnimatedOpacity(
                duration: _DurationItems.durationLow,
                opacity: _isOpacity ? 1 : 0,
                child: Text(
                  "data",
                  style: context.textTheme().displayMedium,
                )),
            trailing: IconButton(
                onPressed: () {
                  _changeOpacity();
                },
                icon: Icon(Icons.ac_unit_outlined)),
          ),
          AnimatedDefaultTextStyle(
              child: Text("data"),
              style:
                  (_isVisible ? context.textTheme().displayMedium : context.textTheme().headlineMedium) ?? TextStyle(),
              duration: _DurationItems.durationLow),

          //!MENU ÇUBUĞUNDA KULLANILABİLİR GÜZEL BİR ANİMASYON
          AnimatedIcon(icon: AnimatedIcons.menu_close, progress: controller),

          //!AÇILIR KAPANIR BİR CONTAİNER OLUŞTURUR.
          AnimatedContainer(
            duration: _DurationItems.durationLow,
            width: MediaQuery.of(context).size.width * 0.2,
            height: _isVisible ? kZero : MediaQuery.of(context).size.height * 0.2,
            color: Colors.blue,
            margin: EdgeInsets.all(5),
          ),

          //*component animasyonlu olarak yer değiştiriyor.
          Expanded(
              child: Stack(
            children: [
              AnimatedPositioned(curve: Curves.easeInCirc, child: Text("data"), duration: _DurationItems.durationLow)
            ],
          )),

          //* Animasyonlu ekle çıkar yapan bir liste
          Expanded(
            child: AnimatedList(
              itemBuilder: (context, index, animation) {
                return Text("data");
              },
            ),
          )
        ],
      ),
    );
  }

  AnimatedCrossFade _placeHolderWidget() {
    return AnimatedCrossFade(
      firstChild: Placeholder(),
      secondChild: SizedBox.shrink(),
      duration: _DurationItems.durationLow,
      crossFadeState: _isVisible ? CrossFadeState.showFirst : CrossFadeState.showSecond,
    );
  }
}

extension BuildContextExtension on BuildContext {
  TextTheme textTheme() {
    return Theme.of(this)
        .textTheme; //!bu kod sürekli theme.of(context) yazmamızı önler. başka yerlerde de çağrılabilir.
  }
}

class _DurationItems {
  static const durationLow = Duration(seconds: 1);
}
