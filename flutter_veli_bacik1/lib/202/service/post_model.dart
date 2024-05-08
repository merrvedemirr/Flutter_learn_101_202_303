//!BU CLASS GELEN VERİLER VEYA GİDEN VERİLER İÇİN MODELDİR.

class PostModel {
  int? userId;
  int? id;
  String? title;
  String? body;

  PostModel({this.userId, this.id, this.title, this.body});
  //!Buraya Kod yazılmaz.

  //*Servisten Gelen Verileri Alabilmek için kullanılıyor. (Get)
  PostModel.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    id = json['id'];
    title = json['title'];
    body = json['body'];
  }

  //!Buraya Kod yazılmaz.

  //*Servise Veri göndermek için kullanılır. (post)
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userId;
    data['id'] = this.id;
    data['title'] = this.title;
    data['body'] = this.body;
    return data;
  }
}
