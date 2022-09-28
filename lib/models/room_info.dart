import 'package:json_annotation/json_annotation.dart';
part 'room_info.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class RoomInfo {
  final int building;
  final int floor;
  final int roomId;
  final int locationId;
  final List<FacilityInfo> facilitiesInfo;

  const RoomInfo({
    required this.building,
    required this.floor,
    required this.roomId,
    required this.locationId,
    required this.facilitiesInfo,
  });

  factory RoomInfo.fromJson(Map<String, dynamic> json) =>
      _$RoomInfoFromJson(json);
  Map<String, dynamic> toJson() => _$RoomInfoToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class FacilityInfo {
  const FacilityInfo();

  factory FacilityInfo.fromJson(Map<String, dynamic> json) =>
      _$FacilityInfoFromJson(json);
  Map<String, dynamic> toJson() => _$FacilityInfoToJson(this);
}
