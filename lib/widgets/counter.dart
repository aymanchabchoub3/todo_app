import 'package:flutter/material.dart';

class Counter extends StatelessWidget {
  const Counter({super.key, required this.numberOfTodos, required this.totalCompleted, required int totalCompletions});
  final int numberOfTodos;
  final int totalCompleted;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(40),
      child: Text(
        "$totalCompleted/$numberOfTodos",
        style: TextStyle(
            color:
                totalCompleted == numberOfTodos ? Colors.green : Colors.black,
            fontSize: 75),
      ),
    );
  }
}
