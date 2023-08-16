import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TaskController extends GetxController {
  RxInt length = 150.obs;
  int textLength = 0;
  final key = GlobalKey<FormState>();
  final TextEditingController dateController = TextEditingController();
  DateTime selectedDate = DateTime.now();
}
