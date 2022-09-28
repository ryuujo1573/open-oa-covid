// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'personal_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PersonalInfo _$PersonalInfoFromJson(Map<String, dynamic> json) => PersonalInfo(
      name: json['name'] as String,
      gender: json['gender'] as String,
      departFrom: json['depart_from'] as String,
      itinerary: (json['itinerary'] as List<dynamic>)
          .map((e) => Itinerary.fromJson(e as Map<String, dynamic>)),
      arriveAt: json['arrive_at'] as String,
      timeArrival: DateTime.parse(json['time_arrival'] as String),
      id: json['id'] as String,
      mobile: json['mobile'] as String,
      unit: Unit.fromJson(json['unit'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PersonalInfoToJson(PersonalInfo instance) =>
    <String, dynamic>{
      'name': instance.name,
      'gender': instance.gender,
      'id': instance.id,
      'depart_from': instance.departFrom,
      'itinerary': instance.itinerary.toList(),
      'arrive_at': instance.arriveAt,
      'time_arrival': instance.timeArrival.toIso8601String(),
      'mobile': instance.mobile,
      'unit': instance.unit,
    };

Unit _$UnitFromJson(Map<String, dynamic> json) => Unit(
      name: json['name'] as String,
      code: json['code'] as String?,
      depart: json['depart'] as String?,
      office: json['office'] as String?,
    );

Map<String, dynamic> _$UnitToJson(Unit instance) => <String, dynamic>{
      'code': instance.code,
      'name': instance.name,
      'depart': instance.depart,
      'office': instance.office,
    };

Itinerary _$ItineraryFromJson(Map<String, dynamic> json) => Itinerary(
      startPoint: DateTime.parse(json['start_point'] as String),
      duration: json['duration'] == null
          ? null
          : Duration(microseconds: json['duration'] as int),
      location: json['location'] as String,
    );

Map<String, dynamic> _$ItineraryToJson(Itinerary instance) => <String, dynamic>{
      'start_point': instance.startPoint.toIso8601String(),
      'duration': instance.duration?.inMicroseconds,
      'location': instance.location,
    };
