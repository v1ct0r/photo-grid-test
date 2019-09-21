import 'package:flutter/material.dart';
import 'package:unsplash/models/photo.dart';
import 'package:unsplash/services/api.dart';

class PhotosModel extends ChangeNotifier {
  Api api;

  List<Photo> photos;
  bool loading = false;

  Future fetchPhotos() async {
    loading = true;
    notifyListeners();

    photos = await api.getPhotos();

    loading = false;
    notifyListeners();
  }
}