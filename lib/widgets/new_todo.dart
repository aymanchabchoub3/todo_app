import 'package:flutter/material.dart';

class NewTodo extends StatefulWidget {
  const NewTodo({super.key, required this.addTodo});

  final Function(String) addTodo;

  @override
  State<NewTodo> createState() => _NewTodoState();
}

class _NewTodoState extends State<NewTodo> {
  final TextEditingController _todoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      margin: const EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          TextField(
            controller: TextEditingController(),
            decoration: const InputDecoration(
              labelText: "New TODO",
            ),
            maxLength: 50,
          ),
          TextButton(
            onPressed: () {
              widget.addTodo(_todoController.text);
              Navigator.of(context).pop();
            },
            child: const Text("add"),
          )
        ],
      ),
    );
  }
}
