import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/data/models/task_model.dart';
import '../../core/resources/assets.dart';
import '../../core/resources/colors.dart' as colors;

class TaskDetailPage extends StatelessWidget {
  final dynamic controller;
  final TaskModel taskModel;
  final int index;
  const TaskDetailPage(
      {required this.controller,
      required this.taskModel,
      required this.index,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          _buildSliverAppBar(),
          _buildSliverToBoxAdapter(),
        ],
      ),
      bottomSheet: _buildBottomSheet(),
    );
  }

  Widget _buildBottomSheet() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      child: Row(
        children: [
          Expanded(
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
          ),
          const SizedBox(width: 10),
          Expanded(
            child: SizedBox(
              width: Get.width,
              height: 50,
              child: ElevatedButton(
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
                              Expanded(
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
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              side: const BorderSide(
                                                  color: colors.pendingColor))),
                                      child: const Text(
                                        "Cancel",
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w500,
                                            color: colors.pendingColor),
                                      )),
                                ),
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                child: SizedBox(
                                  width: Get.width,
                                  height: 40,
                                  child: ElevatedButton(
                                      onPressed: () {
                                        controller.taskController.delete(
                                            controller.taskController
                                                .taskList[index]);
                                        controller.taskController.getTasks();
                                      },
                                      style: ElevatedButton.styleFrom(
                                          backgroundColor: colors.lightColor,
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              side: const BorderSide(
                                                  color: colors.cancelColor))),
                                      child: const Text(
                                        "Yes, Remove",
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w500,
                                            color: colors.pendingColor),
                                      )),
                                ),
                              )
                            ],
                          ),
                        ),
                        radius: 20);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: colors.cancelColor,
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                  ),
                  child: const Text(
                    "Delete Task",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                      color: colors.lightColor,
                    ),
                  )),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSliverToBoxAdapter() {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            _buildTitle(),
            const SizedBox(height: 30),
            Row(
              children: [
                _buildCalendarIcon(),
                const SizedBox(width: 10),
                _buildDateColumn(),
              ],
            ),
            const SizedBox(height: 40),
            _buildDescriptionText(),
            const SizedBox(height: 20),
            _buildNotes(),
          ],
        ),
      ),
    );
  }

  Widget _buildTitle() {
    return Center(
      child: Text(
        taskModel.title.toString(),
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: colors.pendingColor,
        ),
      ),
    );
  }

  Widget _buildCalendarIcon() {
    return Container(
      height: 40,
      width: 40,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: colors.lightColor,
          boxShadow: const [BoxShadow(blurRadius: 3.0, color: Colors.black)]),
      child: const Icon(
        Icons.calendar_month,
        color: colors.tertiaryColor,
      ),
    );
  }

  Widget _buildDateColumn() {
    return Expanded(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [_buildDateText(), _buildDate()],
    ));
  }

  Widget _buildDateText() {
    return const Text(
      "Date",
      style: TextStyle(
        fontSize: 13,
        fontWeight: FontWeight.w500,
        color: colors.secondaryColor,
      ),
    );
  }

  Widget _buildDate() {
    return Text(
      taskModel.date.toString().isNotEmpty
          ? taskModel.date.toString()
          : "No set a date",
      style: const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: colors.pendingColor,
      ),
    );
  }

  Widget _buildDescriptionText() {
    return const Text(
      "Description",
      style: TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.w700,
        color: colors.pendingColor,
      ),
    );
  }

  Widget _buildNotes() {
    return Text(
      taskModel.note.toString(),
      style: const TextStyle(
        fontSize: 15,
        color: colors.secondaryColor,
      ),
    );
  }

  Widget _buildSliverAppBar() {
    return SliverAppBar(
      expandedHeight: 50.0,
      pinned: true,
      backgroundColor: colors.lightColor,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        title: _buildTitleText(),
      ),
      leading: _buildLeading(),
    );
  }

  Widget _buildTitleText() {
    return const Text(
      "Task Detail",
      style: TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.w500,
        color: colors.secondaryColor,
      ),
    );
  }

  Widget _buildLeading() {
    return GestureDetector(
        onTap: () {
          Get.back();
        },
        child: Image.asset(Assets.exit));
  }
}
