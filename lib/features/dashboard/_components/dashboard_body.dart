import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/resources/assets.dart';
import '../../../core/resources/colors.dart' as colors;
import '../../../core/routes/routes.dart';

class DashboardBody extends StatelessWidget {
  const DashboardBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(height: 50),
          Center(
            child: Image.asset(
              Assets.taskLogo,
              height: 270,
              width: 230,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 70),
          const Text(
            "Easy Task Creation",
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w600,
              color: colors.pendingColor,
            ),
          ),
          const SizedBox(height: 20),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Text(
              "Quickly add tasks, set due dates and add descriptions with\nease using our task app.\nSimplify your workflow and stay organized.",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 13,
                color: colors.secondaryColor,
              ),
            ),
          ),
          const SizedBox(height: 100),
          Container(
            width: Get.width,
            height: 50,
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: ElevatedButton(
                onPressed: () {
                  Get.offAndToNamed(Routes.home);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: colors.tertiaryColor,
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                    side: const BorderSide(
                      color: colors.tertiaryColor,
                    ),
                  ),
                ),
                child: const Text(
                  "Get Started",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w800,
                    color: colors.lightColor,
                  ),
                )),
          ),
        ],
      ),
    );
  }
}
