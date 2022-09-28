// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'room_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RoomInfo _$RoomInfoFromJson(Map<String, dynamic> json) => RoomInfo(
      building: json['building'] as int,
      floor: json['floor'] as int,
      roomId: json['room_id'] as int,
      locationId: json['location_id'] as int,
      facilitiesInfo: (json['facilities_info'] as List<dynamic>)
          .map((e) => FacilityInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$RoomInfoToJson(RoomInfo instance) => <String, dynamic>{
      'building': instance.building,
      'floor': instance.floor,
      'room_id': instance.roomId,
      'location_id': instance.locationId,
      'facilities_info': instance.facilitiesInfo,
    };

FacilityInfo _$FacilityInfoFromJson(Map<String, dynamic> json) =>
    FacilityInfo();

Map<String, dynamic> _$FacilityInfoToJson(FacilityInfo instance) =>
    <String, dynamic>{};
