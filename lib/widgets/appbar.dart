import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppBar_Widget extends StatelessWidget {
  // const AppBar_Widget({
  //   super.key,
  // });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      title: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.amber.shade400,
          radius: 25,
          child: Image.asset('assets/profile.png'),
        ),
        title: Text(
          'Hello I\'m',
          style: TextStyle(
            color: Colors.grey,
            fontSize: 14.0,
          ),
        ),
        subtitle: Text(
          'Abdullahi Khalif',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 16.0,
          ),
        ),
      ),
      actions: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Row(
            children: [
              IconButton(
                onPressed: () => {},
                icon: Icon(
                  CupertinoIcons.calendar,
                  color: Colors.grey.shade900,
                ),
              ),
              IconButton(
                onPressed: () => {},
                icon: Icon(
                  CupertinoIcons.bell,
                  color: Colors.grey.shade900,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
