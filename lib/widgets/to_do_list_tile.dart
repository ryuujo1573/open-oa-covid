import 'package:flutter/material.dart';
import 'package:open_pms_flutter/models/todo_info.dart';

class TodoListTile extends StatelessWidget {
  const TodoListTile({
    super.key,
    required this.data,
  });

  final TodoInfo data;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 24,
      ),
      child: Text(data.description ?? data.todoType),
    );
  }
}
