import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingBar extends StatelessWidget {
  const LoadingBar({super.key, this.size = 50.0});
  final double size;

  @override
  Widget build(BuildContext context) {
    return SpinKitPianoWave(
      color: Colors.orange,
      size: size,
    );
  }
}
