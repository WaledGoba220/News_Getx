import 'package:flutter/material.dart';
// ignore: implementation_imports, unnecessary_import
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:news_getx/controller/news_controller.dart';
import 'package:news_getx/view/bottom_nav_bar/science.dart';
import 'package:news_getx/view/bottom_nav_bar/sports.dart';

import 'bottom_nav_bar/health.dart';

// ignore: use_key_in_widget_constructors
class HomeView extends GetWidget {
  @override
  Widget build(BuildContext context) {
    List<Widget> screens = [
      Sports(),
      Science(),
      Health(),
    ];
    NewsController controller = Get.put(NewsController());
    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Colors.red,
          currentIndex: controller.currentIndex.value,
          onTap: (val) {
            controller.currentIndex.value = val;
          },
          items: const [
            BottomNavigationBarItem(label: "Sports", icon: Icon(Icons.sports)),
            BottomNavigationBarItem(
                label: "Science", icon: Icon(Icons.science)),
            BottomNavigationBarItem(
                label: "health", icon: Icon(Icons.health_and_safety)),
          ],
        ),
        body: GetX<NewsController>(
            builder: (controller) => screens[controller.currentIndex.value]));
  }
}
