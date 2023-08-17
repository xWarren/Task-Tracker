import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/resources/assets.dart';
import '../../core/resources/colors.dart' as colors;
import '../../core/resources/custom_picker.dart';
import '_components/home_appbar.dart';
import 'home_controller.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeAppBar(),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Text(
                    "Today",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: colors.primaryColor,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: DatePicker(
                DateTime.now(),
                initialSelectedDate: DateTime.now(),
                selectionColor: colors.tertiaryColor,
                selectedTextColor: Colors.white,
                dateTextStyle: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  color: colors.primaryColor,
                ),
                dayTextStyle: const TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w500,
                  color: colors.primaryColor,
                ),
              ),
            ),
            const SizedBox(height: 100),
            Image.asset(
              Assets.noTask,
              height: 150,
              width: 150,
              fit: BoxFit.cover,
            ),
            const Text(
              "No Task",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: colors.primaryColor,
              ),
            ),
            const SizedBox(height: 5),
            const Text(
              "There is no pending task.",
              style: TextStyle(
                fontSize: 15,
                color: colors.secondaryColor,
              ),
            )
          ],
        ),
      ),
    );
  }
}
