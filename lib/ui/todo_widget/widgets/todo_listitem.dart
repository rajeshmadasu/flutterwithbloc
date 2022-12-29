import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../models/todo.dart';
import '../bloc/todo_bloc.dart';

typedef TodoCLicked = Function(Todo categorySelected);

class TodoItem extends StatelessWidget {
  const TodoItem({
    Key? key,
    required this.todo,
    required this.callback,
  }) : super(key: key);

  final Todo todo;
  final TodoCLicked callback;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => callback(todo),
      child: BlocSelector<TodoBloc, TodoState, bool>(
        selector: (state) =>
            (state.status.isSelected && state.idSelected == todo.id)
                ? true
                : false,
        builder: (context, state) {
          return Row(
            children: [
              AnimatedContainer(
                duration: const Duration(milliseconds: 400),
                curve: Curves.easeInOutCirc,
                padding: const EdgeInsets.symmetric(horizontal: 2.0),
                alignment: Alignment.center,
                height: state ? 70.0 : 60.0,
                width: state ? 70.0 : 60.0,
                child: Checkbox(
                    value: todo.isCompleted, onChanged: ((value) => {})),
              ),
              SizedBox(width: 10.0),
              Expanded(
                child: Text(todo.title,
                    overflow: TextOverflow.ellipsis,
                    style: todo.isCompleted
                        ? const TextStyle(
                            fontSize: 18,
                            decoration: TextDecoration.lineThrough)
                        : const TextStyle(
                            fontSize: 18,
                          )),
              ),
            ],
          );
        },
      ),
    );
  }
}
