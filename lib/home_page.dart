import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:unsplash/helpers/media_query_helper.dart';
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
          ProxyProvider<Api, MediaQueryHelper>(
            initialBuilder: (context) => MediaQueryHelper(),
            builder: (context, _, mediaQueryHelper) => MediaQueryHelper()..width = MediaQuery.of(context).size.width,
            updateShouldNotify: (previous, current) {
              // notify only when screen width changes
              return current.isSmallScreen != previous.isSmallScreen;
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
    return Consumer2<PhotosModel, MediaQueryHelper>(
      builder: (context, photoModel, layoutDetector, _) {
        if (photoModel.loading) {
          return Center(child: CircularProgressIndicator(),);
        } else {
          return Container(
            padding: EdgeInsets.symmetric(horizontal: layoutDetector.isSmallScreen ? 0 : 30),
            color: Colors.black12,
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(maxCrossAxisExtent: 200),
              itemBuilder: (context, index) => PhotoTile(
                photo: photoModel.photos[index],
              ),
              itemCount: photoModel.photos.length,
            ),
          );
        }
      },
    );
  }
}
