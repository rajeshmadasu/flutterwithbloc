import '../services/TodoService.dart';

import '../models/todo.dart';

class TodoRepo {
  final TodoService service;

  TodoRepo({required this.service});

  Future<List<Todo>> getLodoList() async => service.getTodoList();
}
