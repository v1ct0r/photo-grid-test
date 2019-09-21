import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:unsplash/home_page.dart';
import 'package:unsplash/router.dart';
import 'package:unsplash/services/api.dart';
import 'package:unsplash/services/unsplash_credentials.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider.value(value: UnsplashCredentials(clientId: 'a0e50adae7dccf7ecf91ebc4ca86ad1799c5f1133d7a1a196e760a6c12b89c75')),
        ProxyProvider<UnsplashCredentials, Api>(
          initialBuilder: (_) => Api(),
          builder: (_, credentials, api) => api..unsplashCredentials = credentials,
        ),
      ],
      child: MaterialApp(
        title: 'Unsplash photos',
        theme: ThemeData(
          primarySwatch: Colors.deepPurple,
        ),
        home: HomePage(),
        onGenerateRoute: Router.onGenerateRoute,
      ),
    );
  }
}