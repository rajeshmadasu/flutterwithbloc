import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../services/todo_service.dart';
import '../../todo_repository/TodoRepo.dart';
import '../../ui/todo_widget/bloc/todo_bloc.dart';
import '../../ui/todo_widget/widgets/todo_list.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static Route<void> route() {
    return MaterialPageRoute<void>(builder: (_) => const HomePage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo List'),
      ),
      body: RepositoryProvider(
        create: (context) => TodoRepo(service: TodoService()),
        child: BlocProvider<TodoBloc>(
          create: (context) => TodoBloc(
            todoRepository: context.read<TodoRepo>(),
          )..add(GetTodo()),
          child: TodoList(),
        ),
      ),
    );
  }
}
