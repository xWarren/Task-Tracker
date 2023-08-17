import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:task_app/core/data/models/task_model.dart';
import 'package:task_app/core/resources/colors.dart';

class TaskController extends GetxController {
  RxInt length = 150.obs;

  var date = "December 19, 2023";
  String startTime = DateFormat("hh:mm a").format(DateTime.now()).toString();
  var endTime = "10:30 PM";

  int textLength = 0;
  RxInt selectedColor = 0.obs;

  final key = GlobalKey<FormState>();
  TextEditingController titleController = TextEditingController();
  TextEditingController noteController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController startTimeController = TextEditingController();
  TextEditingController endTimeController = TextEditingController();
  TextEditingController repeatController = TextEditingController();

  DateTime selectedDate = DateTime.now();
  RxInt remindDefault = 5.obs;
  var repeatDefault = "None";

  List<int> remind = [
    5,
    10,
    15,
    20,
  ];
  List<String> repeat = [
    "None",
    "Daily",
    "Weekly",
    "Monthly",
  ];

  @override
  void onReady() {
    super.onReady();
  }

  // Future<void> addTask({TaskModel? task}) {
  //   return null;
  // }

  void validateTitle() {
    if (titleController.text.isNotEmpty && noteController.text.isNotEmpty) {
      putTaskToDB();
      Get.back();
    } else if (titleController.text.isEmpty || noteController.text.isEmpty) {
      Get.snackbar(
        "Message:",
        "All fields are required!",
        snackPosition: SnackPosition.TOP,
        backgroundColor: primaryColor,
        colorText: lightColor,
        icon: const Icon(
          Icons.warning,
          color: Colors.red,
        ),
      );
    }
  }

  void putTaskToDB() {
    TaskModel(
      title: titleController.text,
      note: noteController.text,
      date: DateFormat.yMd().format(selectedDate),
      startTime: startTime,
      endTime: endTime,
      remind: remindDefault.value,
      repeat: repeatController.text,
      isCompleted: 0,
    );
  }
}
