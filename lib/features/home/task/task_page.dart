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
        automaticallyImplyLeading: false,
        elevation: 0,
        leading: GestureDetector(
            onTap: () {
              controller.getBack();
            },
            child: Image.asset(Assets.exit)),
      ),
      body: const TaskBody(),
    );
  }
}
