import 'package:flutter/material.dart';
import 'package:unsplash/route_paths.dart';
import 'package:unsplash/views/photo_details.dart';

class Router {

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    Widget view;
    switch (settings.name) {
      case RoutePaths.details:
        view = PhotoDetails(photo: settings.arguments);
        break;
    }
    return MaterialPageRoute(
        builder: (context) => view,
    );
  }
}