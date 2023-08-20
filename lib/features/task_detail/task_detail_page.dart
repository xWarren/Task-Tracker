import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/data/models/task_model.dart';
import '../../core/resources/assets.dart';
import '../../core/resources/colors.dart' as colors;

class TaskDetailPage extends StatelessWidget {
  final dynamic controller;
  final TaskModel taskModel;
  const TaskDetailPage(
      {required this.controller, required this.taskModel, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 50.0,
            pinned: true,
            backgroundColor: colors.lightColor,
            flexibleSpace: const FlexibleSpaceBar(
              centerTitle: true,
              title: Text(
                "Task Detail",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: colors.secondaryColor,
                ),
              ),
            ),
            leading: GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: Image.asset(Assets.exit)),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  Text(
                    taskModel.title.toString(),
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: colors.pendingColor,
                    ),
                  ),
                  const SizedBox(height: 30),
                  Row(
                    children: [
                      Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: colors.lightColor,
                            boxShadow: const [
                              BoxShadow(blurRadius: 3.0, color: Colors.black)
                            ]),
                        child: const Icon(
                          Icons.calendar_month,
                          color: colors.tertiaryColor,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                          child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Deadline",
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              color: colors.secondaryColor,
                            ),
                          ),
                          Text(
                            taskModel.date.toString(),
                            style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              color: colors.pendingColor,
                            ),
                          )
                        ],
                      )),
                      Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: colors.lightColor,
                            boxShadow: const [
                              BoxShadow(blurRadius: 3.0, color: Colors.black)
                            ]),
                        child: const Icon(
                          Icons.access_alarm_rounded,
                          color: colors.tertiaryColor,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                          child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Time",
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              color: colors.secondaryColor,
                            ),
                          ),
                          Text(
                            "${taskModel.startTime.toString()} - ${taskModel.endTime.toString()}",
                            style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              color: colors.pendingColor,
                            ),
                          )
                        ],
                      )),
                    ],
                  ),
                  const SizedBox(height: 40),
                  const Text(
                    "Description",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                      color: colors.pendingColor,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    taskModel.note.toString(),
                    style: const TextStyle(
                      fontSize: 14,
                      color: colors.secondaryColor,
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
