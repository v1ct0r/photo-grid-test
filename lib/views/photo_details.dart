import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:unsplash/models/photo.dart';

class PhotoDetails extends StatelessWidget {
  final Photo photo;

  PhotoDetails({
    this.photo,
  });

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: PhotoView(
        heroAttributes: PhotoViewHeroAttributes(
          tag: 'hero-tag-${photo.id}',
        ),
        imageProvider: FadeInImage.memoryNetwork(
          placeholder: kTransparentImage,
          image: photo.thumbUrl,
          fit: BoxFit.cover,
        ).image,
      ),
    );
  }

}