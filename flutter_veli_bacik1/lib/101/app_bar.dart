import 'package:flutter/material.dart';

class AppBarView extends StatelessWidget {
  const AppBarView({super.key});
  final String _title = "Welcome AppBar";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_title),
        //centerTitle: true,
        //backgroundColor: Colors.transparent,
        //elevation: 0, //AppBar ve sayfa bir bütünmüş gibi gözükür(renk olarak)
        //systemOverlayStyle: SystemUiOverlayStyle.dark, //üstteki saat,pil gibi yapıların rengini ayarlıyor.
        leading: Icon(Icons.chevron_left), //soldaki geri dön iconu
        //leadingWidth:56, //default değeri 56 en soldaki nesnenin konumu ile ilgili
        actions: [
          Center(child: CircularProgressIndicator()),
          IconButton(onPressed: () {}, icon: Icon(Icons.menu)),
        ],
        actionsIconTheme: IconThemeData(color: Colors.red),
        automaticallyImplyLeading:
            false, //ilk açıldığında default oluşan geri seçeneğini siler.
      ),
    );
  }
}
