import 'dart:convert';

import 'package:badboys/fcm/fcm_notifications.dart';
import 'package:badboys/utils/helpers.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn( /// 웹 oauth2 클라이언트 아이디
      clientId : dotenv.get("WEB_OAUTH_2_CLIENT_ID"),
  );


  Future<bool?> signInWithGoogle() async {

    final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
    final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    UserCredential userCredential = await _auth.signInWithCredential(credential);

    User user = userCredential.user!;
    String? idToken = await user.getIdToken();


    // print(idToken!.length);
    print(idToken!.substring(0,1000));
    print( idToken!.substring(1000,idToken.length));
    print('----');
    final String? deviceToken = await FcmNotifications.getMyDeviceToken();
    print(deviceToken);
    http.Response response = await Helpers.apiCall(
        '/auth/login',
        method: "POST",
        headers: {
          'Content-Type': 'application/json',
          'Authorization' : 'Bearer ${idToken}'
        },
      body: {
          'appId' : '1234',
          'fcmToken' : deviceToken
      }
    );

    print('tt11');
    print(response);
    if(response.statusCode == 204) {
      print('회원가입 화면으로 이동');

      final response = await Helpers.apiCall(
        '/auth/register',
        method: "POST",
        headers: {
          'Content-Type': 'application/json',
          'Authorization' : 'Bearer ${idToken}'
        },
      );


      print(response);
      if(response.statusCode == 201) {

        print("jwt토큰 저장" + response.statusCode.toString());
        const storage = FlutterSecureStorage();
        await storage.write(key: "jwt_token", value: response.headers['authorization']);  // JWT_token 저장
        await storage.write(key: "refresh_token", value: response.headers['refresh-token']);  // refresh_token 저장

        return true;
      }

    } else if (response.statusCode == 200 && userCredential.user != null) {
      print("jwt토큰 저장" + response.statusCode.toString());
      const storage = FlutterSecureStorage();
      await storage.write(key: "jwt_token", value: response.headers['authorization']);  // JWT_token 저장
      await storage.write(key: "refresh_token", value: response.headers['refresh-token']);  // refresh_token 저장

      return true;
    } else {
      return false;
    }
  }




  Future<void> fnRegister() async {
    User? user = FirebaseAuth.instance.currentUser; // 현재 사용자 정보 가져오기

    final response = await Helpers.apiCall(
      '/auth/register',
      method: "POST",
      headers: {
        'Content-Type': 'application/json',
        'Authorization' : 'Bearer ${await user!.getIdToken()}'
      },
    );

    print('회원가입시도 결과');
    print(response);

  }

  Future<void> signOut() async {
    final storage = FlutterSecureStorage();

    // 저장된 JWT 토큰 삭제
    await storage.delete(key: "jwt_token");
    await storage.delete(key: "refresh_token");

    // Firebase Authentication 로그아웃
    await FirebaseAuth.instance.signOut();

    await googleSignIn.signOut();
    await _auth.signOut();
  }
}
