import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/data/models/task_model.dart';
import '../../../core/resources/assets.dart';
import '../../../core/resources/colors.dart' as colors;

class TaskDetailBody extends StatelessWidget {
  final TaskModel taskModel;

  const TaskDetailBody({required this.taskModel, super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        _buildSliverAppBar(),
        _buildSliverToBoxAdapter(),
      ],
    );
  }

  Widget _buildSliverToBoxAdapter() {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            _buildTitle(),
            const SizedBox(height: 30),
            Row(
              children: [
                _buildCalendarIcon(),
                const SizedBox(width: 10),
                _buildDateColumn(),
                _buildAlarmIcon(),
                const SizedBox(width: 10),
                _buildTimeColumn(),
              ],
            ),
            const SizedBox(height: 40),
            _buildDescriptionText(),
            const SizedBox(height: 20),
            _buildNotes(),
          ],
        ),
      ),
    );
  }

  Widget _buildTitle() {
    return Text(
      taskModel.title.toString(),
      style: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: colors.pendingColor,
      ),
    );
  }

  Widget _buildCalendarIcon() {
    return Container(
      height: 40,
      width: 40,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: colors.lightColor,
          boxShadow: const [BoxShadow(blurRadius: 3.0, color: Colors.black)]),
      child: const Icon(
        Icons.calendar_month,
        color: colors.tertiaryColor,
      ),
    );
  }

  Widget _buildDateColumn() {
    return Expanded(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [_buildDateText(), _buildDate()],
    ));
  }

  Widget _buildDateText() {
    return const Text(
      "Date",
      style: TextStyle(
        fontSize: 13,
        fontWeight: FontWeight.w500,
        color: colors.secondaryColor,
      ),
    );
  }

  Widget _buildDate() {
    return Text(
      taskModel.date.toString().isNotEmpty
          ? taskModel.date.toString()
          : "No set a date",
      style: const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: colors.pendingColor,
      ),
    );
  }

  Widget _buildAlarmIcon() {
    return Container(
      height: 40,
      width: 40,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: colors.lightColor,
          boxShadow: const [BoxShadow(blurRadius: 3.0, color: Colors.black)]),
      child: const Icon(
        Icons.access_alarm_rounded,
        color: colors.tertiaryColor,
      ),
    );
  }

  Widget _buildTimeColumn() {
    return Expanded(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [_buildTimeText(), _buildTime()],
    ));
  }

  Widget _buildTimeText() {
    return const Text(
      "Time",
      style: TextStyle(
        fontSize: 13,
        fontWeight: FontWeight.w500,
        color: colors.secondaryColor,
      ),
    );
  }

  Widget _buildTime() {
    return Text(
      taskModel.startTime.toString().isNotEmpty &&
              taskModel.endTime.toString().isNotEmpty
          ? "${taskModel.startTime.toString()} - ${taskModel.endTime.toString()}"
          : "No set a time",
      style: const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: colors.pendingColor,
      ),
    );
  }

  Widget _buildDescriptionText() {
    return const Text(
      "Description",
      style: TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.w700,
        color: colors.pendingColor,
      ),
    );
  }

  Widget _buildNotes() {
    return Text(
      taskModel.note.toString(),
      style: const TextStyle(
        fontSize: 15,
        color: colors.secondaryColor,
      ),
    );
  }

  Widget _buildSliverAppBar() {
    return SliverAppBar(
      expandedHeight: 50.0,
      pinned: true,
      backgroundColor: colors.lightColor,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        title: _buildTitleText(),
      ),
      leading: _buildLeading(),
    );
  }

  Widget _buildTitleText() {
    return const Text(
      "Task Detail",
      style: TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.w500,
        color: colors.secondaryColor,
      ),
    );
  }

  Widget _buildLeading() {
    return GestureDetector(
        onTap: () {
          Get.back();
        },
        child: Image.asset(Assets.exit));
  }
}
