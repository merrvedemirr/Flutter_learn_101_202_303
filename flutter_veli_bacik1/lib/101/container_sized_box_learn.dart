import 'package:flutter/material.dart';

class ContainerSizedBoxLearn extends StatelessWidget {
  const ContainerSizedBoxLearn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          const SizedBox(
            width: 200,
            height: 200,
            child: Text('aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa'),
          ),

          const SizedBox.shrink(), //boş bir alan sağlar.
          const SizedBox.square(
            dimension: 50,
            child: Text("bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb"),
          ), //kare alan yapar

          Container(
            constraints: BoxConstraints(
              maxWidth: 150,
              minWidth: 50,
            ),
            child: Text("ccccaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"),
            padding: EdgeInsets.only(left: 10, bottom: 7),
            margin: EdgeInsets.all(30),
            decoration: ProjectContainerDecoration(),
          ),
        ],
      ),
    );
  }
}

//MİRAS ALARAK ÖZELLİKLERİ TAŞIDIK
class ProjectContainerDecoration extends BoxDecoration {
  ProjectContainerDecoration()
      : super(
            borderRadius:
                const BorderRadius.horizontal(right: Radius.elliptical(12, 14)),
            gradient: const LinearGradient(colors: [Colors.red, Colors.yellow]),
            //color: Colors.pink,

            border: Border.all(
              width: 1.2,
              color: Colors.grey,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black,
                offset: Offset(4, 7),
                blurRadius: 19.8,
              )
            ]);
}

//DEĞİŞKEN İLE ÖZELLİKLERİ TAŞIDIK.
class ProjectUtilityDecoration {
  static BoxDecoration boxDecoration = BoxDecoration(
      borderRadius:
          const BorderRadius.horizontal(right: Radius.elliptical(12, 14)),
      gradient: const LinearGradient(colors: [Colors.red, Colors.yellow]),
      //color: Colors.pink,

      border: Border.all(
        width: 1.2,
        color: Colors.grey,
      ),
      boxShadow: [
        BoxShadow(
          color: Colors.black,
          offset: Offset(4, 7),
          blurRadius: 19.8,
        )
      ]);
}
