import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../utils/NetworkConnectivity.dart';
import '../bloc/todo_bloc.dart';
import 'error_widget.dart';
import 'todo_success_widget.dart';

class TodoList extends StatefulWidget {
  const TodoList({super.key});

  @override
  State<TodoList> createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  Map _source = {ConnectivityResult.none: false};
  final NetworkConnectivity _networkConnectivity = NetworkConnectivity.instance;
  String string = '';
  bool isOffline = false;
  bool isMobileOnline = false;
  bool isWifiOnline = false;

  void checkNetworkConnectivity() {
    _networkConnectivity.myStream.listen((source) {
      _source = source;
      switch (_source.keys.toList()[0]) {
        case ConnectivityResult.mobile:
          isMobileOnline = _source.values.toList()[0];
          break;
        case ConnectivityResult.wifi:
          isWifiOnline = _source.values.toList()[0];
          break;
        case ConnectivityResult.none:
        default:
      }
      if (!isMobileOnline && !isWifiOnline) {
        setState(() {
          isOffline = true;
        });
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _networkConnectivity.initialise();
    checkNetworkConnectivity();
  }

  @override
  void dispose() {
    _networkConnectivity.disposeStream();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TodoBloc, TodoState>(
      builder: (context, state) {
        return state.status.isSuccess
            ? TodoSuccessWidget()
            : state.status.isLoading
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : state.status.isError || isOffline
                    ? const ErrorTodoWidget()
                    : const SizedBox();
      },
    );
  }
}
