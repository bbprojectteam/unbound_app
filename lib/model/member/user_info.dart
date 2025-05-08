
import 'package:json_annotation/json_annotation.dart';

part 'user_info.g.dart'; // 생성될 파일

@JsonSerializable()
class UserInfo {

  int? userId;
  String? birth;
  String? gender;
  int? mmr;
  String? profileImage;
  String? uid;
  String? username;
  int? regionId;
  String? regionNm;
  String? introduction;
  String? lastReadMessageId;
  int? matchCnt;

  UserInfo();

  factory UserInfo.fromJson(Map<String, dynamic> json) => _$UserInfoFromJson(json);
  Map<String, dynamic> toJson() => _$UserInfoToJson(this);

}