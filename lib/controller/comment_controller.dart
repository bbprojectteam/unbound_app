
import 'dart:convert';

import 'package:badboys/model/match/match_history_comment_model.dart';
import 'package:badboys/utils/helpers.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;


class CommentController extends GetxController {

  List<MatchHistoryCommentModel> matchHistoryCommentModel = <MatchHistoryCommentModel>[];

  String formatUpdatedAt(String dateString) {
    DateTime date = DateTime.parse(dateString);
    return "${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}";
  }


  List<MatchHistoryCommentModel> extractAllChildListsIteratively(List<MatchHistoryCommentModel> comments) {
    List<MatchHistoryCommentModel> allChildLists = [];
    List<MatchHistoryCommentModel> stack = List.from(comments);

    while (stack.isNotEmpty) {
      MatchHistoryCommentModel comment = stack.removeLast();

      if (comment.childList != null && comment.childList.isNotEmpty) {
        allChildLists.addAll(comment.childList);
        stack.addAll(comment.childList);
      }
    }

    return allChildLists;
  }


  Future<bool> fnSelectComment(int matchInfoId) async {

    try {
      http.Response response = await Helpers.apiCall(
          '/service/match/info?matchInfoId=${matchInfoId}',
          headers: {
            'Content-Type': 'application/json',
          },
      );

      if (response.statusCode == 200) {

        matchHistoryCommentModel = [];

        var utf8Body = utf8.decode(response.bodyBytes);
        var commentList = jsonDecode(utf8Body)['commentList'];

        for (var item in commentList) {

          MatchHistoryCommentModel comment = MatchHistoryCommentModel.fromJson(item);

          if (comment.childList.isNotEmpty) {
            List<MatchHistoryCommentModel> allChildComments = extractAllChildListsIteratively(comment.childList);
            comment.childList.addAll(allChildComments);
          }

          comment.childList.sort((a, b) {
            int idA = a.commentId!;
            int idB = b.commentId!;
            return idA.compareTo(idB);
          });

          matchHistoryCommentModel.add(comment);
        }

        update();

        return true;
      } else {
        throw Exception('fnSelectComment Failed');
      }

    } catch (error) {
      print('fnSelectComment Error: $error');
    }
    return false;
  }

  Future<void> fnInsertComment(int? matchInfoId, Map<String, dynamic> commentData) async {


    print('댓글 입력');
    print(commentData);


    try {
      http.Response response = await Helpers.apiCall(
          '/service/match/comment/update',
          method: "POST",
          headers: {
            'Content-Type': 'application/json', // JSON 형식
          },
          body: {
            "commentId": commentData['commentId'],
            "matchInfoId": commentData['matchInfoId'],
            "parentId": commentData['parentId'],
            "depth": commentData['depth'],
            "content": commentData['content'],
            "useYn" : commentData['useYn']
          }
      );

      if (response.statusCode == 200) {
        fnSelectComment(matchInfoId!);
      } else {
        throw Exception('fnMatchStart Failed');
      }

    } catch (error) {
      print('fnMatchStart Error: $error');
    }
  }
}