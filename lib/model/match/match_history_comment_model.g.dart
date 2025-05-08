// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'match_history_comment_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MatchHistoryCommentModel _$MatchHistoryCommentModelFromJson(
        Map<String, dynamic> json) =>
    MatchHistoryCommentModel()
      ..commentId = (json['commentId'] as num?)?.toInt()
      ..content = json['content'] as String?
      ..depth = (json['depth'] as num?)?.toInt()
      ..userId = (json['userId'] as num?)?.toInt()
      ..username = json['username'] as String?
      ..profileImage = json['profileImage'] as String?
      ..updatedAt = json['updatedAt'] as String?
      ..childList = (json['childList'] as List<dynamic>? ?? [])
          .map((e) => MatchHistoryCommentModel.fromJson(e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$MatchHistoryCommentModelToJson(
        MatchHistoryCommentModel instance) =>
    <String, dynamic>{
      'commentId': instance.commentId,
      'content': instance.content,
      'depth': instance.depth,
      'userId': instance.userId,
      'username': instance.username,
      'profileImage': instance.profileImage,
      'updatedAt': instance.updatedAt,
      'childList': instance.childList,
    };
