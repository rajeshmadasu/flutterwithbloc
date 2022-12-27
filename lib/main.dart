import 'package:flutter/material.dart';
import 'package:httpapisample/todo_list.dart';
import './login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo App',
      theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch()
              .copyWith(primary: Colors.blue, error: Colors.red)
              .copyWith(secondary: Colors.amber)),
      home: const LoginScreen(),
      initialRoute: '/',
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        '/loginscreen': (context) => const LoginScreen(),
        // When navigating to the "/second" route, build the SecondScreen widget.
        '/todolist': (context) => const TodoList(),
      },
    );
  }
}
