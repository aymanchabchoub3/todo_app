import 'package:uuid/uuid.dart';

class Todo {
  String title;
  Uuid id;
  bool completed;

  Todo({ required this.id, required this.title,required this.completed});
}
