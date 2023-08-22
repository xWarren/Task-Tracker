import 'package:get/get.dart';

import 'task/task_controller.dart';

class HomeController extends GetxController {
  TaskController taskController = Get.put(TaskController());

  String greeting() {
    var hour = DateTime.now().hour;
    if (hour < 12) {
      return 'Good Morning';
    } else if (hour < 17) {
      return 'Good Afternoon';
    }
    return 'Good Evening';
  }
}
