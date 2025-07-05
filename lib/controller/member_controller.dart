import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:badboys/model/match/member_match_history_model.dart';
import 'package:badboys/model/member/user_info.dart';
import 'package:badboys/router/app_bottom_modal_router.dart';
import 'package:badboys/utils/helpers.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';


class MemberController extends GetxController {

  UserInfo memberModel = UserInfo();
  UserInfo memberInfoModel = UserInfo();
  List<UserInfo> inviteMemberListModel = [];
  MemberMatchHistoryModel memberMatchHistoryModel = MemberMatchHistoryModel();

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

  String categorizeAgeGroup(String? birth) {

    if (birth == "" || birth == null) {
      return '';
    }

    String birthYear = birth.split('-')[0];

    int currentYear = DateTime.now().year;

    int age = currentYear - int.parse(birthYear);

    if (age >= 10 && age < 20) {
      return "10대";
    } else if (age >= 20 && age < 30) {
      return "20대";
    } else if (age >= 30 && age < 40) {
      return "30대";
    } else if (age >= 40 && age < 50) {
      return "40대";
     }else if (age >= 50 && age < 60) {
      return "50대";
    } else {
      return "50대";
    }
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

        memberMatchHistoryModel = MemberMatchHistoryModel();
        memberMatchHistoryModel = MemberMatchHistoryModel.fromJson(jsonResponse);
        print(memberMatchHistoryModel.userMatchInfoList[0].toJson());

        update();

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

  Future<bool> fnGetProfileInfo() async {

    try {
      // POST 요청 보내기
      http.Response response = await Helpers.apiCall(
          '/service/user/my/info',
          headers: {
            'Content-Type': 'application/json', // JSON 형식
          },
      );

      if (response.statusCode == 200) {

        final decodedBody = utf8.decode(response.bodyBytes);
        var jsonResponse = jsonDecode(decodedBody);

        memberModel = UserInfo();
        memberModel = UserInfo.fromJson(jsonResponse['userInfo']);

        Helpers.setMember(memberModel);
        Helpers.setMemberId(memberModel.userId.toString());
        Helpers.setRegionId(memberModel.regionId.toString());

        update();

        return true;
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
    return false;
  }
  
  
  Future<bool> fnGetInviteMemberList(String chatRoomId) async {

    try {
      http.Response response = await Helpers.apiCall(
        '/service/chatRoom/${chatRoomId}/invitation/list',
        headers: {
          'Content-Type': 'application/json', // JSON 형식
        },
      );

      if (response.statusCode == 200) {

        final decodedBody = utf8.decode(response.bodyBytes);
        var jsonResponse = jsonDecode(decodedBody);

        inviteMemberListModel = [];
        // memberModel = UserInfo.fromJson(jsonResponse['userInfo']);

        print(jsonResponse);

        update();

        return true;
      } else {
        // 오류 처리
        throw Exception('Failed to fnGetInviteMemberList');
      }

    } catch (error) {
      // 오류 처리
      print('Error: $error');
    } finally {
      isLoading.value = false;
    }
    return false;
  }

  Future<bool> fnSendInviteMember(String chatRoomId, String targetMemberId) async {

    try {
      http.Response response = await Helpers.apiCall(
          '/service/chatRoom/${chatRoomId}/invitation/${targetMemberId}',
          method: 'POST',
          headers: {
            'Content-Type': 'application/json', // JSON 형식
          },

      );

      if (response.statusCode == 200) {

        update();

        return true;
      } else {
        // 오류 처리
        throw Exception('Failed to fnGetInviteMemberList');
      }

    } catch (error) {
      // 오류 처리
      print('Error: $error');
    } finally {
      isLoading.value = false;
    }
    return false;
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
        return true;
      } else {
        throw Exception('fnSetMemberInfo Failed');
      }
    } catch (error) {
      print('fnSetMemberInfo Error: $error');
      return false;
    } finally {
      isLoading.value = false;
    }
  }
}