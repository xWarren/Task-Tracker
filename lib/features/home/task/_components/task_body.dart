import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:intl/intl.dart';
import 'package:task_app/features/home/task/task_controller.dart';

import '../../../../core/resources/colors.dart' as colors;

class TaskBody extends GetView<TaskController> {
  const TaskBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => SingleChildScrollView(
        child: Form(
          key: controller.key,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                _buildTitleText(),
                const SizedBox(height: 5),
                _buildTitleField(),
                const SizedBox(height: 10),
                _buildNoteText(),
                const SizedBox(height: 5),
                _buildNoteField(),
                const SizedBox(height: 10),
                _buildDateText(),
                const SizedBox(height: 5),
                _buildDateField(context),
                const SizedBox(height: 10),
                _buildRepeatText(),
                const SizedBox(height: 5),
                _buildRepeatField(),
                const SizedBox(height: 10),
                _buildColorTask()
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildColorTask() {
    return Row(
      children: [_buildColor(), _buildTaskButton()],
    );
  }

  Widget _buildTaskButton() {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          SizedBox(
            height: 40,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: colors.tertiaryColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                        side: const BorderSide(color: colors.tertiaryColor))),
                onPressed: () {
                  controller.validateTitle();
                },
                child: const Text(
                  "Create Task",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: colors.lightColor,
                  ),
                )),
          )
        ],
      ),
    );
  }

  Widget _buildColor() {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Color",
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w700,
              color: colors.pendingColor,
            ),
          ),
          Wrap(
            children: List<Widget>.generate(
                5,
                (index) => GestureDetector(
                      onTap: () {
                        controller.selectedColor.value = index;
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 5, vertical: 10),
                        child: CircleAvatar(
                            radius: 12,
                            backgroundColor: index == 0
                                ? colors.selection1
                                : index == 1
                                    ? colors.selection2
                                    : index == 2
                                        ? colors.selection3
                                        : index == 3
                                            ? colors.selection4
                                            : index == 4
                                                ? colors.selection5
                                                : null,
                            // ignore: unrelated_type_equality_checks
                            child: controller.selectedColor.value == index
                                ? const Icon(
                                    Icons.done,
                                    color: Colors.white,
                                    size: 16,
                                  )
                                : const SizedBox.shrink()),
                      ),
                    )),
          )
        ],
      ),
    );
  }

  Widget _buildRepeatField() {
    return SizedBox(
      height: 50,
      child: DropdownButtonFormField(
          decoration: InputDecoration(
              fillColor: colors.lightColor,
              contentPadding: const EdgeInsets.symmetric(horizontal: 20),
              filled: true,
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: colors.tertiaryColor),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: colors.secondaryColor),
              )),
          value: controller.repeatDefault.toString(),
          items:
              controller.repeat.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value.toString(),
              child: Text(value.toString()),
            );
          }).toList(),
          onChanged: (newValue) {
            controller.repeatDefault = newValue.toString();
          }),
    );
  }

  Widget _buildRepeatText() {
    return const Text(
      "Repeat",
      style: TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.w700,
        color: colors.pendingColor,
      ),
    );
  }

  Widget _buildDateField(BuildContext context) {
    return SizedBox(
      height: 50,
      child: TextFormField(
        controller: controller.dateController,
        textInputAction: TextInputAction.done,
        decoration: InputDecoration(
          hintText: controller.date,
          suffixIcon: const Icon(Icons.calendar_today),
          fillColor: colors.lightColor,
          contentPadding: const EdgeInsets.symmetric(horizontal: 20),
          filled: true,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: colors.secondaryColor),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: colors.tertiaryColor),
          ),
        ),
        onChanged: (text) {
          controller.textLength = text.length;
        },
        onSaved: (value) {
          controller.dateController.text = value!;
        },
        onTap: () async {
          DateTime? picked = await showDatePicker(
              context: context,
              initialDate: controller.selectedDate.value,
              firstDate: DateTime(1900, 1, 1),
              lastDate: DateTime(2101));
          if (picked != null) {
            controller.dateController.text = DateFormat.yMd().format(picked);
          }
        },
      ),
    );
  }

  Text _buildDateText() {
    return const Text(
      "Date",
      style: TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.w700,
        color: colors.pendingColor,
      ),
    );
  }

  SizedBox _buildNoteField() {
    return SizedBox(
      height: 150,
      child: TextFormField(
        controller: controller.noteController,
        textInputAction: TextInputAction.done,
        maxLength: controller.length.value,
        maxLines: 5,
        decoration: InputDecoration(
            hintText: "Enter your note",
            fillColor: colors.lightColor,
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            filled: true,
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: colors.tertiaryColor),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: colors.secondaryColor),
            )),
      ),
    );
  }

  Text _buildNoteText() {
    return const Text(
      "Note",
      style: TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.w700,
        color: colors.pendingColor,
      ),
    );
  }

  SizedBox _buildTitleField() {
    return SizedBox(
      height: 50,
      child: TextFormField(
        controller: controller.titleController,
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
            hintText: "Enter your title",
            fillColor: colors.lightColor,
            contentPadding: const EdgeInsets.symmetric(horizontal: 20),
            filled: true,
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: colors.tertiaryColor),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: colors.secondaryColor),
            )),
      ),
    );
  }

  Text _buildTitleText() {
    return const Text(
      "Title",
      style: TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.w700,
        color: colors.pendingColor,
      ),
    );
  }
}
