import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:unsplash/models/photo.dart';

class PhotoTile extends StatelessWidget {
  final Photo photo;

  PhotoTile({
    this.photo,
  });
  @override
  Widget build(BuildContext context) {
    return GridTile(
      child: FadeInImage.memoryNetwork(
        placeholder: kTransparentImage,
        image: photo.thumbUrl,
        fit: BoxFit.cover,
      ),
    );
  }

}