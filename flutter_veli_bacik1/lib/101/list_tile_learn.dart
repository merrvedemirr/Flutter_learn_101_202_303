import 'package:flutter/material.dart';
import 'package:flutter_veli_bacik1/core/random_image.dart';

class ListTileLearn extends StatelessWidget {
  const ListTileLearn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Card(
            child: ListTile(
              onTap: () {},
              title: RandomImage(),
              //contentPadding: Theme.of(context).listTileTheme.contentPadding,
              subtitle: Text("How do you use your card"),
              leading: Icon(Icons.money), //SOLUNA BİR WİDGET KOYMAMIZI SAĞLAR.
              trailing: Icon(
                  Icons.chevron_right), //SAĞINA BİR WİDGET KOYMAMIZI SAĞLAR
            ),
          )
        ],
      ),
    );
  }
}
