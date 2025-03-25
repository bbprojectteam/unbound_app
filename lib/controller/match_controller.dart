import 'dart:convert';

import 'package:badboys/model/match/match_info_model.dart';
import 'package:badboys/model/match/match_member_model.dart';
import 'package:badboys/model/match/match_model.dart';
import 'package:badboys/model/member/member_model.dart';
import 'package:badboys/utils/helpers.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class MatchController extends GetxController {

  var matchModel = MatchModel().obs;
  // var matchUpdateModel = MatchInfoModel();

  var isLoading = false.obs;  // 로딩 상태를 추적하는 변수
  var isMatch = false.obs;
  var isMatching = false.obs;
  var isApiCalled = false.obs;


  void clear() {
    matchModel.value = MatchModel(); // 상태 초기화
  }

  Future<void> fnMatchStart(int? limitRegionId) async {
    try {
      // POST 요청 보내기
      http.Response response = await Helpers.apiCall(
          '/service/match/queue/start',
          method: "POST",
          headers: {
            'Content-Type': 'application/json', // JSON 형식
          },
          body: {
            'limitRegionId' : limitRegionId,
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

    } finally {
      isLoading.value = false;
    }

  }


  Future<void> fnMatchInfo(String matchInfoId ) async {

    try {

      http.Response response = await Helpers.apiCall(
          '/service/chatRoom/${matchInfoId}/info',
          method: "GET",
          headers: {
            'Content-Type': 'application/json', // JSON 형식
          },
      );

      if (response.statusCode == 200) {
        final decodedBody = utf8.decode(response.bodyBytes);
        var jsonResponse = jsonDecode(decodedBody);

        clear();

        matchModel.value.matchInfoModel = MatchInfoModel.fromJson(jsonResponse['chatRoomInfo']);

        for (var item in jsonResponse['memberList']) {
          print(item);

          matchModel.value.matchMemberModel.add(MatchMemberModel.fromJson(item));
        }

      } else {
        // 오류 처리
        throw Exception('fnMatchInfo Failed');
      }

    } catch (error) {
      // 오류 처리
      print('fnMatchInfo Error: $error');

    } finally {
      isLoading.value = false;
    }

  }





}