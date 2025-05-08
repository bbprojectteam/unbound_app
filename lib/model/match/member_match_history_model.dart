
import 'package:badboys/model/match/match_history_info_model.dart';
import 'package:badboys/model/match/match_info_model.dart';
import 'package:badboys/model/member/user_info.dart';
import 'package:json_annotation/json_annotation.dart';

part 'member_match_history_model.g.dart';

@JsonSerializable()
class MemberMatchHistoryModel {

  UserInfo? userInfo;
  List<MatchHistoryInfoModel> userMatchInfoList = [];

  MemberMatchHistoryModel();

  factory MemberMatchHistoryModel.fromJson(Map<String, dynamic> json) => _$MemberMatchHistoryModelFromJson(json);
  Map<String, dynamic> toJson() => _$MemberMatchHistoryModelToJson(this);
}