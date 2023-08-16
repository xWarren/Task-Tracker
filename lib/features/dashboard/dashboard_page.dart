import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_app/features/dashboard/_components/dashboard_body.dart';

import 'dashboard_controller.dart';

class DashboardPage extends GetView<DashboardController> {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: DashboardBody());
  }
}
