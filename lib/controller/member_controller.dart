import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:badboys/model/member/member_model.dart';
import 'package:badboys/utils/helpers.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';

class MemberController extends GetxController {

  var model = MemberModel().obs;
  var isLoading = false.obs;  // 로딩 상태를 추적하는 변수

  void clear() {
    model.value = MemberModel(); // 상태 초기화
  }

  Future<void> fnGetMemberInfo() async {

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
        print(decodedBody);
        var jsonResponse = jsonDecode(decodedBody);
        model.value = MemberModel.fromJson(jsonResponse['userInfo']);


        isLoading.value = false;

      } else if (response.statusCode == 404 || response.statusCode == 500 ) {
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


  Future<bool> fnSetMemberProfileImg(FilePickerResult profileImageFile, Uint8List _imageBytes) async {


    print('123123');
    var request = http.MultipartRequest(
      'POST',
      Uri.parse(dotenv.get('API_URL') + '/service/user/update/profileImage'),
    );

    try {
      // 이미지 파일 추가
      if (profileImageFile != null) {

        List<int> fileBytes = _imageBytes;

        // 바이트 배열을 멀티파트 파일로 추가
        request.files.add(
          http.MultipartFile.fromBytes(
            'profileImageFile', // 서버에서 받을 필드 이름
            fileBytes, // 선택한 파일의 바이트
            filename: profileImageFile.files.first.name, // 파일 이름
            contentType: MediaType('image', 'jpg'), // MIME 타입 (필요에 따라 수정)
          ),
        );

        // 요청 보내기
        var response = await request.send();

        if (response.statusCode == 200) {
          var responseBody = await http.Response.fromStream(response);
          var jsonResponse = jsonDecode(responseBody.body);
          if (jsonResponse['status'] == "200") {
            return true;
          }
        }else {
          print(response);
        }
      }
      return false;
    } catch (error) {
      // 오류 처리
      print('Error: $error');
      return false;
    }

    return true;
  }


  Future<bool> fnSetMemberInfo(memberNickName,memberBirth,memberGender) async {
    try {
      // POST 요청 보내기
      http.Response response = await Helpers.apiCall(
        '/service/user/update/info',
        method: "POST",
        headers: {
          'Content-Type': 'application/json', // JSON 형식
        },
        body : {
          "username" : memberNickName,
          "birth" : memberBirth,
          "gender" : memberGender,
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