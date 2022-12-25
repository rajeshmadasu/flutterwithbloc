import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:httpapisample/network/api.dart';
import './models/todo.dart';

class TodoList extends StatefulWidget {
  const TodoList({super.key});

  @override
  State<TodoList> createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  List<Todo> users = [];

  _getUsersList() {
    API.getTodos().then((response) {
      setState(() {
        Iterable list = json.decode(response.body);
        users = list.map((model) => Todo.fromJson(model)).toList();
      });
    });
  }

  @override
  void initState() {
    super.initState();
    _getUsersList();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Checkbox(value: users[index].isCompleted, onChanged: null),
            title: Text(users[index].title),
          );
        });
  }
}
