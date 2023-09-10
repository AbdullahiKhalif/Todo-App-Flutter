import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

class CardListWidget extends ConsumerWidget {
  const CardListWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      width: double.infinity,
      height: 120.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
      ),
      child: Row(
        children: [
          Container(
            width: 20.0,
            decoration: BoxDecoration(
              color: Colors.amber.shade900,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12),
                bottomLeft: Radius.circular(12),
              ),
            ),
          ),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  title: Text('Learning Web developer'),
                  subtitle: Text('Learning HTML, css, js and React.js'),
                  trailing: Transform.scale(
                    scale: 1.5,
                    child: Checkbox(
                      activeColor: Colors.blue.shade800,
                      shape: CircleBorder(),
                      onChanged: (value) => {},
                      value: true,
                    ),
                  ),
                ),
                Transform.translate(
                  offset: Offset(0, -12),
                  child: Container(
                    child: Column(
                      children: [
                        Divider(
                          thickness: 1.5,
                          color: Colors.grey.shade200,
                        ),
                        Gap(12),
                        Row(
                          children: [
                            const Text('Today'),
                            Gap(6),
                            const Text('6:05:AM 0/10/2023')
                          ],
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ))
        ],
      ),
    );
  }
}
