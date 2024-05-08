import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_veli_bacik1/101/color_learn.dart';
import 'package:flutter_veli_bacik1/202/package_learn_view.dart';
import 'package:flutter_veli_bacik1/202/service/service_get_learn_view.dart';
//import 'package:flutter_veli_bacik1/202/service/service_learn_view.dart';
import 'package:flutter_veli_bacik1/202/service/service_post_learn_view.dart';
//import 'package:flutter_veli_bacik1/202/model_learn_view.dart';
//import 'package:flutter_veli_bacik1/101/navigation_learn.dart';
import 'package:flutter_veli_bacik1/202/tab_learn.dart';
//import 'package:flutter_veli_bacik1/101/example.dart';
//import 'package:flutter_veli_bacik1/101/navigation_learn.dart';
//import 'package:flutter_veli_bacik1/101/list_view_builder.dart';
//import 'package:flutter_veli_bacik1/demos/my_collections_demos.dart';
//import 'package:flutter_veli_bacik1/101/list_view_learn.dart';
//import 'package:flutter_veli_bacik1/demos/color_life_cycle.dart';
import 'package:flutter_veli_bacik1/101/page_view_learn.dart';
//import 'package:flutter_veli_bacik1/101/statefull_lif_cycle_learn.dart';
//import 'package:flutter_veli_bacik1/101/text_field_learn.dart';
//import 'package:flutter_veli_bacik1/demos/colors_demos_view.dart';
//import 'package:flutter_veli_bacik1/101/statefull_learn.dart';
//import 'package:flutter_veli_bacik1/101/column_row_learn.dart';
//import 'package:flutter_veli_bacik1/101/stack_learn.dart';
//Simport 'package:flutter_veli_bacik1/demos/stack_demo_view.dart';
//import 'package:flutter_veli_bacik1/101/custom_widget.dart';
//import 'package:flutter_veli_bacik1/101/indicator_learn.dart';
//import 'package:flutter_veli_bacik1/101/list_tile_learn.dart';
//import 'package:flutter_veli_bacik1/101/custom_widget.dart';
//import 'package:flutter_veli_bacik1/101/example.dart';
//import 'package:flutter_veli_bacik1/101/image_learn.dart';
//import 'package:flutter_veli_bacik1/101/note_demos.dart';
//import 'package:flutter_veli_bacik1/101/ornek.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light().copyWith(
        //Themeden tanımladık ve bir değişiklik olduğunda direk buradan değiştiririz.
        tabBarTheme: TabBarTheme(
          indicatorColor: Colors.yellow,
          labelColor: Colors.white,
          unselectedLabelColor: Colors.pink,
        ),

        bottomAppBarTheme: BottomAppBarTheme(
          shape: CircularNotchedRectangle(),
        ),

        progressIndicatorTheme: ProgressIndicatorThemeData(color: Colors.white),
        listTileTheme: ListTileThemeData(contentPadding: EdgeInsets.zero),
        colorScheme: const ColorScheme(
            brightness: Brightness.dark,
            primary: Color.fromARGB(255, 72, 204, 224),
            onPrimary: const Color.fromARGB(255, 14, 63, 136),
            secondary: Color.fromARGB(255, 216, 167, 167),
            onSecondary: Color.fromARGB(255, 240, 208, 246),
            error: Colors.red,
            onError: Color.fromARGB(255, 243, 68, 56),
            background: Colors.greenAccent,
            onBackground: Color.fromARGB(255, 123, 119, 119),
            surface: Color.fromARGB(255, 203, 153, 219),
            onSurface: Color.fromARGB(255, 0, 0, 0)),
        //!Themesi var.
        inputDecorationTheme: const InputDecorationTheme(
            border: OutlineInputBorder(),
            iconColor: Color.fromARGB(255, 153, 24, 15),
            labelStyle: TextStyle(color: Colors.blue)),
        cardTheme: CardTheme(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))),
        errorColor: ColorItems.Orange,
        appBarTheme: const AppBarTheme(
            centerTitle: true,
            backgroundColor: Colors.amber,
            elevation: 0,
            systemOverlayStyle: SystemUiOverlayStyle.dark),
      ),
      home: PackageLearnView(),
    );
  }
}
