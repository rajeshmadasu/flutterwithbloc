import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/todo_bloc.dart';

class ErrorTodoWidget extends StatelessWidget {
  const ErrorTodoWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TodoBloc, TodoState>(
      builder: (context, state) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // ignore: prefer_const_constructors
            Center(
              child: const Text(
                'Something was wrong',
                style: TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Center(
              child: TextButton(
                child: const Text(
                  'Refresh',
                  textAlign: TextAlign.center,
                ),
                onPressed: () {
                  context.read<TodoBloc>().add(GetTodo());
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
