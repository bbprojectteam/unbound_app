
import 'package:json_annotation/json_annotation.dart';

part 'match_member_model.g.dart'; // 생성될 파일

@JsonSerializable()
class MatchMemberModel {

  int? userId;

  String? username;

  String? profileImage;

  String? lastReadMessageId;

  MatchMemberModel();

  factory MatchMemberModel.fromJson(Map<String, dynamic> json) => _$MatchMemberModelFromJson(json);
  Map<String, dynamic> toJson() => _$MatchMemberModelToJson(this);

}