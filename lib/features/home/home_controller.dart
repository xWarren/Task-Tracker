import 'package:get/get.dart';

import 'task/task_controller.dart';

class HomeController extends GetxController {
  TaskController taskController = Get.put(TaskController());
}
