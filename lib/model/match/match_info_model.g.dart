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
      ..description = json['description'] as String?
      ..matchDt = json['matchDt'] as String?
      ..backBoardYn = json['backBoardYn'] as String?
      ..ballYn = json['ballYn'] as String?
      ..halfCourtYn = json['halfCourtYn'] as String?
      ..refereeYn = json['refereeYn'] as String?
      ..threeOnThreeYn = json['threeOnThreeYn'] as String?
      ..threePointLimitYn = json['threePointLimitYn'] as String?;

Map<String, dynamic> _$MatchInfoModelToJson(MatchInfoModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'memberCnt': instance.memberCnt,
      'averageMmr': instance.averageMmr,
      'chatRoomId': instance.chatRoomId,
      'name': instance.name,
      'regionId': instance.regionId,
      'location': instance.location,
      'description': instance.description,
      'matchDt': instance.matchDt,
      'backBoardYn': instance.backBoardYn,
      'ballYn': instance.ballYn,
      'halfCourtYn': instance.halfCourtYn,
      'refereeYn': instance.refereeYn,
      'threeOnThreeYn': instance.threeOnThreeYn,
      'threePointLimitYn': instance.threePointLimitYn,
    };
