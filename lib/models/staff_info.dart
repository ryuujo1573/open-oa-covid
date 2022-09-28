import 'package:json_annotation/json_annotation.dart';
part 'staff_info.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class StaffInfo {
  final String name;
  final String id;
  final String mobile;
  final String gender;
  final DateTime registerTime;
  final bool isWorking;
  final String? nickname;

  StaffInfo({
    required this.registerTime,
    required this.isWorking,
    required this.name,
    required this.gender,
    required this.id,
    required this.mobile,
    this.nickname,
  });

  factory StaffInfo.fromJson(Map<String, dynamic> json) =>
      _$StaffInfoFromJson(json);
  Map<String, dynamic> toJson() => _$StaffInfoToJson(this);
}
