class Todo {
  final String title;
  final String description;
  final bool completed;
  final int id;

  Todo(this.id, this.title, this.description, this.completed);

  // convert our model to json
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['title'] = title;
    data['description'] = description;
    data['completed'] = completed;
    return data;
  }

  // convert json to dart model
  factory Todo.fromJson(json) {
    return Todo(
      json['id'],
      json['title'],
      json['description'],
      json['completed'],
    );
  }

  @override
  String toString() {
    return 'ID: $id: $title, Description: $description, Completed: ${completed ? 'yes' : 'no'}';
  }
}
