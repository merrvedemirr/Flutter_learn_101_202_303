import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ListViewLearn extends StatefulWidget {
  const ListViewLearn({super.key});

  @override
  State<ListViewLearn> createState() => _ListViewLearnState();
}

class _ListViewLearnState extends State<ListViewLearn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        //!SINIRLAMAZSAN SONSUZA KADAR GİDER.
        children: [
          FittedBox(
            //*Fitted Box yazı vs büyük olsa bile ekrana sığdırır.
            child: Text(
              "Merhaba",
              style: Theme.of(context).textTheme.displayLarge,
              maxLines: 1, //1 satırda gözüksün.
            ),
          ),
          Container(
            color: Colors.red,
            height: 300,
          ),
          Divider(), //todo: Araya çizgi çeker.
          SizedBox(
            height: 300,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.zero,
              children: [
                Container(
                  color: Colors.green,
                  width: 200,
                ),
                Container(
                  color: Colors.pink,
                  width: 200,
                ),
                Container(
                  color: Colors.yellow,
                  width: 200,
                ),
              ],
            ),
          ),

          IconButton(onPressed: () {}, icon: Icon(Icons.close)),
          //xx
          FittedBox(
            //*Fitted Box yazı vs büyük olsa bile ekrana sığdırır.
            child: Text(
              "Merhaba",
              style: Theme.of(context).textTheme.displayLarge,
              maxLines: 1, //1 satırda gözüksün.
            ),
          ),
          Container(
            color: Colors.red,
            height: 300,
          ),
          Divider(), //todo: Araya çizgi çeker.
          SizedBox(
            height: 300,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.zero,
              children: [
                Container(
                  color: Colors.green,
                  width: 200,
                ),
                Container(
                  color: Colors.pink,
                  width: 200,
                ),
                Container(
                  color: Colors.yellow,
                  width: 200,
                ),
              ],
            ),
          ),

          IconButton(onPressed: () {}, icon: Icon(Icons.close)),
          _ListDemo(),
        ],
      ),
    );
  }
}

class _ListDemo extends StatefulWidget {
  const _ListDemo({super.key});

  @override
  State<_ListDemo> createState() => __ListDemoState();
}

class __ListDemoState extends State<_ListDemo> {
  @override
  void initState() {
    //*List View de bu widget göründüğünde çalışıyor. çalışır.
    super.initState();
    print("Hello");
  }

  @override
  void dispose() {
    //*List View de bu widgetten çıkarken çalışır.
    super.dispose();
    print("exit");
  }

  Widget build(BuildContext context) {
    return Placeholder();
  }
}
