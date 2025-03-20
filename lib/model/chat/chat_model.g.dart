// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChatModel _$ChatModelFromJson(Map<String, dynamic> json) => ChatModel()
  ..messageId = json['messageId'] as String?
  ..senderId = (json['senderId'] as num?)?.toInt()
  ..username = json['username'] as String?
  ..profileImage = json['profileImage'] as String?
  ..message = json['message'] as String?
  ..createdAt = json['createdAt'] as String?
  ..unreadMemberCnt = (json['unreadMemberCnt'] as num?)?.toInt()
  ..isMyChat = json['isMyChat'] as bool?;

Map<String, dynamic> _$ChatModelToJson(ChatModel instance) => <String, dynamic>{
      'messageId': instance.messageId,
      'senderId': instance.senderId,
      'username': instance.username,
      'profileImage': instance.profileImage,
      'message': instance.message,
      'createdAt': instance.createdAt,
      'unreadMemberCnt': instance.unreadMemberCnt,
      'isMyChat': instance.isMyChat,
    };
