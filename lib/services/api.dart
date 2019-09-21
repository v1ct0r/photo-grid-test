import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:unsplash/models/photo.dart';
import 'package:unsplash/services/unsplash_credentials.dart';

class Api {

  static const baseUrl = 'https://api.unsplash.com';

  UnsplashCredentials unsplashCredentials;

  Future<List<Photo>> getPhotos() async {
    final response = await http.get('$baseUrl/photos?client_id=${unsplashCredentials.clientId}');
    final parsed = json.decode(response.body);
    return parsed.map<Photo>((item) => Photo.fromJson(item)).toList();
  }
}