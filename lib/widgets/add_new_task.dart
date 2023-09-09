import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:todo_app/constants/app_style_constants.dart';
import 'package:todo_app/widgets/text_field.dart';

class AddNewTaskWidget extends StatelessWidget {
  const AddNewTaskWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(30.0),
      height: MediaQuery.of(context).size.height * 0.70,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            width: double.infinity,
            child: SelectableText(
              'New Task Todo',
              style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
          Divider(
            thickness: 1.2,
          ),
          Gap(12.0),
          const Text('Title Task', style: AppStyle.headingOne),
          Gap(6),
          TextFieldWidget(hintText: 'Add Task Name', maxLine: 1),
          Gap(12),
          const Text(
            'Description',
            style: AppStyle.headingOne,
          ),
          Gap(6),
          TextFieldWidget(hintText: 'Add Your Description', maxLine: 5),
        ],
      ),
    );
  }
}
