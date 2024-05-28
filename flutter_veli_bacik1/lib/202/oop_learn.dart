import 'dart:io';
import 'package:flutter_veli_bacik1/202/custom_exception.dart';
import 'package:url_launcher/url_launcher.dart';
//TODO:  AMACIMIZ HER YÖNDEN TEST EDİLEBİLİR VE KULLANILIRLIK AÇISINDAN GENİŞ BİR YAPI KURMAK BU YÜZDEN BİR ARAYÜZ YAPSAK VE İŞLEMLERİ ÖZELLEŞTİRSEK?

abstract class IFileDownload {
  bool? downloadItem(FileItem? fileItem); //bu fonks. genişletilebilir. iskeleti oluşturuyoruz.

  Future<void> toShare(String path) async {
    //bu fonks içi dolu sadece kullanılabilir.
    await launchUrl(path as Uri);
  }
}

//todo: implements: Tüm özellikleri kullanmak, extends: İstediğimiz özellikleri kullanmak

class FileDownload extends IFileDownload with ShareMixin {
  @override
  bool? downloadItem(FileItem? fileItem) {
    if (fileItem == null) {
      throw FileDownloadException(); //fırlatmak için throw atılır.
    }
    print("işlem yapiliyor..");
    return true;
  }

  @override
  Future<void> toShare(String path) {
    throw UnimplementedError();
  }
}

class SMSDownload implements IFileDownload {
  //mixin kullanılmaz
  @override
  bool? downloadItem(FileItem? fileItem) {
    // TODO: implement downloadItem
    throw UnimplementedError();
  }

  @override
  Future<void> toShare(String path) {
    // TODO: implement toShare
    throw UnimplementedError();
  }
}

class MerveDownload extends IFileDownload with ShareMixin {
  @override
  bool? downloadItem(FileItem? fileItem) {
    // TODO: implement downloadItem
    throw UnimplementedError();
  }
}

//*Dosya modeli gibi düşünülebilir.
class FileItem {
  final String name;
  final File file;

  FileItem(this.name, this.file);
}

mixin ShareMixin on IFileDownload {
  void toFileShow() {}
}
