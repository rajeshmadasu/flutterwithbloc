part of 'todo_bloc.dart';

class TodoEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class GetTodo extends TodoEvent {}

class SelectTodo extends TodoEvent {
  SelectTodo({
    required this.idSelected,
  });
  final int idSelected;

  @override
  List<Object?> get props => [idSelected];
}
