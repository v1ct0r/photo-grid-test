import 'package:flutter/material.dart';
import 'package:synchronized/synchronized.dart';
import 'package:unsplash/models/photo.dart';
import 'package:unsplash/services/api.dart';

class PhotosModel extends ChangeNotifier {
  Api api;

  List<Photo> _photos = <Photo>[];
  int photoLength;
  int perPage;

  bool loading = true;

  final lock = new Lock();

  Photo getPhoto(int index) {
    if (index < _photos.length) {
      return _photos[index];
    } else {
      requestNextPage();
      return null;
    }
  }

  Future fetchPage({int page = 1}) async {
    loading = true;
    if (page == 1) {
      notifyListeners();
    }

    final photoPage = await api.getPhotos(page: page);
    photoPage.items.forEach((item) => item.pageIndex = page);
    _photos.addAll(photoPage.items);
    photoLength = photoPage.totalCount;
    perPage = photoPage.perPage;

    loading = false;
    notifyListeners();
  }

  void requestNextPage() {
    if (!lock.locked) {
      lock.synchronized(() => fetchPage(page: _photos.length ~/ perPage + 1)) ;
    }
  }

}