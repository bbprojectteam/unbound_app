

import 'dart:convert';
import 'dart:io';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:http/http.dart' as http;

class Helpers {


  // static Future<String> getMemberId() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //
  //   return prefs.getString("memberId") ?? '';
  //
  // }


  static Future<dynamic> apiCall(
      String url, {
        String method = 'GET',  // 기본값 'GET'
        Map<String, String>? headers,  // 요청 헤더 (optional)
        Map<String, dynamic>? body,    // 요청 바디 (optional)
        File? file, // 파일 첨부 (optional)
        bool isGetRefreshToken = false,
      }) async {
    try {
      var uri = Uri.parse(dotenv.get("API_URL") + url);
      print('공통 API 호출 : $uri');
      var request;
      const storage = FlutterSecureStorage();

      String? refreshToken = await storage.read(key: "refresh_token");
      String? jwtToken = await storage.read(key: "jwt_token");
      print("꺼내온값 : " + refreshToken.toString());
      print("꺼내온값 : " + jwtToken.toString());
      if(isGetRefreshToken){
        if (refreshToken != null){
            headers ??= {};  // headers가 null인 경우 빈 맵으로 초기화
            headers['Refresh-Token'] = refreshToken;  // 액세스 토큰을 Authorization 헤더에 추가
        }
      } else {
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
            ..files.add(await http.MultipartFile.fromPath('file', file.path));

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

        print(headers);

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

        print(headers);
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
      File? file) async {
    print(response.headers);
    print(response.body);
    print(response.statusCode);

    if (response.statusCode == 200 || response.statusCode == 201 || response.statusCode == 204) {
      return response;
    } else if (response.statusCode == 401) {
      // Refresh 토큰을 사용하여 새로운 JWT 토큰을 얻어오는 로직
      http.Response refreshResponse = await _getRefreshToken();
      if (refreshResponse.statusCode == 401) {
        Get.toNamed('/splash'); // 인증 실패 시 스플래시 화면으로 이동
        return null;
      }
      print('리프레쉬 결가ㅗ');
      print(refreshResponse);
      const storage = FlutterSecureStorage();
      await storage.write(key: "jwt_token", value: refreshResponse.headers['authorization']);  // JWT 토큰 저장
      await storage.write(key: "refresh_token", value: refreshResponse.headers['refresh-token']);  // refresh 토큰 저장

      // 새로운 토큰을 사용하여 원래의 API 호출을 재시도
      return await apiCall(url, method: method, headers: headers, body: body, file: file);
    } else {
      print('Failed request with status: ${response.statusCode}');
      return null;
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
    print('리프레쉬 토큰 갱신 결과');
    print(response);

    return response;


  }











}