import 'package:badboys/model/member/member_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'team.g.dart';

@JsonSerializable()
class Team {

  String? result;
  List<MemberModel> userList = [];
  int? teamId;

  Team();

  factory Team.fromJson(Map<String, dynamic> json) => _$TeamFromJson(json);
  Map<String, dynamic> toJson() => _$TeamToJson(this);

}