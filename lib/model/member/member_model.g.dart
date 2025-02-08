// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'member_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MemberModel _$MemberModelFromJson(Map<String, dynamic> json) => MemberModel()
  ..id = (json['id'] as num?)?.toInt()
  ..birth = json['birth'] as String?
  ..gender = json['gender'] as String?
  ..mmr = (json['mmr'] as num?)?.toInt()
  ..profileImage = json['profileImage'] as String?
  ..uid = json['uid'] as String?
  ..userName = json['userName'] as String?
  ..regionId = (json['regionId'] as num?)?.toInt();

Map<String, dynamic> _$MemberModelToJson(MemberModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'birth': instance.birth,
      'gender': instance.gender,
      'mmr': instance.mmr,
      'profileImage': instance.profileImage,
      'uid': instance.uid,
      'userName': instance.userName,
      'regionId': instance.regionId,
    };
