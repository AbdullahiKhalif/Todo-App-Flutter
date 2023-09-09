import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:todo_app/constants/app_style_constants.dart';

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
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            decoration: BoxDecoration(
              // border: Border.all(width: 1.0, color: Colors.blue),
              borderRadius: BorderRadius.circular(8),
              color: Colors.grey.shade300,
            ),
            child: const TextField(
              decoration: InputDecoration(
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  hintText: 'Add New Task'),
            ),
          ),
        ],
      ),
    );
  }
}
