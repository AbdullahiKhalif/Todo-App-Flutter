import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:todo_app/constants/app_style_constants.dart';
import 'package:todo_app/provider/date_time_provider.dart';
import 'package:todo_app/provider/radio_provider.dart';
import 'package:todo_app/widgets/date_time.dart';
import 'package:todo_app/widgets/radio-list-tile.dart';
import 'package:todo_app/widgets/text_field.dart';

class AddNewTaskWidget extends ConsumerWidget {
  const AddNewTaskWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dateProv = ref.watch(dateProvider);
    final timeProv = ref.watch(timeProvider);
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
                  titleRadio: 'LERN',
                  catColor: Colors.green.shade500,
                  valueText: 1,
                  onChangeRadio: () => {
                    ref.watch(radioProvider.notifier).update((state) => 1),
                  },
                ),
              ),
              Expanded(
                child: RadioListTileWidget(
                  titleRadio: 'WORK',
                  catColor: Colors.blue.shade500,
                  valueText: 2,
                  onChangeRadio: () => {
                    ref.watch(radioProvider.notifier).update((state) => 2),
                  },
                ),
              ),
              Expanded(
                child: RadioListTileWidget(
                  titleRadio: 'GEN',
                  catColor: Colors.amber.shade500,
                  valueText: 3,
                  onChangeRadio: () => {
                    ref.read(radioProvider.notifier).update((state) => 3),
                  },
                ),
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
                valueText: dateProv,
                onTap: () async {
                  final getDateSeleted = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2021),
                    lastDate: DateTime(2025),
                  );

                  if (getDateSeleted != null) {
                    final formatDate = DateFormat.yMd();
                    ref
                        .read(dateProvider.notifier)
                        .update((state) => formatDate.format(getDateSeleted));
                  }
                },
              ),
              Gap(12),
              DateTimeWidget(
                  icon: CupertinoIcons.clock,
                  titleText: 'Time',
                  valueText: timeProv,
                  onTap: () async {
                    final getTimeSelected = await showTimePicker(
                      context: context,
                      initialTime: TimeOfDay.now(),
                    );

                    if (getTimeSelected != null) {
                      ref
                          .read(timeProvider.notifier)
                          .update((state) => getTimeSelected.format(context));
                    }
                  })
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
                  onPressed: () {
                    Navigator.pop(context);
                    ref
                        .read(dateProvider.notifier)
                        .update((state) => 'dd/mm/yy');
                    ref
                        .read(timeProvider.notifier)
                        .update((state) => 'hh : mm');
                  },
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
                    'Create',
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
