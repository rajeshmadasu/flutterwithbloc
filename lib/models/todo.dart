import 'dart:convert';

List<Todo> todoFromJson(String str) =>
    List<Todo>.from(json.decode(str).map((x) => Todo.fromJson(x)));

String todoToJson(List<Todo> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

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

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "completed": isCompleted,
      };
}
