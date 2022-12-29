import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import '../models/result_error.dart';
import '../models/todo.dart';

class TodoService {
  final String baseUrl;
  final Client _httpClient;

  TodoService({
    http.Client? httpClient,
    this.baseUrl = 'https://jsonplaceholder.typicode.com',
  }) : _httpClient = httpClient ?? http.Client();

  Future<List<Todo>> getTodoList() async {
    final response = await _httpClient.get(
      getUrl(url: 'todos'),
    );
    if (response.statusCode == 200) {
      if (response.body.isNotEmpty) {
        return todoFromJson(response.body);
      } else {
        throw ErrorEmptyResponse();
      }
    } else {
      throw ErrorGettingTodos('Error getting todos');
    }
  }

  Uri getUrl({
    required String url,
    Map<String, String>? extraParameters,
  }) {
    final queryParameters = <String, String>{};
    if (extraParameters != null) {
      queryParameters.addAll(extraParameters);
    }

    return Uri.parse('$baseUrl/$url').replace(
      queryParameters: queryParameters,
    );
  }
}
