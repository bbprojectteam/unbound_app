import 'dart:convert';

import 'package:badboys/model/member/member_model.dart';
import 'package:badboys/utils/helpers.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class MatchController extends GetxController {

  var model = MemberModel().obs;
  var isLoading = false.obs;  // 로딩 상태를 추적하는 변수
  var isMatch = false.obs;
  var isMatching = false.obs;

  void clear() {
    model.value = MemberModel(); // 상태 초기화
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
        final decodedBody = utf8.decode(response.bodyBytes);
        var jsonResponse = jsonDecode(decodedBody);
        print(jsonResponse);


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


  Future<void> fnMatchInfo(matchInfoId ) async {

    try {

      http.Response response = await Helpers.apiCall(
          '/service/match/info?matchInfoId=${matchInfoId}',
          method: "GET",
          headers: {
            'Content-Type': 'application/json', // JSON 형식
          },
      );

      if (response.statusCode == 200) {
        final decodedBody = utf8.decode(response.bodyBytes);
        var jsonResponse = jsonDecode(decodedBody);
        print(jsonResponse);


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





}