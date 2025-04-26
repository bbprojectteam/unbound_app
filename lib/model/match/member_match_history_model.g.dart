// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'member_match_history_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MemberMatchHistoryModel _$MemberMatchHistoryModelFromJson(
        Map<String, dynamic> json) =>
    MemberMatchHistoryModel()
      ..memberModel = json['memberModel'] == null
          ? null
          : MemberModel.fromJson(json['memberModel'] as Map<String, dynamic>)
      ..userMatchInfoList = (json['userMatchInfoList'] as List<dynamic>)
          .map((e) => MatchHistoryInfoModel.fromJson(e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$MemberMatchHistoryModelToJson(
        MemberMatchHistoryModel instance) =>
    <String, dynamic>{
      'memberModel': instance.memberModel,
      'userMatchInfoList': instance.userMatchInfoList,
    };
