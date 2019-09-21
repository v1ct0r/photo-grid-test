import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:unsplash/models/photo.dart';
import 'package:unsplash/route_paths.dart';

class PhotoTile extends StatelessWidget {
  final Photo photo;

  PhotoTile({
    this.photo,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(children: <Widget>[
      AspectRatio(
        aspectRatio: 1.0,
        child: GridTile(
          child: Hero(
            tag: 'hero-tag-${photo.id}',
            child: FadeInImage.memoryNetwork(
              placeholder: kTransparentImage,
              image: photo.thumbUrl,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
      Positioned.fill(
        child: new Material(
          color: Colors.transparent,
          child: new InkWell(
            onTap: () => Navigator.of(context)
                .pushNamed(RoutePaths.details, arguments: photo)),
        )
      ),
    ]);
  }
}
