import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_getx/view/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowMaterialGrid: false,
      debugShowCheckedModeBanner: false,
      title: 'News',
      home: HomeView(),
    );
  }
}
