// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'match_info_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MatchInfoModel _$MatchInfoModelFromJson(Map<String, dynamic> json) =>
    MatchInfoModel()
      ..id = (json['id'] as num?)?.toInt()
      ..name = json['name'] as String?
      ..regionId = (json['regionId'] as num?)?.toInt()
      ..location = json['location'] as String?
      ..desciption = json['desciption'] as String?;

Map<String, dynamic> _$MatchInfoModelToJson(MatchInfoModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'regionId': instance.regionId,
      'location': instance.location,
      'desciption': instance.desciption,
    };
