import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:badboys/model/member/member_model.dart';
import 'package:badboys/router/app_bottom_modal_router.dart';
import 'package:badboys/utils/helpers.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';


class MemberController extends GetxController {

  var model = MemberModel().obs;
  var memberInfoModel = MemberModel().obs;

  var isLoading = false.obs;  // 로딩 상태를 추적하는 변수
  var reginonNm = "지역 선택".obs;
  var villageNm = "동네 선택".obs;
  var isReginonSelected = false.obs;
  var isVillageSelected = false.obs;
  var isAuth = false.obs;

  TextEditingController nickNmTextEdController = TextEditingController();
  TextEditingController birthTextEdController = TextEditingController();
  TextEditingController introductionTextEdController = TextEditingController();


  void clear() {
    isLoading = false.obs;  // 로딩 상태를 추적하는 변수
    reginonNm = "지역 선택".obs;
    villageNm = "동네 선택".obs;
    isReginonSelected = false.obs;
    isVillageSelected = false.obs;

    nickNmTextEdController = TextEditingController();
    birthTextEdController = TextEditingController();
    introductionTextEdController = TextEditingController();
  }


  Future<void> fnGetMemberInfo(int? memberId) async {

    try {
      // POST 요청 보내기
      http.Response response = await Helpers.apiCall(
        '/service/user/${memberId}/info',
        headers: {
          'Content-Type': 'application/json', // JSON 형식
        },

      );

      if (response.statusCode == 200) {

        final decodedBody = utf8.decode(response.bodyBytes);
        var jsonResponse = jsonDecode(decodedBody);

        memberInfoModel.value = MemberModel();
        memberInfoModel.value = MemberModel.fromJson(jsonResponse);
        isLoading.value = false;

      } else{
        // 오류 처리
        throw Exception('Failed to fnGetMemberInfo');
      }

    } catch (error) {
      // 오류 처리
      print('Error: $error');
    } finally {
      isLoading.value = false;
    }

  }


  Future<void> fnGetProfileInfo() async {

    try {
      // POST 요청 보내기
      http.Response response = await Helpers.apiCall(
          '/service/main/info',
          headers: {
            'Content-Type': 'application/json', // JSON 형식
          },

      );

      if (response.statusCode == 200) {

        final decodedBody = utf8.decode(response.bodyBytes);
        var jsonResponse = jsonDecode(decodedBody);
        print(jsonResponse);

        model.value = MemberModel();
        model.value = MemberModel.fromJson(jsonResponse['userInfo']);

        Helpers.setMemberId(model.value.userId.toString());
        isLoading.value = false;

      } else if (response.statusCode == 404 || response.statusCode == 500 ) {
        Get.toNamed("/profileSettingScreen");
      } else{
          // 오류 처리
          throw Exception('Failed to fnGetMemberInfo');
        }

    } catch (error) {
      // 오류 처리
      print('Error: $error');
    } finally {
      isLoading.value = false;
    }

  }

  Future<bool> fnSetMemberProfileImg(FilePickerResult profileImageFile, Uint8List _imageBytes) async {

    try {
      http.Response response = await Helpers.apiCall(
         '/service/user/update/profileImage',
          method: "POST",
          headers: {
            'Content-Type': 'application/json', // JSON 형식
          },
          file: http.MultipartFile.fromBytes(
            'profileImageFile', // 서버에서 받을 필드 이름
            _imageBytes, // 선택한 파일의 바이트
            filename: profileImageFile.files.first.name, // 파일 이름
            contentType: MediaType('image', 'jpg'), // MIME 타입 (필요에 따라 수정)
          )
      );

    if (response.statusCode == 200) {
      return true;
    }
      return false;
    } catch (error) {
      // 오류 처리
      print('Error: $error');
      return false;
    }

  }


  Future<bool> fnSetMemberInfo(Map<String, String> requestMap) async {

    print(requestMap['memberIntroduction']);

    try {

      // POST 요청 보내기
      http.Response response = await Helpers.apiCall(
        '/service/user/update/info',
        method: "POST",
        headers: {
          'Content-Type': 'application/json', // JSON 형식
        },
        body : {
          "username" : requestMap['memberNickName'],
          "birth" : requestMap['memberBirth'],
          "gender" : requestMap['memberGender'],
          "introduction" : requestMap['memberIntroduction'],
          "regionId" : 1
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