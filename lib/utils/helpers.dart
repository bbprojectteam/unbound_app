

import 'dart:convert';
import 'dart:io';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
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
      }) async {
    try {
      var uri = Uri.parse(dotenv.get("API_URL") + url);
      print('공통 API 호출 : $uri');
      var request;

      final storage = FlutterSecureStorage();
      String? jwtToken = await storage.read(key: "jwt_token");
      // 기본 헤더에 accessToken 추가
      if (jwtToken != null) {
        headers ??= {};  // headers가 null인 경우 빈 맵으로 초기화
        if(!url.startsWith("/auth/")){
          headers['Authorization'] = jwtToken;  // 액세스 토큰을 Authorization 헤더에 추가
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
        return await _processResponse(httpResponse);

      } else if (method == 'GET') {
        // GET 요청 처리

        print(headers);
        var response = await http.get(uri, headers: headers);
        return await _processResponse(response);

      } else {
        throw Exception('Unsupported HTTP method');
      }
    } catch (error) {
      // 오류 처리
      print('Comn ApiCall Error: $error');
      return null;
    }
  }

  // 응답 처리 (공통 처리)
  static Future<dynamic> _processResponse(http.Response response) async {

    print(response.headers);
    print(response.body);
    print(response.statusCode);

    if(response.statusCode == 200 || response.statusCode == 201 || response.statusCode == 204) {
      //회원가입 요청으로 이동
      return response;
    } else if (response.statusCode == 401) {
      return response;
    } else {
      // 오류 처리
      print('Failed request with status: ${response.statusCode}');
      return null;
    }



  }












}