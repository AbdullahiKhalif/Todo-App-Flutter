import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/provider/radio_provider.dart';

class RadioListTileWidget extends ConsumerWidget {
  const RadioListTileWidget({
    super.key,
    required this.titleRadio,
    required this.catColor,
    required this.valueText,
    required this.onChangeRadio,
  });
  final Color catColor;
  final String titleRadio;
  final int valueText;
  final VoidCallback onChangeRadio;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final radioCateogryProvider = ref.watch(radioProvider);
    return Material(
      child: Theme(
        data: ThemeData(unselectedWidgetColor: catColor),
        child: RadioListTile(
          activeColor: catColor,
          contentPadding: EdgeInsets.zero,
          title: Transform.translate(
            offset: Offset(-22, 0),
            child: Text(
              titleRadio,
              style: TextStyle(
                color: catColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          value: valueText,
          groupValue: radioCateogryProvider,
          onChanged: (value) => onChangeRadio(),
        ),
      ),
    );
  }
}
