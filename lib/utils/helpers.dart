

import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:badboys/auth/auth_service.dart';
import 'package:badboys/model/member/user_info.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:http/http.dart' as http;
import 'package:image_cropper/image_cropper.dart';
import 'package:shared_preferences/shared_preferences.dart';


class Helpers {

  static Future<void> setMember(UserInfo memberModel) async {
    // SharedPreferences에 저장
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String memberJson = jsonEncode(memberModel.toJson());

    await prefs.setString('member', memberJson);
  }

  static Future<UserInfo> getMember() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    String? member = prefs.getString('member');

    if (member != null) {
      Map<String, dynamic> memberMap = jsonDecode(member);

      return UserInfo.fromJson(memberMap);
    } else {
      throw Exception('No member data found');
    }
  }

  static Future<void> setMemberId(String userId) async {
    // SharedPreferences에 저장
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('memberId', userId);
  }

  static Future<int> getMemberId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    return int.parse(prefs.getString("memberId").toString());
  }


  static Future<void> setRegionId(String regionId) async {
    // SharedPreferences에 저장
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('regionId', regionId);
  }

  static Future<int> getRegionId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    return int.parse(prefs.getString("regionId").toString());
  }

  static void customFlutterToast(String message)  {

     Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT, // 토스트의 길이 (짧거나 길게 설정)
      gravity: ToastGravity.BOTTOM,  // 토스트 위치 (BOTTOM, CENTER, TOP)
      timeInSecForIosWeb: 1,         // iOS/Web에서의 지속 시간 설정
      backgroundColor: Colors.black, // 배경색
      textColor: Colors.white,       // 텍스트 색
      fontSize: 16.0,                // 폰트 크기
    );
  }

  static Future<FilePickerResult> convertUint8ListToFilePickerResult(Uint8List imageBytes, int size) async {
    final tempFile = await _writeToTempFile(imageBytes);

    return FilePickerResult([PlatformFile(path: tempFile.path, name: 'image.jpg}', size: size)]);
  }

  static Future<File> _writeToTempFile(Uint8List bytes) async {

    final tempDir = Directory.systemTemp;
    final tempFile = File('${tempDir.path}/image_${DateTime.now().millisecondsSinceEpoch}.jpg');

    await tempFile.writeAsBytes(bytes);

    return tempFile;
  }



  static Future<Uint8List?> cropImage(String imagePath) async {
    CroppedFile? croppedFile = await ImageCropper().cropImage(
      sourcePath: imagePath,
      aspectRatio: CropAspectRatio(ratioX: 1.0, ratioY: 1.0),
    );

    if (croppedFile != null) {
      return await File(croppedFile.path).readAsBytes();
    } else {
      return null; // croppedFile이 null인 경우 null 반환
    }
  }


  static Future<dynamic> apiCall(
      String url, {
        String method = 'GET',  // 기본값 'GET'
        Map<String, String>? headers,  // 요청 헤더 (optional)
        Map<String, dynamic>? body,    // 요청 바디 (optional)
        http.MultipartFile? file, // 파일 첨부 (optional)
        bool isGetRefreshToken = false,
      }) async {

    /**
     * 개발용
     */
    // await Future.delayed(Duration(seconds: 1));

    try {

      var uri = Uri.parse(dotenv.get("API_URL") + url);
      print('공통 API 호출 : $uri');
      var request;
      const storage = FlutterSecureStorage();

      if(isGetRefreshToken){
        String? refreshToken = await storage.read(key: "refresh_token");
        if (refreshToken != null){
            headers ??= {};  // headers가 null인 경우 빈 맵으로 초기화
            headers['Refresh-Token'] = refreshToken;  // 액세스 토큰을 Authorization 헤더에 추가
        }
      } else {
        String? jwtToken = await storage.read(key: "jwt_token");
        if (jwtToken != null){
          headers ??= {};  // headers가 null인 경우 빈 맵으로 초기화
          if(!url.startsWith("/auth/")){
            headers['Authorization'] = jwtToken;  // 액세스 토큰을 Authorization 헤더에 추가
          }
        }
      }

      if (method == 'POST') {
        // POST 요청 처리
        if (file != null) {
          // 파일이 있는 경우 Multipart 요청 사용
          request = http.MultipartRequest('POST', uri)
            ..headers.addAll(headers ?? {})
            ..files.add(file);

          // 바디 추가
          if (body != null) {
            body.forEach((key, value) {
              request.fields[key] = value;
            });
          }
        } else {
          // 바디가 있는 일반 POST 요청 처리
          request = http.Request('POST', uri)
            ..headers.addAll(headers ?? {})
            ..body = json.encode(body);
        }

        // POST 요청 보내기
        var response = await request.send();
        var httpResponse = await http.Response.fromStream(response);
        // if (httpResponse.body.isEmpty) {
        //   print('response 데이터 없음');
        //   return null; // 빈 본문 처리
        // }
        return await _processResponse(httpResponse, url, method, headers, body, file); // 다시 호출
      } else if (method == 'GET') {
        // GET 요청 처리


        var response = await http.get(uri, headers: headers);
        return await _processResponse(response, url, method, headers, body, file);

      } else {
        throw Exception('Unsupported HTTP method');
      }
    } catch (error) {
      // 오류 처리
      print('Comn ApiCall Error: $error');
      return null;
    }
  }

  static Future<dynamic> _processResponse(
      http.Response response,
      String url,
      String method,
      Map<String, String>? headers,
      Map<String, dynamic>? body,
      http.MultipartFile? file) async {


    print(response.statusCode);

    if(url.startsWith("/auth/refresh")) {
      return response;
    }

    if (response.statusCode == 200 || response.statusCode == 201 || response.statusCode == 204) {
      return response;
    } else if (response.statusCode == 401) {

      //터미너스

      // Refresh 토큰을 사용하여 새로운 JWT 토큰을 얻어오는 로직
      http.Response refreshResponse = await _getRefreshToken();

      if (refreshResponse.statusCode != 200) {
        AuthService authService = AuthService();
        await authService.signOut();
        Get.toNamed('/splash'); // 인증 실패 시 스플래시 화면으로 이동
        return null;
      }

      const storage = FlutterSecureStorage();
      await storage.write(key: "jwt_token", value: "Bearer " + refreshResponse.body);  // JWT 토큰 저장
      // 새로운 토큰을 사용하여 원래의 API 호출을 재시도
      return await apiCall(url, method: method, headers: headers, body: body, file: file,isGetRefreshToken: false);

    } else {
      print('Failed request with status: ${response.statusCode}');
      return response;
    }
  }


  static Future<http.Response> _getRefreshToken() async {

    http.Response response = await Helpers.apiCall(
      '/auth/refresh',
      method: "POST",
      headers: {
        'Content-Type': 'application/json', // JSON 형식
      },
      isGetRefreshToken: true
    );

    return response;
  }



  static Future<void> fnSetRegionList() async {

    try {

      http.Response response = await Helpers.apiCall(
          '/service/region/list',
          method: "GET",
          headers: {
            'Content-Type': 'application/json', // JSON 형식
          },
      );


      if (response.statusCode == 200) {
        final decodedBody = utf8.decode(response.bodyBytes);
        // var jsonResponse = jsonDecode(decodedBody);
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString('regionList', decodedBody);

      } else {
        // 오류 처리
        throw Exception('fnSetRegionList Failed');
      }

    } catch (error) {
      print('fnSetRegionList Error: $error');

    }
  }
















}