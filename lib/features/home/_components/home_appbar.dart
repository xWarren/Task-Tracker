import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/resources/colors.dart' as colors;
import '../../../core/resources/strings.dart' as strings;
import '../../../core/resources/text_style.dart';
import '../../../core/routes/routes.dart';

class HomeAppBar extends AppBar {
  HomeAppBar({
    required this.controller,
    Key? key,
  }) : super(
            key: key,
            elevation: 0,
            title: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Text(
                controller.greeting(),
                style: CustomStyle.homeGreetingStyle,
              ),
            ),
            actions: [
              Container(
                height: 40,
                alignment: Alignment.center,
                padding: const EdgeInsets.only(right: 20, top: 10),
                child: ElevatedButton(
                  onPressed: () async {
                    await Get.toNamed(Routes.task);
                    controller.taskController.getTasks();
                  },
                  style: ElevatedButton.styleFrom(
                      elevation: 3,
                      backgroundColor: colors.tertiaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      )),
                  child: Text(
                    strings.homeAddTask,
                    style: CustomStyle.homeAddTaskStyle,
                  ),
                ),
              ),
            ],
            bottom: const PreferredSize(
                preferredSize: Size.fromHeight(40), child: SizedBox.shrink()));

  final dynamic controller;
}
