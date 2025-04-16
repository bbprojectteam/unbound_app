
import 'package:badboys/utils/helpers.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;


class CommentController extends GetxController {


  Future<void> fnInsertComment(Map<String, dynamic> commentData) async {

    try {
      // POST 요청 보내기
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


      } else {
        // 오류 처리
        throw Exception('fnMatchStart Failed');
      }

    } catch (error) {
      // 오류 처리
      print('fnMatchStart Error: $error');

    }

  }




}