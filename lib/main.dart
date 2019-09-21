import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:unsplash/home_page.dart';
import 'package:unsplash/services/api.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider.value(value: Api(),),
      ],
      child: MaterialApp(
        title: 'Unsplash photos',
        theme: ThemeData(
          primarySwatch: Colors.deepPurple,
        ),
        home: HomePage(),
      ),
    );
  }
}