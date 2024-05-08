//todo: Birden Fazla Initizalition yöntemi var

class PostModel1 {
  //* herhangi bir json dosyasından bakarak yapıyoruz bu değerleri.
  int? userId;
  int? id;
  String? title;
  String? body;
  //?Nullable olabilir
}

class PostModel2 {
  //* herhangi bir json dosyasından bakarak yapıyoruz bu değerleri.
  int userId;
  int id;
  String title;
  String body;
  //?Constructor ile
  PostModel2(this.userId, this.id, this.title, this.body);
}

class PostModel3 {
  //* herhangi bir json dosyasından bakarak yapıyoruz bu değerleri.
  final int userId;
  final int id;
  final String title;
  final String body;

  //?Constructor + final ile = Constructordan değerini alır sonra bir daha değişmez.
  PostModel3(this.userId, this.id, this.title, this.body);
}

class PostModel4 {
  //* herhangi bir json dosyasından bakarak yapıyoruz bu değerleri.
  final int userId;
  final int id;
  final String title;
  final String body;

  //?Name ile yazarak
  PostModel4({required this.userId, required this.id, required this.title, required this.body});
}

class PostModel5 {
  //* herhangi bir json dosyasından bakarak yapıyoruz bu değerleri.
  final int _userId;
  final int _id;
  final String _title;
  final String _body;

  int get userId => _userId; //*Dışarıdan sadece bu elemana erişilebilir. değeri değişmez!!

  PostModel5({
    required int userId,
    required int id,
    required String title,
    required String body,
  })  : _userId = userId,
        _id = id,
        _title = title,
        _body = body;
}

class PostModel6 {
  //* herhangi bir json dosyasından bakarak yapıyoruz bu değerleri.
  late final int _userId;
  late final int _id;
  late final String _title;
  late final String _body;

  PostModel6({
    required int userId,
    required int id,
    required String title,
    required String body,
  }) {
    _userId = userId;
    _id = id;
    _body = body;
    _title = title;
  }
}

class PostModel7 {
  //* herhangi bir json dosyasından bakarak yapıyoruz bu değerleri.
  late final int _userId;
  late final int _id;
  late final String _title;
  late final String _body;

  PostModel7({
    int userId = 0,
    int id = 0,
    String title = "",
    String body = "",
  }) {
    _userId = userId;
    _id = id;
    _body = body;
    _title = title;
  }
}

//!EN DOĞRU MODELDİR. DIŞARIDAN SERVİS İLE DATA ALDIĞIMIZ DA BÖYLE YAPMALIYIZ. (HER ZAMAN DEĞİL!)
class PostModel8 {
  //* herhangi bir json dosyasından bakarak yapıyoruz bu değerleri.
  final int? userId;
  final int? id;
  final String? title;
  String? body;

  PostModel8({this.userId, this.id, this.title, this.body}); //constructor.

  void updateBody(String? data) {
    if (data != null && data.isNotEmpty) {
      //boş olma kötrolü de yapamlıyız.
      body = data;
    }
  }

  PostModel8 copyWith({
    //* herhangi bir json dosyasından bakarak yapıyoruz bu değerleri.
    final int? userId,
    final int? id,
    final String? title,
    final String? body,
  }) {
    return PostModel8(
      userId: userId ?? this.userId,
      id: id ?? this.id,
      title: title ?? this.title,
      body: body ?? this.body,
    );
  }
}
