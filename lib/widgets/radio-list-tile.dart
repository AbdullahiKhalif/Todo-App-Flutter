import 'package:flutter/material.dart';

class RadioListTileWidget extends StatelessWidget {
  const RadioListTileWidget({
    super.key,
    required this.titleRadio,
    required this.catColor,
  });
  final Color catColor;
  final String titleRadio;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Theme(
        data: ThemeData(unselectedWidgetColor: catColor),
        child: RadioListTile(
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
          value: 1,
          groupValue: 0,
          onChanged: (value) => {},
        ),
      ),
    );
  }
}
