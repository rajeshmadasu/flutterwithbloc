import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/todo_bloc.dart';
import 'todo_listitem.dart';

class TodoSuccessWidget extends StatefulWidget {
  const TodoSuccessWidget({super.key});

  @override
  State<TodoSuccessWidget> createState() => _TodoSuccessWidgetState();
}

class _TodoSuccessWidgetState extends State<TodoSuccessWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TodoBloc, TodoState>(
      builder: (context, state) {
        return ListView.separated(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return TodoItem(
                key: ValueKey('${state.todos[index].title}$index'),
                todo: state.todos[index],
                callback: (categorySelected) => {});
          },
          separatorBuilder: (_, __) => const SizedBox(
            width: 16.0,
          ),
          itemCount: state.todos.length,
        );
      },
    );
  }
}
