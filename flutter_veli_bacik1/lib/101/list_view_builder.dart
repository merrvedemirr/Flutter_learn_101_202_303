import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_veli_bacik1/core/random_image.dart';

class ListViewBuilder extends StatefulWidget {
  const ListViewBuilder({super.key});

  @override
  State<ListViewBuilder> createState() => _ListViewBuilderState();
}

class _ListViewBuilderState extends State<ListViewBuilder> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: ListView.separated(
          //!ListView.builder bir sürü widget çizer.(itemCount da vardır) .seperated ise itemCount kaç ise o kadar!!
          itemCount: 15,
          separatorBuilder: (context, index) {
            return Divider();
          },
          itemBuilder: (context, index) {
            print("$index"); //ekranda görünen widgete göre consola yazıyor.
            return SizedBox(
              height: 100,
              child: Column(
                children: [
                  Expanded(child: const RandomImage()), //Resim Taşarsa sığdırıyor taşmayı engeller.
                  Text("$index"),
                ],
              ),
            );
          },
        ));
  }
}
