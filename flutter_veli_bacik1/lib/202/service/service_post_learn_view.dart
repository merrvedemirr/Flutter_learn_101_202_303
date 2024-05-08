import 'dart:io';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter_veli_bacik1/202/service/post_model.dart';

class ServicePostLearn extends StatefulWidget {
  const ServicePostLearn({super.key});

  @override
  State<ServicePostLearn> createState() => _ServiceLearnState();
}

class _ServiceLearnState extends State<ServicePostLearn> {
  String? name;
  bool _isLoading = false;
  late final Dio _dio; //late+final değerini bir kere sonra alacak.
  final _baseUrl = "https://jsonplaceholder.typicode.com/";

  TextEditingController _titleController = TextEditingController();
  TextEditingController _bodyController = TextEditingController();
  TextEditingController _userIdController = TextEditingController();
  @override
  void initState() {
    super.initState();
    _dio = Dio(BaseOptions(
        baseUrl: _baseUrl)); //! Burada BaseOptions ve baseUrl değerleri önemli. Tüm requestlerde path ortak.
  }

  void _changeLoading(bool value) {
    setState(() {
      _isLoading = value;
    });
  }

  Future<void> _addItemtoService(PostModel postModel) async {
    _changeLoading(true);
    //todo: Burada Post modelinden farklı olarak data(body) kısmı var.
    final response = await _dio.post("posts", data: postModel);

    if (response.statusCode == HttpStatus.created) {
      name = "Basarili";
    }
    _changeLoading(false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(name ?? ""),
        actions: [_isLoading ? CircularProgressIndicator.adaptive() : SizedBox.shrink()],
      ),
      body: Column(
        children: [
          TextField(
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.text,
            controller: _titleController,
            decoration: InputDecoration(labelText: "Title"),
          ),
          TextField(
            textInputAction: TextInputAction.next,
            controller: _bodyController,
            decoration: InputDecoration(labelText: "Body"),
          ),
          TextField(
            textInputAction: TextInputAction.done,
            controller: _userIdController,
            keyboardType: TextInputType.number,
            autofillHints: [AutofillHints.creditCardNumber],
            decoration: InputDecoration(labelText: "userId"),
          ),
          TextButton(
              //*veriler gidene kadar loading kısmı gözükecek.
              onPressed: _isLoading
                  ? null
                  : () {
                      if (_titleController.text.isNotEmpty &&
                          _bodyController.text.isNotEmpty &&
                          _userIdController.text.isNotEmpty) {
                        final model = PostModel(
                            body: _bodyController.text,
                            title: _titleController.text,
                            userId: int.tryParse(_userIdController.text));

                        _addItemtoService(model);
                      }
                    },
              child: const Text("Send")),
        ],
      ),
    );
  }
}
