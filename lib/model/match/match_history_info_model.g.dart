// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'match_history_info_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MatchHistoryInfoModel _$MatchHistoryInfoModelFromJson(
        Map<String, dynamic> json) =>
    MatchHistoryInfoModel()
      ..matchInfoId = (json['matchInfoId'] as num?)?.toInt()
      ..latitude = (json['latitude'] as num?)?.toDouble()
      ..longitude = (json['longitude'] as num?)?.toDouble()
      ..matchName = json['matchName'] as String?
      ..startAt = json['startAt'] as String?
      ..endAt = json['endAt'] as String?
      ..location = json['location'] as String?
      ..regionId = (json['regionId'] as num?)?.toInt()
      ..teamList = (json['teamList'] as List<dynamic>)
          .map((e) => Team.fromJson(e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$MatchHistoryInfoModelToJson(
        MatchHistoryInfoModel instance) =>
    <String, dynamic>{
      'matchInfoId': instance.matchInfoId,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'matchName': instance.matchName,
      'startAt': instance.startAt,
      'endAt': instance.endAt,
      'location': instance.location,
      'regionId': instance.regionId,
      'teamList': instance.teamList,
    };
