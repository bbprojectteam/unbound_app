// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'member_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MemberModel _$MemberModelFromJson(Map<String, dynamic> json) => MemberModel()
  ..userId = (json['userId'] as num?)?.toInt()
  ..birth = json['birth'] as String?
  ..gender = json['gender'] as String?
  ..mmr = (json['mmr'] as num?)?.toInt()
  ..profileImage = json['profileImage'] as String?
  ..uid = json['uid'] as String?
  ..username = json['username'] as String?
  ..regionId = (json['regionId'] as num?)?.toInt()
  ..regionNm = json['regionNm'] as String?
  ..introduction = json['introduction'] as String?
  ..lastReadMessageId = json['lastReadMessageId'] as String?;

Map<String, dynamic> _$MemberModelToJson(MemberModel instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'birth': instance.birth,
      'gender': instance.gender,
      'mmr': instance.mmr,
      'profileImage': instance.profileImage,
      'uid': instance.uid,
      'username': instance.username,
      'regionId': instance.regionId,
      'regionNm': instance.regionNm,
      'introduction': instance.introduction,
      'lastReadMessageId': instance.lastReadMessageId,
    };
