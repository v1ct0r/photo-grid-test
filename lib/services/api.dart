import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:unsplash/models/photo.dart';
import 'package:unsplash/services/paged_data.dart';
import 'package:unsplash/services/unsplash_credentials.dart';

class Api {

  static const baseUrl = 'https://api.unsplash.com';

  UnsplashCredentials unsplashCredentials;

  Future<PagedData<Photo>> getPhotos({int page}) async {
    final response = await http.get('$baseUrl/photos?client_id=${unsplashCredentials.clientId}&page=${page}');
    final parsed = json.decode(response.body);
    PagedData<Photo> pagedData = PagedData(
        parsed.map<Photo>((item) => Photo.fromJson(item)).toList(),
        int.parse(response.headers['x-total']),
        int.parse(response.headers['x-per-page'])
    );
    return pagedData;
  }
}