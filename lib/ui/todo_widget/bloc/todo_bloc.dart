// ignore: import_of_legacy_library_into_null_safe
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../models/todo.dart';
import '../../../respository/TodoRepo.dart';

part 'todo_event.dart';
part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  TodoBloc({
    required this.todoRepository,
  }) : super(const TodoState()) {
    on<GetTodo>(_mapGetTodoEventToState);
    on<SelectTodo>(_mapSelectTodoEventToState);
  }
  final TodoRepo todoRepository;

  void _mapGetTodoEventToState(GetTodo event, Emitter<TodoState> emit) async {
    emit(state.copyWith(status: TodoStatus.loading));
    try {
      final todos = await todoRepository.getLodoList();
      emit(
        state.copyWith(
          status: TodoStatus.success,
          todos: todos,
        ),
      );
    } catch (error, stacktrace) {
      print(stacktrace);
      emit(state.copyWith(status: TodoStatus.error));
    }
  }

  void _mapSelectTodoEventToState(
      SelectTodo event, Emitter<TodoState> emit) async {
    emit(
      state.copyWith(
        status: TodoStatus.selected,
        idSelected: event.idSelected,
      ),
    );
  }
}
