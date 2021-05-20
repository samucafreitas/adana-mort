import 'package:alicespt/app/modules/home/home_controller.dart';
import 'package:alicespt/resources/values/ui_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Home Page'),
        ),
        body: Container(
          child: FloatingActionButton(
            onPressed: () => Get.toNamed(UIRoutes.CURRENT_AUCTIONS),
            child: Text("Tibia Auctions"),
          ),
        ));
  }
}
