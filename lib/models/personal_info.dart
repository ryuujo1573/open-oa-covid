import 'package:json_annotation/json_annotation.dart';
part 'personal_info.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class PersonalInfo {
  final String name;
  final String gender;
  final String id;
  final String departFrom;
  final Iterable<Itinerary> itinerary;
  final String arriveAt;
  final DateTime timeArrival;
  final String mobile;
  final Unit unit;

  PersonalInfo({
    required this.name,
    required this.gender,
    required this.departFrom,
    required this.itinerary,
    required this.arriveAt,
    required this.timeArrival,
    required this.id,
    required this.mobile,
    required this.unit,
  });

  factory PersonalInfo.fromJson(Map<String, dynamic> json) =>
      _$PersonalInfoFromJson(json);
  Map<String, dynamic> toJson() => _$PersonalInfoToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class Unit {
  final String? code;
  final String name;
  final String? depart;
  final String? office;

  Unit({
    required this.name,
    this.code,
    this.depart,
    this.office,
  });

  factory Unit.fromJson(Map<String, dynamic> json) => _$UnitFromJson(json);
  Map<String, dynamic> toJson() => _$UnitToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class Itinerary {
  final DateTime startPoint;
  final Duration? duration;
  final String location;

  Itinerary({
    required this.startPoint,
    required this.duration,
    required this.location,
  });

  factory Itinerary.fromJson(Map<String, dynamic> json) =>
      _$ItineraryFromJson(json);
  Map<String, dynamic> toJson() => _$ItineraryToJson(this);
}
