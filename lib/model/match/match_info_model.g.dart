// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'match_info_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MatchInfoModel _$MatchInfoModelFromJson(Map<String, dynamic> json) =>
    MatchInfoModel()
      ..id = (json['id'] as num?)?.toInt()
      ..memberCnt = (json['memberCnt'] as num?)?.toInt()
      ..averageMmr = (json['averageMmr'] as num?)?.toDouble()
      ..chatRoomId = (json['chatRoomId'] as num?)?.toInt()
      ..name = json['name'] as String?
      ..regionId = (json['regionId'] as num?)?.toInt()
      ..location = json['location'] as String?
      ..desciption = json['desciption'] as String?
      ..matchDt = json['matchDt'] as String?;

Map<String, dynamic> _$MatchInfoModelToJson(MatchInfoModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'memberCnt': instance.memberCnt,
      'averageMmr': instance.averageMmr,
      'chatRoomId': instance.chatRoomId,
      'name': instance.name,
      'regionId': instance.regionId,
      'location': instance.location,
      'desciption': instance.desciption,
      'matchDt': instance.matchDt,
    };
