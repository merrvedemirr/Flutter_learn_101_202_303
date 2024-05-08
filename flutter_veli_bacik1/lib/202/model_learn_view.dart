import 'package:flutter/material.dart';
import 'package:flutter_veli_bacik1/202/model_learn.dart';

class ModelLearnView extends StatefulWidget {
  const ModelLearnView({super.key});

  @override
  State<ModelLearnView> createState() => _ModelLearnViewState();
}

class _ModelLearnViewState extends State<ModelLearnView> {
  var user9 = PostModel8(body: "b"); //*update edebilmek için var yaptık.

  @override
  void initState() {
    super.initState();
    final user1 = PostModel1()
      ..userId = 1
      ..title = "Başlik"; //*BU şekilde tanımlanabilir Tric Point.
    user1.userId = 1;

    //*********************** */

    final user2 = PostModel2(1, 1, "a", "b");
    user2.id = 2;

    //*********************** */

    final user3 = PostModel3(1, 1, "s", "e");
    //user3.body = "a";

    //*********************** */

    final user4 = PostModel4(userId: 1, id: 2, title: "d", body: "q");
    //user4.body = "s";

    //*********************** */

    final user5 = PostModel5(userId: 1, id: 1, title: "d", body: "w");
    user5.userId;

    //*********************** */

    final user6 = PostModel6(userId: 1, id: 1, title: "d", body: "w");
    //user6. erişilemez.

    //*********************** */

    final user7 = PostModel7();

    //*********************** */

    final user8 = PostModel8(body: "a");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            user9 = user9.copyWith(title: "Başlik"); //!Bu kullanım önemlidir.
            user9.updateBody(null); //?kod korunur.
          });
        },
      ),
      appBar: AppBar(
        title: Text(user9.body ?? "Not has any data"),
      ),
    );
  }
}
