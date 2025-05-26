

import 'package:badboys/model/match/team.dart';
import 'package:json_annotation/json_annotation.dart';

part 'match_history_info_model.g.dart';

@JsonSerializable()
class MatchHistoryInfoModel {

   int? matchInfoId;
   String? matchName;
   String? startAt;
   String? endAt;
   int? regionId;
   List<Team> teamList = [];

  MatchHistoryInfoModel();

  factory MatchHistoryInfoModel.fromJson(Map<String, dynamic> json) => _$MatchHistoryInfoModelFromJson(json);
  Map<String, dynamic> toJson() => _$MatchHistoryInfoModelToJson(this);


}