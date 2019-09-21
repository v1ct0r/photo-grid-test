import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:unsplash/viewmodels/photos_model.dart';
import 'package:unsplash/views/photo_tile.dart';

import 'services/api.dart';

class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Unsplash photos'),),
      body: MultiProvider(
        providers: [
          ChangeNotifierProxyProvider<Api, PhotosModel>(
            initialBuilder: (context) => PhotosModel(),
            builder: (_, api, photosModel) {
              photosModel..api = api;
              return photosModel;
            },
          ),
        ],
        child: new PhotoGrid(),
      ),
    );
  }
}

class PhotoGrid extends StatefulWidget {
  const PhotoGrid({
    Key key,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _PhotoGridState();
}

class _PhotoGridState extends State<PhotoGrid> {

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<PhotosModel>(context, listen: false).fetchPhotos();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<PhotosModel>(
      builder: (context, photoModel, _) {
        if (photoModel.loading) {
          return Center(child: CircularProgressIndicator(),);
        } else {
          return GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
            itemBuilder: (context, index) => PhotoTile(
              photo: photoModel.photos[index],
            ),
            itemCount: photoModel.photos.length,
          );
        }
      },
    );
  }
}
