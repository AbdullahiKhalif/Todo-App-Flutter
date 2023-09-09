import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:todo_app/widgets/add_new_task.dart';

void main() {
  runApp(ProviderScope(
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyApp(),
    ),
  ));
}

final formatDay = DateFormat.yMEd();
final getDay = formatDay.format(DateTime.now());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.amber.shade400,
            radius: 22,
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
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.0),
          child: Column(
            children: [
              const Gap(20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Today\'s Task',
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '$getDay',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 14.0,
                        ),
                      )
                    ],
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFFD5E8FA),
                      foregroundColor: Colors.blue.shade800,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8))),
                    ),
                    child: Text('+ New Task'),
                    onPressed: () => {
                      showModalBottomSheet(
                          isScrollControlled: true,
                          shape: BeveledRectangleBorder(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(5.0),
                                  topRight: Radius.circular(5.0))),
                          context: context,
                          builder: (context) => AddNewTaskWidget())
                    },
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
