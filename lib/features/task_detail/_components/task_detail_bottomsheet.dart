import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/data/models/task_model.dart';
import '../../../core/resources/colors.dart' as colors;

class TaskDetailBottomSheet extends StatelessWidget {
  final dynamic controller;
  final TaskModel taskModel;
  final int index;
  const TaskDetailBottomSheet(
      {required this.controller,
      required this.taskModel,
      required this.index,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: Row(
          children: [
            _buildTaskCompletedButton(),
            const SizedBox(width: 10),
            _buildDeleteTaskButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildDeleteTaskButton() {
    return Expanded(
      child: SizedBox(
        width: Get.width,
        height: 50,
        child: _buildDefaultDialog(),
      ),
    );
  }

  Widget _buildDefaultDialog() {
    return ElevatedButton(
        onPressed: () {
          Get.defaultDialog(
              title: "Delete this task?",
              backgroundColor: colors.lightColor,
              titleStyle: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: colors.pendingColor,
              ),
              barrierDismissible: false,
              content: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    _buildCancelButton(),
                    const SizedBox(width: 10),
                    _buildRemoveButton()
                  ],
                ),
              ),
              radius: 20);
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: colors.cancelColor,
          elevation: 5,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        ),
        child: const Text(
          "Delete Task",
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w700,
            color: colors.lightColor,
          ),
        ));
  }

  Widget _buildCancelButton() {
    return Expanded(
      child: SizedBox(
        width: Get.width,
        height: 40,
        child: ElevatedButton(
            onPressed: () {
              Get.back();
            },
            style: ElevatedButton.styleFrom(
                backgroundColor: colors.lightColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: const BorderSide(color: colors.pendingColor))),
            child: const Text(
              "Cancel",
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: colors.pendingColor),
            )),
      ),
    );
  }

  Widget _buildRemoveButton() {
    return Expanded(
      child: SizedBox(
        width: Get.width,
        height: 40,
        child: ElevatedButton(
            onPressed: () {
              controller.taskController
                  .delete(controller.taskController.taskList[index]);
              controller.taskController.getTasks();
            },
            style: ElevatedButton.styleFrom(
                backgroundColor: colors.lightColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: const BorderSide(color: colors.cancelColor))),
            child: const Text(
              "Yes, Remove",
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w500,
                color: colors.pendingColor,
              ),
            )),
      ),
    );
  }

  Widget _buildTaskCompletedButton() {
    return Expanded(
      child: SizedBox(
        width: Get.width,
        height: 50,
        child: ElevatedButton(
            onPressed: () {
              controller.taskController.taskCompleted(taskModel.id!);
            },
            style: ElevatedButton.styleFrom(
                backgroundColor: colors.pendingColor,
                elevation: 5,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15))),
            child: const Text(
              "Task Completed",
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w700,
                color: colors.lightColor,
              ),
            )),
      ),
    );
  }
}
