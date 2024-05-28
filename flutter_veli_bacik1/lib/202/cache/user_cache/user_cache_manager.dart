import 'dart:convert';
import 'package:flutter_veli_bacik1/202/cache/shared_manager.dart';
import 'package:flutter_veli_bacik1/202/cache/user_model.dart';

//!BURADA LİSTE OLARAK CACHE MANAGEMENT VAR

class UserCacheManager {
  final SharedManager sharedManager;

  UserCacheManager(this.sharedManager);

  Future<void> saveItems(List<User> items) async {
    //todo: items değeri List<Users> ama bizden List<String> isteniyor.O yüzden listeyi dönüştürüyoruz.
    final _items = items.map((element) => jsonEncode(element.toJson())).toList();
    await sharedManager.saveStringItems(SharedKeys.users, _items);
  }

  List<User>? getItems() {
    final itemString = sharedManager.getStringList(SharedKeys.users);
    //todo: Bize List<String> döndü ama List<User> gerekli yani tersine döndürüyoruz.

    print(SharedKeys.users);
    if (itemString?.isNotEmpty ?? false) {
      //*burada element listedeki tüm elemanları döner.
      return itemString!.map((element) {
        final json = jsonDecode(element); //burada json MAP olarak geliyor.
        if (json is Map<String, dynamic>) {
          return User.fromJson(json); //*Mapleri değişkene atan o fonskiyonu da çağırıp dönüştürme işlemi tamamlanır.
        }
        return User("", "", "");
      }).toList();
    }
    return null; //hata olursa null
  }
}


//!EK BİLGİ: JSON DECODE = OBJE VERİR, JSON ENCODE = STRİNG VERİR.
