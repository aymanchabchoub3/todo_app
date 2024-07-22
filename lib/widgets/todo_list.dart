import 'package:flutter/material.dart';
import 'package:to_do_app/models/todo.dart';
import 'package:to_do_app/widgets/todo_cards.dart';

class TodoList extends StatelessWidget {
  final List<Todo> todos;
  final Function(int) updateTodoCompletions;
  const TodoList({
    super.key,
    required this.todos,
    required this.updateTodoCompletions,
  });
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 500,
      child: ListView.builder(
        itemBuilder: (ctx, i) {
          return ToDoCards(
            title: todos[i].title,
            completed: todos[i].completed,
            updateTodoCompletions: updateTodoCompletions,
            index: i,
          );
        },
        itemCount: todos.length,
      ),
    );
  }
}
