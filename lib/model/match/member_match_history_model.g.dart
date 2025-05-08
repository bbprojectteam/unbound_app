// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'member_match_history_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MemberMatchHistoryModel _$MemberMatchHistoryModelFromJson(
        Map<String, dynamic> json) =>
    MemberMatchHistoryModel()
      ..userInfo = json['userInfo'] == null
          ? null
          : UserInfo.fromJson(json['userInfo'] as Map<String, dynamic>)
      ..userMatchInfoList = (json['userMatchInfoList'] as List<dynamic>)
          .map((e) => MatchHistoryInfoModel.fromJson(e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$MemberMatchHistoryModelToJson(
        MemberMatchHistoryModel instance) =>
    <String, dynamic>{
      'memberModel': instance.userInfo,
      'userMatchInfoList': instance.userMatchInfoList,
    };
