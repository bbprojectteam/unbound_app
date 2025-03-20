// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'match_member_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MatchMemberModel _$MatchMemberModelFromJson(Map<String, dynamic> json) =>
    MatchMemberModel()
      ..userId = (json['userId'] as num?)?.toInt()
      ..username = json['username'] as String?
      ..profileImage = json['profileImage'] as String?
      ..lastReadMessageId = json['lastReadMessageId'] as String?;

Map<String, dynamic> _$MatchMemberModelToJson(MatchMemberModel instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'username': instance.username,
      'profileImage': instance.profileImage,
      'lastReadMessageId': instance.lastReadMessageId,
    };
