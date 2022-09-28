// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'staff_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StaffInfo _$StaffInfoFromJson(Map<String, dynamic> json) => StaffInfo(
      registerTime: DateTime.parse(json['register_time'] as String),
      isWorking: json['is_working'] as bool,
      name: json['name'] as String,
      gender: json['gender'] as String,
      id: json['id'] as String,
      mobile: json['mobile'] as String,
      nickname: json['nickname'] as String?,
    );

Map<String, dynamic> _$StaffInfoToJson(StaffInfo instance) => <String, dynamic>{
      'name': instance.name,
      'id': instance.id,
      'mobile': instance.mobile,
      'gender': instance.gender,
      'register_time': instance.registerTime.toIso8601String(),
      'is_working': instance.isWorking,
      'nickname': instance.nickname,
    };
