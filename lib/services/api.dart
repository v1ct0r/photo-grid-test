import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:unsplash/models/photo.dart';

class Api {

  static const baseUrl = 'https://api.unsplash.com';
  static const clientId = '<< put your clientId here>>';

  Future<List<Photo>> getPhotos() async {
    final response = await http.get('$baseUrl/photos?client_id=$clientId');
    final parsed = json.decode(response.body);
    return parsed.map<Photo>((item) => Photo.fromJson(item)).toList();
  }
}