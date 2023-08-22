import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '_components/home_appbar.dart';
import '_components/home_body.dart';
import 'home_controller.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeAppBar(controller: controller),
      body: HomeBody(controller: controller),
    );
  }
}
