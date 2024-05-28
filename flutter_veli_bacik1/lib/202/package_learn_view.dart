import 'package:flutter/material.dart';
import 'package:flutter_veli_bacik1/202/package/launch_manager.dart';
//import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_veli_bacik1/202/package/loading_bar.dart';
import 'package:url_launcher/url_launcher.dart';

class PackageLearnView extends StatefulWidget {
  const PackageLearnView({super.key});

  @override
  State<PackageLearnView> createState() => _PackageLearnViewState();
}

class _PackageLearnViewState extends State<PackageLearnView> with TickerProviderStateMixin, LaunchMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).colorScheme.onSecondary,
        onPressed: () {
          launchUrl(Uri.parse("https://pub.dev/packages/url_launcher"));
        },
      ),
      appBar: AppBar(),
      body: Column(
        children: [
          Text(
            "data",
            style: Theme.of(context).textTheme.titleMedium, //bunu kendi yazdığımız theme ile kullandık.
          ),
          LoadingBar(
            size: 100,
          ),
        ],
      ),
    );
  }
}
