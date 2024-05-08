import 'package:flutter/material.dart';
import 'package:flutter_veli_bacik1/101/container_sized_box_learn.dart';

class ScaffoldLearn extends StatelessWidget {
  const ScaffoldLearn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SCAFFOLD LEARN VİEW"),
        backgroundColor: Color.fromARGB(255, 241, 112, 48),
      ),
      body: ScrollNotificationObserver(
        child: Column(children: [
          Image.asset(
            "lib/images/resimler.jpg",
            width: 600,
            // height: 400,
          ),
        ]),
      ),
      backgroundColor: Color.fromARGB(255, 210, 205, 197),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
              context: context,
              builder: (context) => Container(
                    width: 400,
                    height: 200,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "HAMBURGER SADECE 199.99 TL'DEN BAŞLAYAN FİYATLARLA",
                            style: TextStyle(
                              color: Color.fromARGB(255, 252, 152, 2),
                              fontWeight: FontWeight.bold,
                              fontSize: 20.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ));
        },
        backgroundColor: Color.fromARGB(255, 246, 119, 51),
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      drawer: Drawer(
        child: TextButton(
          child: Column(
            children: [
              TextButton(onPressed: () {}, child: Text("Yemek Menüleri")),
              TextButton(onPressed: () {}, child: Text("İçecek Menüleri")),
              TextButton(onPressed: () {}, child: Text("Dondurma Menüleri")),
              TextButton(onPressed: () {}, child: Text("Tatlı Menüleri")),
            ],
          ),
          onPressed: () {},
        ),
      ),
      extendBody: true,
      //bottomSheet: Text("merve"),
      bottomNavigationBar: Container(
        decoration: ProjectUtilityDecoration.boxDecoration,
        child: BottomNavigationBar(
            backgroundColor: Color.fromARGB(255, 255, 255, 255),
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.done), label: "A"),
              BottomNavigationBarItem(icon: Icon(Icons.food_bank), label: "B"),
            ]),
      ),
    );
  }
}
