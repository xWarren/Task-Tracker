import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../core/resources/assets.dart';
import '../../../core/resources/colors.dart' as colors;
import 'task_controller.dart';

class TaskPage extends GetView<TaskController> {
  const TaskPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: GestureDetector(
            onTap: () {
              Get.back();
            },
            child: Image.asset(Assets.exit)),
      ),
      body: Form(
        key: controller.key,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              const Text(
                "Title",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: colors.primaryColor,
                ),
              ),
              const SizedBox(height: 5),
              SizedBox(
                height: 50,
                child: TextFormField(
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                      hintText: "Enter your title",
                      fillColor: colors.lightColor,
                      contentPadding:
                          const EdgeInsets.symmetric(horizontal: 20),
                      filled: true,
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide:
                            const BorderSide(color: colors.tertiaryColor),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide:
                            const BorderSide(color: colors.secondaryColor),
                      )),
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                "Note",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: colors.primaryColor,
                ),
              ),
              const SizedBox(height: 5),
              SizedBox(
                height: 150,
                child: TextFormField(
                  textInputAction: TextInputAction.next,
                  maxLength: controller.length.value,
                  maxLines: 5,
                  decoration: InputDecoration(
                      hintText: "Enter your note",
                      fillColor: colors.lightColor,
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 20),
                      filled: true,
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide:
                            const BorderSide(color: colors.tertiaryColor),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide:
                            const BorderSide(color: colors.secondaryColor),
                      )),
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                "Date",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: colors.primaryColor,
                ),
              ),
              const SizedBox(height: 5),
              SizedBox(
                height: 50,
                child: TextFormField(
                  controller: controller.dateController,
                  textInputAction: TextInputAction.done,
                  decoration: InputDecoration(
                    suffixIcon: const Icon(Icons.calendar_today),
                    fillColor: colors.lightColor,
                    contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide:
                          const BorderSide(color: colors.secondaryColor),
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
                        initialDate: controller.selectedDate,
                        firstDate: DateTime(1900, 1, 1),
                        lastDate: DateTime(2101));
                    if (picked != null) {
                      controller.dateController.text =
                          DateFormat('MMMM d, yyyy').format(picked).toString();
                    }
                  },
                ),
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Start Time",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: colors.primaryColor,
                          ),
                        ),
                        const SizedBox(height: 5),
                        SizedBox(
                          height: 50,
                          child: TextFormField(
                            textInputAction: TextInputAction.next,
                            decoration: InputDecoration(
                                fillColor: colors.lightColor,
                                contentPadding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                filled: true,
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: const BorderSide(
                                      color: colors.tertiaryColor),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: const BorderSide(
                                      color: colors.secondaryColor),
                                )),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "End Time",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: colors.primaryColor,
                          ),
                        ),
                        const SizedBox(height: 5),
                        SizedBox(
                          height: 50,
                          child: TextFormField(
                            textInputAction: TextInputAction.next,
                            decoration: InputDecoration(
                                fillColor: colors.lightColor,
                                contentPadding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                filled: true,
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: const BorderSide(
                                      color: colors.tertiaryColor),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: const BorderSide(
                                      color: colors.secondaryColor),
                                )),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
