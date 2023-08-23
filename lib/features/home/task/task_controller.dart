import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../core/data/database/db_helper.dart';
import '../../../core/data/models/task_model.dart';
import '../../../core/resources/colors.dart' as colors;

class TaskController extends GetxController {
  RxInt length = 150.obs;

  var date = "01/01/2023";
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
  Rx<DateTime> selectedDate = DateTime.now().obs;
  Rx<DateTime> dateToday = Rx<DateTime>(DateTime.now());
  RxInt remindDefault = 5.obs;
  var repeatDefault = 'None';

  var taskList = <TaskModel>[].obs;

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
    getTasks();
    super.onReady();
  }

  void getBack() {
    titleController.clear();
    noteController.clear();
    dateController.clear();
    startTimeController.clear();
    endTimeController.clear();
    repeatDefault.obs;
    selectedColor.obs;
    Get.back();
  }

  Future<int> addTask({TaskModel? taskModel}) async {
    return await DBHelper.insert(taskModel);
  }

  void getTasks() async {
    List<Map<String, dynamic>> tasks = await DBHelper.query();
    taskList.assignAll(tasks.map((data) => TaskModel.fromJson(data)).toList());
  }

  void validateTitle() {
    if (titleController.text.isNotEmpty && noteController.text.isNotEmpty) {
      putTaskToDB();
      getBack();
    } else if (titleController.text.isEmpty || noteController.text.isEmpty) {
      Get.snackbar(
        "Message:",
        "All fields are required!",
        snackPosition: SnackPosition.TOP,
        backgroundColor: colors.primaryColor,
        colorText: colors.lightColor,
        icon: const Icon(
          Icons.warning,
          color: Colors.red,
        ),
      );
    }
  }

  void putTaskToDB() async {
    int value = await addTask(
        taskModel: TaskModel(
      title: titleController.text,
      note: noteController.text,
      date: dateController.text,
      startTime: startTimeController.text,
      endTime: endTimeController.text,
      remind: remindDefault.value,
      repeat: repeatDefault,
      color: selectedColor.value,
      isCompleted: 0,
    ));

    // ignore: avoid_print
    print("My id is $value");
  }

  void delete(TaskModel taskModel) {
    DBHelper.delete(taskModel);
    getTasks();
    Get.back();
    Get.back();
  }

  void taskCompleted(int id) async {
    await DBHelper.update(id);
    getTasks();
    Get.back();
    Get.back();
  }
}
