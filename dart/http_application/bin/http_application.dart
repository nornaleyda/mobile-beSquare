import 'http_request.dart';
import 'todo.dart';

void main(List<String> arguments) async {
  MyHttpRequest myhttpRequest = MyHttpRequest();

  // myhttpRequest.addTodo(
  //   Todo('norna', 'add new todos', false),
  // );

  // myhttpRequest.editTodo(
  //   65,
  //   Todo('besquare', 'Prepare Application(edited)', true),
  // );

  // myhttpRequest.deleteTodo(166);

  // myhttpRequest.getTodos();

  final List<Todo> todoList = await myhttpRequest.getTodos() ?? [];
  // print("${todoList.length}");
  // print("$todoList[1].title");

  // for loop all the items

  // for (int i = 0; i < todoList.length; i++) {
  //   print(todoList);
  // }

  // for (Todo todo in todoList!) {
  //   print(todo.toString());
  // }

  for (Todo todo in todoList) {
    if (todo.title == 'norna') {
      print(todo.toString());
    }
  }
}
