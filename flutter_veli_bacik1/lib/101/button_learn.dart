import 'package:flutter/material.dart';

class ButtonLearnView extends StatelessWidget {
  const ButtonLearnView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
      ),
      body: Column(
        children: [
          //BUTTON ÇEŞİTLERİ
          TextButton(
            onPressed: () {},
            child: Text(
              "Save",
              style: Theme.of(context).textTheme.subtitle1,
            ),
            style: ButtonStyle(
              //MaterialStateProperty yapısı ile tıklandığında durumu değiştirebiliriz.
              backgroundColor: MaterialStateProperty.resolveWith((states) {
                if (states.contains(MaterialState.pressed)) {
                  return Colors.green;
                } else {
                  return Colors.yellow;
                }
              }),
            ),
          ),

          const ElevatedButton(onPressed: null, child: Text("Data")),

          IconButton(onPressed: () {}, icon: const Icon(Icons.access_alarm_outlined)),

          FloatingActionButton(
            onPressed: () {},
            child: const Icon(Icons.add),
          ),

          OutlinedButton(
            onPressed: () {},
            child: const Text("Data"),
            style: OutlinedButton.styleFrom(shape: const CircleBorder(), padding: EdgeInsets.all(14.1)),
          ),

          OutlinedButton.icon(
            icon: const Icon(Icons.account_balance),
            onPressed: () {},
            label: const Text("Ev"),
          ),

          //Texte presses (tıklanma) özelliği eklenir
          InkWell(
            child: const Text("Merve"),
            onTap: () {},
          ),

          Container(
            height: 50,
            color: const Color.fromARGB(255, 0, 0, 0),
          ),
          const SizedBox(
            height: 10,
          ),

          ElevatedButton(
            onPressed: () {},
            child: Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 10, left: 20, right: 20),
              child: Text(
                "Place Bid",
                style: const TextStyle(color: Colors.white, fontSize: 30),
              ),
            ),
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40))),
          ),
        ],
      ),
    );
  }
}
