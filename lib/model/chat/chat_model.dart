
import 'package:json_annotation/json_annotation.dart';

part 'chat_model.g.dart';

@JsonSerializable()
class ChatModel {

  String? messageId;

  int? senderId;

  String? username;

  String? profileImage;

  String? message;

  String? createdAt;

  int? unreadMemberCnt;

  bool? isMyChat;

  ChatModel();

  factory ChatModel.fromJson(Map<String, dynamic> json) => _$ChatModelFromJson(json);
  Map<String, dynamic> toJson() => _$ChatModelToJson(this);


}