class Todo {
  late int id;
  late String title;
  late bool isCompleted;

  Todo(int id, String title, bool isCompleted) {
    id = id;
    title = title;
    isCompleted = isCompleted;
  }

  Todo.fromJson(Map json) {
    id = json['id'];
    title = json['title'];
    isCompleted = json['completed'];
  }
}
