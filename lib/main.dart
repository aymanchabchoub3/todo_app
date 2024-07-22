import 'package:flutter/material.dart';
import 'package:to_do_app/models/todo.dart';
import 'package:to_do_app/widgets/counter.dart';
import 'package:to_do_app/widgets/new_todo.dart';
import 'package:to_do_app/widgets/todo_cards.dart';
import 'package:to_do_app/widgets/todo_list.dart';
import 'package:uuid/uuid.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp();
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({
    super.key,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Todo> todos = [
    Todo(completed: true, id: Uuid(), title: "fuck emna"),
  ];
  int calcTotalCompleted() {
    var totalCompleted = 0;
    todos.forEach((todo) {
      if (todo.completed) {
        totalCompleted++;
      }
    });
    return totalCompleted;
  }

  void updateTodoCompletions(int index) {
    setState(() {
      todos[index].completed = !todos[index].completed;
    });
  }

  void showAddTodoModal(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (bCtx) {
          return NewTodo(
            addTodo: _addTodo,
          );
        },
        isScrollControlled: true);
  }

  void _addTodo(String todo) {
    setState(() {
      todos.add(Todo(id: Uuid(), title: todo, completed: false));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Counter(
            numberOfTodos: todos.length,
            totalCompleted: calcTotalCompleted(),
            totalCompletions: calcTotalCompleted(),
          ),
          TodoList(todos: todos, updateTodoCompletions: updateTodoCompletions)
        ],
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showAddTodoModal(context);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
