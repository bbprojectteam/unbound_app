// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'team.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Team _$TeamFromJson(Map<String, dynamic> json) => Team()
  ..result = json['result'] as String?
  ..userList = (json['userList'] as List<dynamic>)
      .map((e) => UserInfo.fromJson(e as Map<String, dynamic>))
      .toList()
  ..teamId = (json['teamId'] as num?)?.toInt();

Map<String, dynamic> _$TeamToJson(Team instance) => <String, dynamic>{
      'result': instance.result,
      'userList': instance.userList,
      'teamId': instance.teamId,
    };
