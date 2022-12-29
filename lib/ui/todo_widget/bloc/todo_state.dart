part of 'todo_bloc.dart';

enum TodoStatus { initial, success, error, loading, selected }

extension TodoStatusX on TodoStatus {
  bool get isInitial => this == TodoStatus.initial;
  bool get isSuccess => this == TodoStatus.success;
  bool get isError => this == TodoStatus.error;
  bool get isLoading => this == TodoStatus.loading;
  bool get isSelected => this == TodoStatus.selected;
}

class TodoState extends Equatable {
  const TodoState({
    this.status = TodoStatus.initial,
    List<Todo>? todos,
    int idSelected = 0,
  })  : todos = todos ?? const [],
        idSelected = idSelected;

  final List<Todo> todos;
  final TodoStatus status;
  final int idSelected;

  @override
  List<Object?> get props => [status, todos, idSelected];

  TodoState copyWith({
    List<Todo>? todos,
    TodoStatus? status,
    int? idSelected,
  }) {
    return TodoState(
      todos: todos ?? this.todos,
      status: status ?? this.status,
      idSelected: idSelected ?? this.idSelected,
    );
  }
}
