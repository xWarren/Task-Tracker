import 'package:flutter/material.dart';

import 'colors.dart' as colors;

class CustomStyle {
  /* DASHBOARD */
  static TextStyle dashboardTitleStyle = const TextStyle(
    fontSize: 25,
    fontWeight: FontWeight.w600,
    color: colors.pendingColor,
  );
  static TextStyle dashboardDescriptionStyle = const TextStyle(
    fontSize: 13,
    color: colors.secondaryColor,
  );
  static TextStyle dashboardGetStartedStyle = const TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w800,
    color: colors.lightColor,
  );

  /* HOME */
  static TextStyle homeGreetingStyle = const TextStyle(
    fontSize: 13,
    fontWeight: FontWeight.w500,
    color: colors.secondaryColor,
  );
  static TextStyle homeAddTaskStyle = const TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.w600,
    color: colors.lightColor,
  );
  static TextStyle homeYouGotStyle = const TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w700,
    color: colors.pendingColor,
  );
  static TextStyle homeTaskListStyle = const TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w700,
    color: colors.tertiaryColor,
  );
  static TextStyle homeToDoStyle = const TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.w700,
    color: colors.pendingColor,
  );
  static TextStyle homeNoPendingTaskStyle = const TextStyle(
    fontSize: 15,
    color: colors.secondaryColor,
  );
  static TextStyle homeNoTaskStyle = const TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w700,
    color: colors.pendingColor,
  );
  static TextStyle homeNoteStyle = const TextStyle(
    fontSize: 12,
    color: colors.secondaryColor,
  );
  static TextStyle homeCompletedStyle = const TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.bold,
    color: colors.pendingColor,
  );
  static TextStyle homeDeleteStyle = const TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w500,
    color: colors.pendingColor,
  );
  static TextStyle homeCancelStyle = const TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.w500,
    color: colors.pendingColor,
  );
}
