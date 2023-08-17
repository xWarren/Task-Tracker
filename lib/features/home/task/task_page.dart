import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/resources/assets.dart';
import '_components/task_body.dart';
import 'task_controller.dart';

class TaskPage extends GetView<TaskController> {
  const TaskPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: GestureDetector(
            onTap: () {
              Get.back();
            },
            child: Image.asset(Assets.exit)),
      ),
      body: const TaskBody(),
    );
  }
}
