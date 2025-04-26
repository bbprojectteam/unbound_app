
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

  Future<bool> fnSelectComment(int matchInfoId) async {

    try {
      http.Response response = await Helpers.apiCall(
          '/service/match/info?matchInfoId=${matchInfoId}',
          method: "GET",
          headers: {
            'Content-Type': 'application/json', // JSON 형식
          },
      );

      if (response.statusCode == 200) {

        matchHistoryCommentModel = [];

        var utf8Body = utf8.decode(response.bodyBytes);
        var commentList = jsonDecode(utf8Body)['commentList'];

        for (var item in commentList) {
          matchHistoryCommentModel.add(MatchHistoryCommentModel.fromJson(item));
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
            "content": commentData['content']
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