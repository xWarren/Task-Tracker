import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../core/data/models/task_model.dart';
import '../../../core/resources/assets.dart';
import '../../../core/resources/custom_picker.dart';
import '../../../core/resources/colors.dart' as colors;
import '../../../core/resources/strings.dart' as strings;
import '../../../core/resources/text_style.dart';
import '../../task_detail/task_detail_page.dart';

class HomeBody extends StatelessWidget {
  final dynamic controller;
  const HomeBody({required this.controller, super.key});

  @override
  Widget build(BuildContext context) {
    final taskList = controller.taskController.taskList;

    return Obx(
      () => Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            taskList.isNotEmpty
                ? _buildGotTaskCondition()
                : const SizedBox.shrink(),
            _buildDatePicker(),
            const SizedBox(height: 20),
            _buildToDoText(),
            const SizedBox(height: 5),
            taskList.isNotEmpty ? _buildToDoList(taskList) : _buildNoTask(),
            const SizedBox(height: 10),
            _buildCompletedTaskText(),
            const SizedBox(height: 5),
            taskList.isNotEmpty
                ? _buildCompletedTaskList(taskList)
                : _buildNoCompletedTask()
          ],
        ),
      ),
    );
  }

  Widget _buildGotTaskCondition() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          _buildGot(),
          _buildTaskListLength(),
          _buildTaskCondition(),
        ],
      ),
    );
  }

  Widget _buildGot() {
    return Text(
      strings.homeYouGot,
      style: CustomStyle.homeYouGotStyle,
    );
  }

  Widget _buildTaskListLength() {
    return Text(
      "${controller.taskController.taskList.length}",
      style: CustomStyle.homeTaskListStyle,
    );
  }

  Widget _buildTaskCondition() {
    return Text(
      // ignore: unrelated_type_equality_checks
      controller.taskController.taskList.length == 1
          ? strings.homeTask
          : strings.homeTasks,
      style: CustomStyle.homeYouGotStyle,
    );
  }

  Widget _buildDatePicker() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: DatePicker(
        DateTime.now(),
        initialSelectedDate: DateTime.now(),
        selectionColor: colors.pendingColor,
        selectedTextColor: Colors.white,
        dateTextStyle: const TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w700,
          color: colors.primaryColor,
        ),
        dayTextStyle: const TextStyle(
          fontSize: 10,
          fontWeight: FontWeight.w500,
          color: colors.primaryColor,
        ),
        onDateChange: (selectedDate) {
          controller.taskController.selectedDate = selectedDate;
        },
      ),
    );
  }

  Widget _buildToDoText() {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Text(
          strings.homeToDo,
          style: CustomStyle.homeToDoStyle,
        ));
  }

  Widget _buildToDoList(taskList) {
    return Expanded(
      child: ListView.builder(
          itemCount: taskList.length,
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: 10),
          physics: const BouncingScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (context, index) {
            var task = taskList[index];
            // ignore: avoid_print
            print(task.toJson());
            if (task.repeat == 'Daily') {
              return _buildTaskModel(index, task);
            }
            if (task.date ==
                DateFormat('MMMM d, yyyy')
                    .format(controller.taskController.selectedDate)
                    .toString()) {}
            return _buildTaskModel(index, task);
          }),
    );
  }

  Widget _buildNoTask() {
    return Center(
      child: Column(
        children: [
          _buildImage(),
          _buildTaskText(),
          const SizedBox(height: 5),
          _buildNoPendingTask()
        ],
      ),
    );
  }

  Widget _buildNoPendingTask() {
    return Text(
      strings.homeNoPendingTask,
      style: CustomStyle.homeNoPendingTaskStyle,
    );
  }

  Widget _buildTaskText() {
    return Text(
      strings.homeNoTask,
      style: CustomStyle.homeNoTaskStyle,
    );
  }

  Widget _buildImage() {
    return Image.asset(
      Assets.noTask,
      height: 150,
      width: 150,
      fit: BoxFit.cover,
    );
  }

  Widget _buildCompletedTaskText() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Text(
        strings.homeCompleteTask,
        style: CustomStyle.homeToDoStyle,
      ),
    );
  }

  Widget _buildCompletedTaskList(taskList) {
    return Expanded(
      child: ListView.builder(
          itemCount: taskList.length,
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: 10),
          physics: const BouncingScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (context, index) {
            var task = taskList[index];
            // ignore: avoid_print
            print(controller.taskController.taskList.length);

            return task.isCompleted == 1
                ? _buildTaskModel2(index, task)
                : const SizedBox.shrink();
          }),
    );
  }

  Widget _buildNoCompletedTask() {
    return Expanded(
        child: Center(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Text(
        strings.homeNoCompletedTask,
        style: CustomStyle.homeNoTaskStyle,
      )
    ])));
  }

  Widget _buildTaskModel2(int index, TaskModel task) {
    return AnimationConfiguration.staggeredList(
        position: index,
        child: SlideAnimation(
          curve: Curves.easeOut,
          horizontalOffset: 5.0,
          child: FadeInAnimation(
            curve: Curves.easeOut,
            duration: const Duration(milliseconds: 300),
            child: GestureDetector(
              onTap: () {
                _buildDefaultDialog(index);
              },
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                width: Get.width,
                margin: const EdgeInsets.only(bottom: 20),
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: controller.getBGColor(task.color ?? index),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 1,
                        blurRadius: 7,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      Expanded(
                          child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            task.title.toString(),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: CustomStyle.homeToDoStyle,
                          ),
                          const SizedBox(height: 10),
                          Expanded(
                            child: Text(
                              task.note.toString(),
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                              style: CustomStyle.homeNoteStyle,
                            ),
                          ),
                        ],
                      )),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                        height: 30,
                        color: Colors.grey[200],
                      ),
                      RotatedBox(
                        quarterTurns: 3,
                        child: Text(
                          task.isCompleted == 1
                              ? strings.homeCompleted
                              : strings.homeTodo,
                          style: CustomStyle.homeCompletedStyle,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ));
  }

  Future<dynamic> _buildDefaultDialog(int index) {
    return Get.defaultDialog(
        title: strings.homeDeleteTask,
        backgroundColor: colors.lightColor,
        titleStyle: CustomStyle.homeDeleteStyle,
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
                              borderRadius: BorderRadius.circular(10),
                              side: const BorderSide(
                                  color: colors.pendingColor))),
                      child: Text(
                        strings.homeCancel,
                        style: CustomStyle.homeCancelStyle,
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
                        controller.taskController
                            .delete(controller.taskController.taskList[index]);
                        controller.taskController.getTasks();
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: colors.lightColor,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                              side:
                                  const BorderSide(color: colors.cancelColor))),
                      child: Text(
                        strings.homeRemove,
                        style: CustomStyle.homeCancelStyle,
                      )),
                ),
              )
            ],
          ),
        ),
        radius: 20);
  }

  Widget _buildTaskModel(int index, TaskModel task) {
    return AnimationConfiguration.staggeredList(
        position: index,
        child: SlideAnimation(
          curve: Curves.easeOut,
          horizontalOffset: 5.0,
          child: FadeInAnimation(
            curve: Curves.easeOut,
            duration: const Duration(milliseconds: 300),
            child: GestureDetector(
                onTap: () {
                  Get.to(TaskDetailPage(
                      controller: controller,
                      taskModel: controller.taskController.taskList[index],
                      index: index));
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  width: Get.width,
                  margin: const EdgeInsets.only(bottom: 20),
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: controller.getBGColor(task.color ?? index),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          spreadRadius: 1,
                          blurRadius: 7,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        Expanded(
                            child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              task.title.toString(),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: CustomStyle.homeToDoStyle,
                            ),
                            const SizedBox(height: 10),
                            Expanded(
                              child: Text(
                                task.note.toString(),
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                                style: CustomStyle.homeNoteStyle,
                              ),
                            ),
                          ],
                        )),
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 10),
                          height: 30,
                          color: Colors.grey[200],
                        ),
                        RotatedBox(
                          quarterTurns: 3,
                          child: Text(
                            task.isCompleted == 1
                                ? strings.homeCompleted
                                : strings.homeTodo,
                            style: CustomStyle.homeCompletedStyle,
                          ),
                        )
                      ],
                    ),
                  ),
                )),
          ),
        ));
  }
}
