// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'member_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MemberModel _$MemberModelFromJson(Map<String, dynamic> json) => MemberModel()
  ..memberId = (json['memberId'] as num?)?.toInt()
  ..memberEmail = json['memberEmail'] as String?
  ..memberNickName = json['memberNickName'] as String?
  ..memberImagePath = json['memberImagePath'] as String?
  ..memberDeviceToken = json['memberDeviceToken'] as String?;

Map<String, dynamic> _$MemberModelToJson(MemberModel instance) =>
    <String, dynamic>{
      'memberId': instance.memberId,
      'memberEmail': instance.memberEmail,
      'memberNickName': instance.memberNickName,
      'memberImagePath': instance.memberImagePath,
      'memberDeviceToken': instance.memberDeviceToken,
    };
