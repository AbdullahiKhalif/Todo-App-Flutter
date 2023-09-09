import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:todo_app/constants/app_style_constants.dart';
import 'package:todo_app/widgets/date_time.dart';
import 'package:todo_app/widgets/radio-list-tile.dart';
import 'package:todo_app/widgets/text_field.dart';

class AddNewTaskWidget extends StatelessWidget {
  const AddNewTaskWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      height: MediaQuery.of(context).size.height * 0.82,
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
          Gap(8.0),
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
          Gap(12),
          const Text('Category', style: AppStyle.headingOne),
          Gap(6),
          Row(
            children: [
              Expanded(
                child: RadioListTileWidget(
                    titleRadio: 'LERN', catColor: Colors.green.shade500),
              ),
              Expanded(
                child: RadioListTileWidget(
                    titleRadio: 'WORK', catColor: Colors.blue.shade500),
              ),
              Expanded(
                child: RadioListTileWidget(
                    titleRadio: 'GEN', catColor: Colors.amber.shade500),
              ),
            ],
          ),

          //Date and Time section
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              DateTimeWidget(
                  icon: CupertinoIcons.calendar,
                  titleText: 'Date',
                  valueText: 'dd/mm/yy'),
              Gap(12),
              DateTimeWidget(
                  icon: CupertinoIcons.clock,
                  titleText: 'Time',
                  valueText: 'hh:mm')
            ],
          ),

          //Task Buttons
          const Gap(12),
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    elevation: 0,
                    foregroundColor: Colors.blue.shade800,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    side: BorderSide(width: 1.2, color: Colors.blue.shade800),
                    padding: EdgeInsets.symmetric(vertical: 14.0),
                  ),
                  onPressed: () => {},
                  child: Text(
                    'Cencel',
                    style: TextStyle(
                      fontSize: 18.0,
                    ),
                  ),
                ),
              ),
              Gap(12),
              Expanded(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue.shade800,
                    elevation: 0,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    // side: BorderSide(width: 1.2, color: Colors.blue.shade800),
                    padding: EdgeInsets.symmetric(vertical: 14.0),
                  ),
                  onPressed: () => {},
                  child: Text(
                    'Save',
                    style: TextStyle(
                      fontSize: 18.0,
                    ),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
