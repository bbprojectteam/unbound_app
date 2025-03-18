
import 'package:json_annotation/json_annotation.dart';

part 'match_info_model.g.dart'; // 생성될 파일

@JsonSerializable()
class MatchInfoModel {

  int? id;

  String? name;

  int? regionId;

  String? location;

  String? desciption;

  MatchInfoModel();

  factory MatchInfoModel.fromJson(Map<String, dynamic> json) => _$MatchInfoModelFromJson(json);
  Map<String, dynamic> toJson() => _$MatchInfoModelToJson(this);


}