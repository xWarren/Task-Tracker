import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../core/data/database/db_helper.dart';
import '../../../core/data/models/task_model.dart';
import '../../../core/resources/colors.dart' as colors;

class TaskController extends GetxController {
  RxInt length = 250.obs;

  var date = "December 19, 2023";
  String startTime = DateFormat("hh:mm a").format(DateTime.now()).toString();
  var endTime = "10:30 PM";

  int textLength = 0;
  RxInt selectedColor = 0.obs;

  final key = GlobalKey<FormState>();
  TextEditingController titleController = TextEditingController();
  TextEditingController noteController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController repeatController = TextEditingController();
<<<<<<< Updated upstream

  DateTime selectedDate = DateTime.now();
  RxInt remindDefault = 5.obs;
  var repeatDefault = "None";
=======
  Rx<DateTime> selectedDate = DateTime.now().obs;
  Rx<DateTime> dateToday = Rx<DateTime>(DateTime.now());
  var repeatDefault = 'None';
>>>>>>> Stashed changes

  var taskList = <TaskModel>[].obs;
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
<<<<<<< Updated upstream
    startTimeController.clear();
    endTimeController.clear();
    repeatController.clear();
    selectedColor.value;
=======
    repeatDefault.obs;
    selectedColor.obs;
>>>>>>> Stashed changes
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
<<<<<<< Updated upstream
      startTime: startTimeController.text,
      endTime: endTimeController.text,
      remind: remindDefault.value,
      repeat: repeatController.text,
=======
      repeat: repeatDefault,
>>>>>>> Stashed changes
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

  void updateDetail(int id) async {
    await DBHelper.updateDetails(id);
    getTasks();
  }

  List<DateTime> getTuesdaysInSeptember(int year) {
    List<DateTime> tuesdays = [];

    for (int day = 1; day <= 30; day++) {
      DateTime date = DateTime(year, 9, day);
      if (date.weekday == DateTime.tuesday) {
        tuesdays.add(date);
      }
    }

    return tuesdays;
  }

  void getTuesday() {
    int year = DateTime.now().year;
    List<DateTime> tuesdaysInSeptember = getTuesdaysInSeptember(year);

    for (DateTime tuesday in tuesdaysInSeptember) {
      print(tuesday);
    }
  }
}
