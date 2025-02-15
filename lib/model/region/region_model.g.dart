// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'region_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegionModel _$RegionModelFromJson(Map<String, dynamic> json) => RegionModel()
  ..id = (json['id'] as num?)?.toInt()
  ..name = json['name'] as String?
  ..type = json['type'] as String?
  ..depth = (json['depth'] as num?)?.toInt()
  ..parentId = (json['parentId'] as num?)?.toInt();

Map<String, dynamic> _$RegionModelToJson(RegionModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'type': instance.type,
      'depth': instance.depth,
      'parentId': instance.parentId,
    };
