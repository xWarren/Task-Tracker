import 'package:get/get.dart';
import 'package:task_app/features/home/task/task_controller.dart';

class TaskBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TaskController());
  }
}
