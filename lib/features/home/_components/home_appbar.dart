import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/resources/assets.dart';
import '../../../core/resources/colors.dart' as colors;
import '../../../core/routes/routes.dart';

class HomeAppBar extends AppBar {
  HomeAppBar({
    Key? key,
  }) : super(
          key: key,
          elevation: 0,
          title: SizedBox(
            height: 40,
            child: ElevatedButton(
              onPressed: () {
                Get.toNamed(Routes.task);
              },
              style: ElevatedButton.styleFrom(
                  elevation: 3,
                  backgroundColor: colors.tertiaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  )),
              child: const Text(
                "+ Add Task",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: colors.lightColor,
                ),
              ),
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 20, top: 10),
              child: Container(
                  height: 50,
                  width: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.yellow,
                  ),
                  child: Image.asset(Assets.taskLogo)),
            )
          ],
          bottom: const PreferredSize(
              preferredSize: Size.fromHeight(80),
              child: Padding(
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
              )),
        );
}
