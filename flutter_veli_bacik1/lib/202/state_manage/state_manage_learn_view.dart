import 'package:flutter/material.dart';
import 'package:flutter_veli_bacik1/202/state_manage/state_learn_view_model.dart';

class StateManageLearnView extends StatefulWidget {
  const StateManageLearnView({super.key});

  @override
  State<StateManageLearnView> createState() => _StateManageLearnViewState();
}

//TODO: BURADA STATE MANAGE YAPTIK. BASİC
//todo: State yaptık çünkü değişken yönetimini başka bir yere alıp burada sadece view kodları kaldı. daha düzenli ve yönetilebilir bir kod oldu.
class _StateManageLearnViewState extends StateLearnViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          changeVisible();
        },
      ),
      appBar: AppBar(
        backgroundColor: isOpacity ? Colors.red : Colors.green,
        shadowColor: isVisible ? Colors.amber : Colors.blue,
      ),
    );
  }
}
