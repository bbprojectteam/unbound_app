
import 'package:intl/intl.dart';
import 'package:json_annotation/json_annotation.dart';

part 'match_history_comment_model.g.dart';

@JsonSerializable()
class MatchHistoryCommentModel {

  int? commentId;
  String? content;
  int? depth;
  int? userId;
  String? username;
  String? profileImage;
  String? updatedAt;
  String? useYn;
  List<MatchHistoryCommentModel> childList = [];

  MatchHistoryCommentModel();

  factory MatchHistoryCommentModel.fromJson(Map<String, dynamic> json) => _$MatchHistoryCommentModelFromJson(json);
  Map<String, dynamic> toJson() => _$MatchHistoryCommentModelToJson(this);

}