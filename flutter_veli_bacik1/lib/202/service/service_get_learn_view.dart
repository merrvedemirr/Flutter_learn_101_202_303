import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_veli_bacik1/202/service/comments_learn_view.dart';
import 'package:flutter_veli_bacik1/202/service/post_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter_veli_bacik1/202/service/post_service.dart';

class ServiceLearn extends StatefulWidget {
  const ServiceLearn({super.key});

  @override
  State<ServiceLearn> createState() => _ServiceLearnState();
}

class _ServiceLearnState extends State<ServiceLearn> {
  List<PostModel>? _items;
  bool _isLoading = false;
  late final Dio _dio; //late+final değerini bir kere sonra alacak.
  final _baseUrl = "https://jsonplaceholder.typicode.com/";

  @override
  void initState() {
    super.initState();
    _dio = Dio(BaseOptions(
        baseUrl: _baseUrl)); //! Burada BaseOptions ve baseUrl değerleri önemli. Tüm requestlerde path ortak.
    FetchPostItemsAdvance(); //*call ediyoruz.
  }

  void _changeLoading(bool value) {
    setState(() {
      _isLoading = value;
    });
  }

//ilk önce void fun yazdık sonra await ekleyince otomatik future oldu.
  Future<void> FetchPostItems() async {
    _changeLoading(true);

    //todo: Geriye Asenkron bir cevap döner. Await kullandık çünkü veriyi çekmesini beklememiz lazım!!
    final response = await Dio().get("https://jsonplaceholder.typicode.com/posts");

    if (response.statusCode == HttpStatus.ok) //gelen mesaj ok ise yani veri alınmışsa
    {
      final _datas = response.data;

      if (_datas is List) //*list olduğunu doğrularız.
      {
        setState(() {
          //*Map'lemek yani başka bir liste oluşturmak gibi düşün
          _items = _datas.map((e) => PostModel.fromJson(e)).toList();
        });
      }
    }
    _changeLoading(false);
  }

//*HER REQUEST İÇİN DİO OLUŞTURMAMAM LAZIM ONUN YERİNE TEK BİR KULLANIM YAPISI OLUŞTURMALIYIZ.
  Future<void> FetchPostItemsAdvance() async {
    _changeLoading(true);

    //todo: Geriye Asenkron bir cevap döner. Await kullandık çünkü veriyi çekmesini beklememiz lazım!!
    _items = await PostService().FetchPostItemsAdvance();
    _changeLoading(false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [_isLoading ? const CircularProgressIndicator.adaptive() : const SizedBox.shrink()],
      ),
      body: _items == null
          ? const Placeholder()
          : ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              itemCount: _items?.length ?? 0,
              itemBuilder: (context, index) {
                return _PostCard(
                  model: _items?[index], //index ListView'in özelliğidir. Sayfa ilerledikçe index değeri de değişir
                );
              },
            ),
    );
  }
}

class _PostCard extends StatelessWidget {
  const _PostCard({
    super.key,
    required PostModel? model,
  }) : _model = model;

  final PostModel? _model;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 20),
      child: ListTile(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => CommentsLearnView(postId: _model?.id)));
        },
        title: Text(
          _model?.title ?? "",
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(_model?.body ?? ""),
      ),
    );
  }
}
