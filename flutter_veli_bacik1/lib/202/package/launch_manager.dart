import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

//todo: Constructoru olmayan bir yapıdır. Özelliklerini yazıp diğer classlara dahil ederiz.Instance üretilmez.
mixin LaunchMixin<T extends StatefulWidget> on State<T> {
  //!sadece State içinde kullanılır.
  Future<void> launchUrl(Uri url) async {
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    }
  }
}
