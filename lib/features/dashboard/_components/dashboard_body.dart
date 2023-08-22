import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/resources/assets.dart';
import '../../../core/resources/colors.dart' as colors;
import '../../../core/resources/strings.dart' as strings;
import '../../../core/resources/text_style.dart';
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
          _buildImage(),
          const SizedBox(height: 70),
          _buildDashboardTitle(),
          const SizedBox(height: 20),
          _buildDashboardDescription(),
          const SizedBox(height: 100),
          _buildButton(),
        ],
      ),
    );
  }

  Widget _buildButton() {
    return Container(
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
          child: _buildGetStartedText()),
    );
  }

  Widget _buildGetStartedText() {
    return Text(
      strings.dashboardGetStarted,
      style: CustomStyle.dashboardGetStartedStyle,
    );
  }

  Widget _buildDashboardDescription() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Text(
        strings.dashboarDescription,
        textAlign: TextAlign.center,
        style: CustomStyle.dashboardDescriptionStyle,
      ),
    );
  }

  Widget _buildDashboardTitle() {
    return Text(
      strings.dashboardTitle,
      style: CustomStyle.dashboardTitleStyle,
    );
  }

  Widget _buildImage() {
    return Center(
      child: Image.asset(
        Assets.taskLogo,
        height: 270,
        width: 230,
        fit: BoxFit.cover,
      ),
    );
  }
}
