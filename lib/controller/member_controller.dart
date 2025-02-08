import 'package:badboys/model/member/member_model.dart';
import 'package:badboys/utils/helpers.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class MemberController extends GetxController {

  var model = MemberModel().obs;
  var isLoading = false.obs;  // 로딩 상태를 추적하는 변수

  void clear() {
    model.value = MemberModel(); // 상태 초기화
  }

  void fnGetMemberInfo() async {

    try {
      // POST 요청 보내기
      http.Response response = await Helpers.apiCall(
          '/service/main/info',
          headers: {
            'Content-Type': 'application/json', // JSON 형식
          },

      );

      if (response.statusCode == 200) {



      } else if (response.statusCode == 404) {
        print('프로필 설정 페이지로 이동');
        Get.toNamed("/profileSettingScreen");


      } else{
          // 오류 처리
          throw Exception('Failed to set playlist like');
        }

    } catch (error) {
      // 오류 처리
      print('Error: $error');
    } finally {
      isLoading.value = false;
    }

  }


  Future<bool> fnSetMemberInfo() async {
    try {
      // POST 요청 보내기
      http.Response response = await Helpers.apiCall(
        '/service/user/update',
        headers: {
          'Content-Type': 'application/json', // JSON 형식
        },
        body : {
          "username" : "test",
          "birth" : "123",
          "gender" : "M",
          "region" : "1"
        }

      );


      if (response.statusCode == 200) {

        print(response);

        return true;
      } else {
        // 오류 처리
        throw Exception('fnSetMemberInfo Failed');
      }

    } catch (error) {
      // 오류 처리
      print('fnSetMemberInfo Error: $error');
      return false;
    } finally {
      isLoading.value = false;
    }

  }





}