import 'package:flutter/material.dart';
import 'package:flutter_veli_bacik1/202/cache/shared_manager.dart';
import 'package:flutter_veli_bacik1/202/cache/user_model.dart';
import 'package:url_launcher/url_launcher.dart';

class SharedLearn extends StatefulWidget {
  const SharedLearn({super.key});

  @override
  State<SharedLearn> createState() => _SharedLearnState();
}

class _SharedLearnState extends LoadingStatefull<SharedLearn> {
  late final SharedManager _manager; //todo: Yazdığımız Shared yönetimi yapan sınıftan nesne oluşturduk.

  @override
  void initState() {
    super.initState();
    _manager = SharedManager(); //todo: initstate içinde başlattık.
    _Initialize(); //todo: preferences değerini başlattık.
  }

  Future<void> _Initialize() async {
    changeLoading();
    await _manager.init();
    changeLoading();

    getDefaultValue();
  }

  Future<void> getDefaultValue() async {
    //paket içindeki kodlar.
    // final SharedPreferences prefs = await SharedPreferences.getInstance();
    // final int? counter = prefs.getInt('counter');
    _onChangeValue((_manager.getString(SharedKeys.counter)) ?? "");
  }

  int _currentValue = 0;

  void _onChangeValue(String value) {
    final _value = int.tryParse(value);

    if (_value != null) {
      setState(() {
        _currentValue = _value;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          isloading
              ? const CircularProgressIndicator(
                  color: Colors.black,
                )
              : const SizedBox.shrink()
        ],
        title: Center(child: Text("$_currentValue")),
      ),
      floatingActionButton: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _removeValueFloatingButton(),
          _saveValueFloatingButton(),
        ],
      ),
      body: Column(
        children: [
          TextField(
            onChanged: (value) {
              _onChangeValue(value);
            },
          ),
          Expanded(
            child: _UserListView(),
          )
        ],
      ),
    );
  }

  FloatingActionButton _saveValueFloatingButton() {
    return FloatingActionButton(
      child: Icon(Icons.save),
      onPressed: () async {
        changeLoading();
        await _manager.saveString(SharedKeys.counter, _currentValue.toString());
        changeLoading();
      },
    );
  }

  FloatingActionButton _removeValueFloatingButton() {
    return FloatingActionButton(
      child: Icon(Icons.remove),
      onPressed: () async {
        changeLoading();
        await _manager.removeItem(SharedKeys.counter);
        changeLoading();
      },
    );
  }
}

class _UserListView extends StatelessWidget {
  _UserListView({
    super.key,
  });

  final List<User> users = UserItems().users;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: users.length,
      itemBuilder: (context, index) {
        return Card(
          child: ListTile(
            title: Text(users[index].name ?? ""),
            subtitle: Text(users[index].description ?? ""),
            trailing: TextButton(
              child: Text(
                users[index].url ?? "",
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      decoration: TextDecoration.underline,
                    ),
              ),
              onPressed: () {
                launchUrl(Uri.parse("https:///www.belek.edu.tr"));
              },
            ),
          ),
        );
      },
    );
  }
}

class UserItems {
  //*dummy(örnek) yapıyoruz.
  late final List<User> users;
  UserItems() {
    users = [
      User("Merve", "Öğrenci", "belek.edu.tr"),
      User("veli", "öğretmen", "belek.edu.tr"),
      User("duygu", "Öğrenci", "belek.edu.tr"),
    ];
  }
}

//TODO: DEĞİŞKEN YÖNETİMİ DAHA KOLAY OLACAK
abstract class LoadingStatefull<T extends StatefulWidget> extends State<T> {
  //*burada T generic kullanımı önemlidir!! Artık her sayfada kullanılabilir.
  bool isloading = false;

  void changeLoading() {
    setState(() {
      isloading = !isloading;
      print(T); //*hata olursa hangi class kullandı onu belirleriz.
    });
  }
}
