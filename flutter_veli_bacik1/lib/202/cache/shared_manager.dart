import 'package:flutter_veli_bacik1/202/cache/shared_not_initialize.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum SharedKeys { counter, users } //todo: Key yönetimi için yaptık. kafasına göre key atmamak için

class SharedManager {
  SharedPreferences? preferences;

  SharedManager();

  void _checkPreferences() {
    //*preferences kontrolü
    if (preferences == null) {
      throw SharedNotInitiazleException();
    }
  }

  Future<void> init() async {
    preferences = await SharedPreferences.getInstance();
  }

  Future<void> saveString(SharedKeys key, String value) async {
    _checkPreferences();
    await preferences?.setString(key.name, value);
  }

  String? getString(SharedKeys key) {
    _checkPreferences();
    return preferences?.getString(key.name);
  }

  Future<bool> removeItem(SharedKeys key) async {
    _checkPreferences();
    return (await preferences?.remove(key.name)) ?? false;
  }

  /***** */

  Future<void> saveStringItems(SharedKeys key, List<String> value) async {
    _checkPreferences();
    await preferences?.setStringList(key.name, value);
  }

  List<String>? getStringList(SharedKeys key) {
    _checkPreferences();
    print(preferences?.getStringList(key.name));
    return preferences?.getStringList(key.name);
  }
}
