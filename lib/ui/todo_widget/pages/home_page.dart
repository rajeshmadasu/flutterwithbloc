import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../respository/TodoRepo.dart';
import '../../../services/TodoService.dart';
import '../bloc/todo_bloc.dart';
import '../widgets/todo_list.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo List'),
      ),
      body: RepositoryProvider(
        create: (context) => TodoRepo(service: TodoService()),
        child: MultiBlocProvider(
          providers: [
            BlocProvider<TodoBloc>(
              create: (context) => TodoBloc(
                todoRepository: context.read<TodoRepo>(),
              )..add(GetTodo()),
            ),
          ],
          child: TodoList(),
        ),
      ),
    );
  }
}
