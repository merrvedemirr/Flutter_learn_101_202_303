import 'package:flutter/material.dart';
import 'package:flutter_veli_bacik1/core/random_image.dart';

class StackDemoView extends StatelessWidget {
  const StackDemoView({super.key});

  final double _cardHeight = 100.0;
  final double _cardWidth = 300.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Expanded(
              flex: 4, //ekranın ne kadar kaplayacak
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Positioned.fill(
                    child: RandomImage(),
                    bottom: _cardHeight / 2,
                  ), //positioned.fill tüm alanı kapsar.

                  Positioned(height: _cardHeight, width: _cardWidth, bottom: 0, child: _cardCustom())
                ],
              )),
          Spacer(
            flex: 6,
          )
        ],
      ),
    );
  }

  Card _cardCustom() {
    return Card(
      child: ListTile(
        onTap: () {},
        textColor: const Color.fromARGB(255, 51, 39, 39),
        leading: Icon(Icons.access_time_filled_rounded),
        title: Text("Merhaba Merve!"),
        subtitle: Text("Bugün kendini nasıl hissediyorsun?"),
        trailing: Icon(Icons.chevron_right),
      ),
      color: Colors.white,
      shape: RoundedRectangleBorder(),
    );
  }
}
