//! Service yönetimi böyle olmalıdır!!

import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_veli_bacik1/202/service/comment_models.dart';
import 'package:flutter_veli_bacik1/202/service/post_model.dart';

//*Burada bir interface yaparak bu classa erişilmesini yönetiyoruz. (advance)
abstract class IPostService {
  Future<bool> _addItemtoService(PostModel postModel);
  Future<List<PostModel>?> FetchPostItemsAdvance();
  Future<bool> putItemtoService(PostModel postModel, int id);
  Future<bool> deleteItemtoService(int id);
  Future<List<CommentModel>?> fetchRelatedCommentWithPostId(int postId);
}

class PostService implements IPostService {
  //classı implemente ediyoruz.
  final Dio _dio;
  PostService() : _dio = Dio(BaseOptions(baseUrl: "https://jsonplaceholder.typicode.com/"));

  @override
  Future<bool> _addItemtoService(PostModel postModel) async {
    //todo: Burada Get modelinden farklı olarak data(body) kısmı var.
    try {
      final response = await _dio.post(_PostServicePaths.posts.name, data: postModel);

      return response.statusCode == HttpStatus.created;
    } on DioException catch (exception) {
      _ShowDebug.showDioException(exception, this);
    }
    return false;
  }

  @override
  Future<List<PostModel>?> FetchPostItemsAdvance() async {
    //todo: Geriye Asenkron bir cevap döner. Await kullandık çünkü veriyi çekmesini beklememiz lazım!!
    try {
      final response = await _dio.get(_PostServicePaths.posts.name);

      if (response.statusCode == HttpStatus.ok) //gelen mesaj ok ise yani veri alınmışsa
      {
        final _datas = response.data;

        if (_datas is List) //*list olduğunu doğrularız.
        {
          //*Map'lemek yani başka bir liste oluşturmak gibi düşün
          return _datas.map((e) => PostModel.fromJson(e)).toList();
        }
      }
    } on DioException catch (exception) {
      _ShowDebug.showDioException(exception, this);
    }
    return null;
  }

  @override
  Future<bool> putItemtoService(PostModel postModel, int id) async {
    //todo: Burada Get modelinden farklı olarak data(body) kısmı var.
    try {
      final response = await _dio.put("${_PostServicePaths.posts.name}/$id", data: postModel);

      return response.statusCode == HttpStatus.ok;
    } on DioException catch (exception) {
      _ShowDebug.showDioException(exception, this);
    }
    return false;
  }

  @override
  Future<bool> deleteItemtoService(int id) async {
    //todo: Burada Get modelinden farklı olarak data(body) kısmı var.
    try {
      final response = await _dio.delete("${_PostServicePaths.posts.name}/$id");

      return response.statusCode == HttpStatus.ok;
    } on DioException catch (exception) {
      _ShowDebug.showDioException(exception, this);
    }
    return false;
  }

  @override
  Future<List<CommentModel>?> fetchRelatedCommentWithPostId(int postId) async {
    try {
      final response =
          await _dio.get(_PostServicePaths.comments.name, queryParameters: {_PostQueryPaths.postId.name: postId});

      if (response.statusCode == HttpStatus.ok) //gelen mesaj ok ise yani veri alınmışsa
      {
        final _datas = response.data;

        if (_datas is List) //*list olduğunu doğrularız.
        {
          //*Map'lemek yani başka bir liste oluşturmak gibi düşün
          return _datas.map((e) => CommentModel.fromJson(e)).toList();
        }
      }
    } on DioException catch (exception) {
      _ShowDebug.showDioException(exception, this);
    }
    return null;
  }
}

enum _PostServicePaths { posts, comments } //bu path sonundaki veri.

enum _PostQueryPaths { postId }

//todo: Hata mesajlarını yazdırmak için de bu classı her yerde kullanabiliriz.
class _ShowDebug {
  //T = TRİC POİNT
  static void showDioException<T>(DioException exception, T type) {
    if (kDebugMode) {
      print(exception.message);
      print(type);
    }
  }
}
