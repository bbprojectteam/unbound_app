
import 'package:json_annotation/json_annotation.dart';

part 'member_model.g.dart'; // 생성될 파일

@JsonSerializable()
class MemberModel {


  int? id;
  String? birth;
  String? gender;
  int? mmr;
  String? profileImage;
  String? uid;
  String? userName;
  int? regionId;


  MemberModel();

  factory MemberModel.fromJson(Map<String, dynamic> json) => _$MemberModelFromJson(json);
  Map<String, dynamic> toJson() => _$MemberModelToJson(this);

}