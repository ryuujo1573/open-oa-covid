class TodoInfo {
  String todoId;
  String todoType;
  String? business;
  String? description;

  TodoInfo({
    required this.todoId,
    required this.todoType,
    this.business,
    this.description,
  });
}
