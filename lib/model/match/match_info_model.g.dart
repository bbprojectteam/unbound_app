// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'match_info_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MatchInfoModel _$MatchInfoModelFromJson(Map<String, dynamic> json) =>
    MatchInfoModel()
      ..matchInfoId = (json['matchInfoId'] as num?)?.toInt()
      ..chatRoomId = (json['chatRoomId'] as num?)?.toInt()
      ..name = json['name'] as String?
      ..regionId = (json['regionId'] as num?)?.toInt()
      ..longitude = (json['longitude'] as num?)?.toDouble()
      ..latitude = (json['latitude'] as num?)?.toDouble()
      ..location = json['location'] as String?
      ..averageMmr = (json['averageMmr'] as num?)?.toDouble()
      ..description = json['description'] as String?
      ..memberCnt = (json['memberCnt'] as num?)?.toInt()
      ..matchDt = json['matchDt'] as String?
      ..backBoardYn = json['backBoardYn'] as String?
      ..ballYn = json['ballYn'] as String?
      ..halfCourtYn = json['halfCourtYn'] as String?
      ..refereeYn = json['refereeYn'] as String?
      ..threeOnThreeYn = json['threeOnThreeYn'] as String?
      ..threePointLimitYn = json['threePointLimitYn'] as String?;

Map<String, dynamic> _$MatchInfoModelToJson(MatchInfoModel instance) =>
    <String, dynamic>{
      'matchInfoId': instance.matchInfoId,
      'chatRoomId': instance.chatRoomId,
      'name': instance.name,
      'regionId': instance.regionId,
      'location': instance.location,
      'averageMmr': instance.averageMmr,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'description': instance.description,
      'memberCnt': instance.memberCnt,
      'matchDt': instance.matchDt,
      'backBoardYn': instance.backBoardYn,
      'ballYn': instance.ballYn,
      'halfCourtYn': instance.halfCourtYn,
      'refereeYn': instance.refereeYn,
      'threeOnThreeYn': instance.threeOnThreeYn,
      'threePointLimitYn': instance.threePointLimitYn,
    };
