// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'match_history_info_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MatchHistoryInfoModel _$MatchHistoryInfoModelFromJson(
        Map<String, dynamic> json) =>
    MatchHistoryInfoModel()
      ..matchInfoId = (json['matchInfoId'] as num?)?.toInt()
      ..matchName = json['matchName'] as String?
      ..startAt = json['startAt'] as String?
      ..endAt = json['endAt'] as String?
      ..regionId = (json['regionId'] as num?)?.toInt()
      ..teamList = (json['teamList'] as List<dynamic>)
          .map((e) => Team.fromJson(e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$MatchHistoryInfoModelToJson(
        MatchHistoryInfoModel instance) =>
    <String, dynamic>{
      'matchInfoId': instance.matchInfoId,
      'matchName': instance.matchName,
      'startAt': instance.startAt,
      'endAt': instance.endAt,
      'regionId': instance.regionId,
      'teamList': instance.teamList,
    };
