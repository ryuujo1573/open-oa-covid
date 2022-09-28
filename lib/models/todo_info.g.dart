// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TodoInfo _$TodoInfoFromJson(Map<String, dynamic> json) => TodoInfo(
      todoId: json['todo_id'] as String,
      todoType: json['todo_type'] as String,
      business: json['business'] as String?,
      description: json['description'] as String?,
    );

Map<String, dynamic> _$TodoInfoToJson(TodoInfo instance) => <String, dynamic>{
      'todo_id': instance.todoId,
      'todo_type': instance.todoType,
      'business': instance.business,
      'description': instance.description,
    };
