// ignore_for_file: must_be_immutable, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

class ToDoCards extends StatelessWidget {
  final String title;
  final bool completed;
  final Function(int) updateTodoCompletions;

  var index;

  ToDoCards({super.key, 
    required this.title,
    required this.completed,
    required this.updateTodoCompletions,
    required this.index,
  });
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onDoubleTap: () {
        updateTodoCompletions(index);
      },
      child: FractionallySizedBox(
        widthFactor: 0.9,
        child: Card(
            child: Container(
          padding: const EdgeInsets.all(20),
          height: 125,
          width: 350,
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Icon(
                  completed ? Icons.check : Icons.close,
                  color: completed ? Colors.green : Colors.red,
                ),
              ],
            ),
          ),
        )),
      ),
    );
  }
}
