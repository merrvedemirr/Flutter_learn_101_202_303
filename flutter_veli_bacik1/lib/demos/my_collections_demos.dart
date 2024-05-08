import 'package:flutter/material.dart';
//import 'package:flutter_veli_bacik1/core/random_image.dart';

class MyCollectionsDemos extends StatefulWidget {
  const MyCollectionsDemos({super.key});

  @override
  State<MyCollectionsDemos> createState() => _MyCollectionsDemosState();
}

class _MyCollectionsDemosState extends State<MyCollectionsDemos> {
  late final List<CollectionModel> _items; //*late+final değerini sadece constr.dan alacak.

  @override
  void initState() {
    //!BİR NEVİ STATEFULL CONSTRUCTOR
    super.initState();
    _items = CollectionItems().items;
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: ListView.builder(
        padding: PaddingUtility().horizontal, //*Paddingler class'a taşındı
        itemCount: _items.length,
        itemBuilder: (context, index) {
          return _CategoryCard(
            model: _items[index],
          );
        },
      ),
    );
  }
}

class _CategoryCard extends StatelessWidget {
  const _CategoryCard({
    //*Constructor fonksiyonu
    super.key,
    required CollectionModel model,
  }) : _model = model;

  final CollectionModel _model;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: PaddingUtility().onlyBottom, //*Paddingler class'a taşındı
      elevation: 9.1,
      child: Padding(
        padding: PaddingUtility().allPadding, //*Paddingler class'a taşındı
        child: Column(
          children: [
            Image.asset(
              _model
                  .imagePath, //todo: ekranda gözüken card'ın index değerini belirleyip listeye atıyoruz. En iyi avantajı da ekranda gözüken card widget'ine göre içerikler değişiyor.**
              fit: BoxFit.fill,
            ),
            Padding(
              padding: PaddingUtility().onlyTop,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    _model.title,
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  Text(
                    "${_model.money} eth",
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CollectionModel {
  //*Model oluşturuyoruz.
  final String imagePath;
  final String title;
  final double money;

  CollectionModel({required this.imagePath, required this.title, required this.money});
}

class CollectionItems {
  //todo: COLLECTİON DEĞERİNİ TOPLADIK
  late final List<CollectionModel> items; //*late+final değerini sadece constr.dan alacak.

  CollectionItems() //*Constructor fonksiyonu.
  {
    items = [
      CollectionModel(imagePath: ProjectImages.imageCollection, money: 3.4, title: "Abstract Art1"),
      CollectionModel(imagePath: ProjectImages.imageCollection, money: 3.4, title: "Abstract Art2"),
      CollectionModel(imagePath: ProjectImages.imageCollection, money: 3.4, title: "Abstract Art3"),
      CollectionModel(imagePath: ProjectImages.imageCollection, money: 3.4, title: "Abstract Art4")
    ];
  }
}

class PaddingUtility {
  //todo: PADDİNG DEĞERLERİNİ TOPLADIK
  final EdgeInsets horizontal = EdgeInsets.symmetric(horizontal: 20);
  final EdgeInsets onlyBottom = EdgeInsets.only(bottom: 20);
  final EdgeInsets allPadding = EdgeInsets.all(20);
  final EdgeInsets onlyTop = EdgeInsets.only(top: 10);
}

class ProjectImages {
  //todo: IMAGE DEĞERLERİNİ TOPLADIK
  static const imageCollection = "lib/Assets/png/yemekler.jpg";
}
//!LİST VİEW İLE CARD YAPISINI ÖZELLEŞTİRDİK BİR TANE CLASS OLUŞTURUK LİST OLUŞTURDUK VE STRİNG DEĞERLERİ ORADAN ATADIK.

