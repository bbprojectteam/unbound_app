// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'match_history_comment_model.dart';

String? formatToDateOnly(String? dateTimeString) {
      if (dateTimeString == null) return null;

      // 문자열을 DateTime 객체로 변환
      DateTime dateTime = DateTime.parse(dateTimeString);

      // 원하는 형식으로 포맷 (yyyy-MM-dd)
      return DateFormat('yyyy-MM-dd').format(dateTime);
}

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
      ..updatedAt = formatToDateOnly(json['updatedAt'])
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
      'updatedAt': instance.updatedAt,
      'childList': instance.childList,
    };
