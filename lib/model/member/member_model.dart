
import 'package:json_annotation/json_annotation.dart';

part 'member_model.g.dart'; // 생성될 파일

@JsonSerializable()
class MemberModel {


  int? memberId;
  String? memberEmail;
  String? memberNickName;
  String? memberImagePath;
  String? memberDeviceToken;

  MemberModel();

  factory MemberModel.fromJson(Map<String, dynamic> json) => _$MemberModelFromJson(json);
  Map<String, dynamic> toJson() => _$MemberModelToJson(this);

}