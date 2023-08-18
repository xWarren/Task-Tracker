import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/resources/colors.dart' as colors;
import '../../../core/routes/routes.dart';

class HomeAppBar extends AppBar {
  HomeAppBar({
    required this.controller,
    Key? key,
  }) : super(
            key: key,
            elevation: 0,
            title: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 5),
              child: Text(
                "Good Morning",
                style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                    color: colors.secondaryColor),
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
                  child: const Text(
                    "+ Add Task",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: colors.lightColor,
                    ),
                  ),
                ),
              ),
            ],
            bottom: const PreferredSize(
                preferredSize: Size.fromHeight(40), child: SizedBox.shrink()));

  final dynamic controller;
}
