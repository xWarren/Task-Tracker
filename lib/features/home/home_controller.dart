import 'package:get/get.dart';

import '../../core/resources/colors.dart' as colors;
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

  getBGColor(int no) {
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
