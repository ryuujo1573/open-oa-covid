import 'package:json_annotation/json_annotation.dart';
part 'todo_info.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
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

  factory TodoInfo.fromJson(Map<String, dynamic> json) =>
      _$TodoInfoFromJson(json);
  Map<String, dynamic> toJson() => _$TodoInfoToJson(this);
}
