
import 'package:json_annotation/json_annotation.dart';

part 'match_info_model.g.dart'; // 생성될 파일

@JsonSerializable()
class MatchInfoModel {

  int? id;

  int? chatRoomId;

  String? name;

  int? regionId;

  String? location;

  double? averageMmr;

  String? description;

  int? memberCnt;

  String? matchDt;

  MatchInfoModel();

  factory MatchInfoModel.fromJson(Map<String, dynamic> json) => _$MatchInfoModelFromJson(json);
  Map<String, dynamic> toJson() => _$MatchInfoModelToJson(this);


}