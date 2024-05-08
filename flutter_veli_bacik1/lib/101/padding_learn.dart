import 'package:flutter/material.dart';

class PaddingLearnView extends StatelessWidget {
  const PaddingLearnView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: ProjectPadding
            .projectPadding, //CLASS YAPISINDAN KULLANDIK DOĞRU KULLANIM
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: Container(
                height: 100,
                color: Theme.of(context).colorScheme.error,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Container(
                height: 100,
                color: Theme.of(context).colorScheme.error,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 120) +
                  EdgeInsets.symmetric(
                      vertical: 10), //HER İKİ PADDİNG DEĞERİNİ DE VERİR
              child: Text("data"),
            ),
          ],
        ),
      ),
    );
  }
}

class ProjectPadding {
  static const projectPadding = const EdgeInsets.symmetric(vertical: 20);
}
