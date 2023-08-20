import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:task_app/features/task_detail/task_detail_page.dart';

import '../../core/resources/assets.dart';
import '../../core/resources/colors.dart' as colors;
import '../../core/resources/custom_picker.dart';
import '_components/home_appbar.dart';
import 'home_controller.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: HomeAppBar(controller: controller),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  const Text(
                    "You've got ",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: colors.pendingColor,
                    ),
                  ),
                  Text(
                    controller.taskController.taskList.isEmpty
                        ? "0"
                        : "${controller.taskController.taskList.length}",
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: colors.tertiaryColor,
                    ),
                  ),
                  Text(
                    // ignore: unrelated_type_equality_checks
                    controller.taskController.taskList.length == 1
                        ? " task."
                        : " tasks.",
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: colors.pendingColor,
                    ),
                  ),
                ],
              ),
            ),
            Container(
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
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: controller.taskController.taskList.isNotEmpty
                  ? const Text(
                      "To do",
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                          color: colors.pendingColor),
                    )
                  : const SizedBox.shrink(),
            ),
            const SizedBox(height: 5),
            controller.taskController.taskList.isNotEmpty
                ? Expanded(
                    child: ListView.builder(
                        itemCount: controller.taskController.taskList.length,
                        scrollDirection: Axis.horizontal,
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        physics: const BouncingScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          var task = controller.taskController.taskList[index];
                          // ignore: avoid_print
                          print(controller.taskController.taskList.length);
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
                                            taskModel: controller.taskController
                                                .taskList[index]));
                                      },
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10),
                                        width: Get.width,
                                        margin:
                                            const EdgeInsets.only(bottom: 20),
                                        child: Container(
                                          padding: const EdgeInsets.all(16),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            color: _getBGColor(task.color ?? 0),
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.grey
                                                    .withOpacity(0.2),
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
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    task.title.toString(),
                                                    maxLines: 1,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: const TextStyle(
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      color:
                                                          colors.pendingColor,
                                                    ),
                                                  ),
                                                  const SizedBox(height: 10),
                                                  Expanded(
                                                    child: Text(
                                                      task.note.toString(),
                                                      maxLines: 2,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      style: const TextStyle(
                                                        fontSize: 12,
                                                        color: colors
                                                            .secondaryColor,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              )),
                                              Container(
                                                margin:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 10),
                                                height: 30,
                                                color: Colors.grey[200],
                                              ),
                                              RotatedBox(
                                                quarterTurns: 3,
                                                child: Text(
                                                  task.isCompleted == 1
                                                      ? "COMPLETED"
                                                      : "TODO",
                                                  style: const TextStyle(
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.bold,
                                                    color: colors.pendingColor,
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      )),
                                ),
                              ));
                        }),
                  )
                : Center(
                    child: Column(
                      children: [
                        Image.asset(
                          Assets.noTask,
                          height: 150,
                          width: 150,
                          fit: BoxFit.cover,
                        ),
                        const Text(
                          "No Task",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            color: colors.pendingColor,
                          ),
                        ),
                        const SizedBox(height: 5),
                        const Text(
                          "There is no pending task.",
                          style: TextStyle(
                            fontSize: 15,
                            color: colors.secondaryColor,
                          ),
                        )
                      ],
                    ),
                  ),
            const SizedBox(height: 10),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "Completed Task",
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    color: colors.pendingColor),
              ),
            ),
            const Expanded(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "No Completed Task.",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: colors.pendingColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _getBGColor(int no) {
    switch (no) {
      case 0:
        return colors.selection1;
      case 1:
        return colors.selection2;
      case 2:
        return colors.selection3;
      case 3:
        return colors.selection4;
      case 4:
        return colors.selection5;
      default:
        return colors.selection1;
    }
  }
}
