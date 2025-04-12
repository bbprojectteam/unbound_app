
import 'package:json_annotation/json_annotation.dart';

part 'match_info_model.g.dart'; // 생성될 파일

@JsonSerializable()
class MatchInfoModel {

  int? matchInfoId;

  int? chatRoomId;

  String? name;

  int? regionId;

  String? location;

  double? averageMmr;

  String? description;

  int? memberCnt;

  String? matchDt;

  String? backBoardYn;

  String? ballYn;

  String? halfCourtYn;

  String? refereeYn;

  String? threeOnThreeYn;

  String? threePointLimitYn;





  MatchInfoModel();

  factory MatchInfoModel.fromJson(Map<String, dynamic> json) => _$MatchInfoModelFromJson(json);
  Map<String, dynamic> toJson() => _$MatchInfoModelToJson(this);


}