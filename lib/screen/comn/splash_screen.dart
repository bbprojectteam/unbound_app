import 'dart:async';

import 'package:badboys/controller/auth_controller.dart';
import 'package:badboys/controller/member_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../firebase/auth_service.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {


  @override
  void initState() {
    super.initState();
    _checkUser();
  }

  void _checkUser() {
    User? user = FirebaseAuth.instance.currentUser; // 현재 사용자 정보 가져오기




    Timer(const Duration(seconds: 3), () async {
      if (user == null) {
        // 유저가 로그인 안 되어 있으면 Login 화면으로 이동
        Get.toNamed('/login');
        return;
      }

      AuthService _authService = AuthService();
      final AuthController authController = Get.put(AuthController());
      final MemberController memberController = Get.put(MemberController());

      Get.toNamed('/login');

      Future<void> _tryRefreshToken(User user) async {
        try {
          await user.getIdToken(true); // 강제로 토큰 갱신
          bool isAuth = await authController.fnAuthing(user);
          if (isAuth) {
            // 인증 성공
            // await memberController.getMemberInfo(user.email!);
            Get.toNamed('/');
          } else {
            // 인증 실패
            Get.toNamed('/login');
          }
        } catch (e) {
          print("토큰 강제 갱신 실패");
          Get.toNamed('/login');
        }
      }


      Future<void> _handleAuth(User user) async {
        bool isAuth = await authController.fnAuthing(user);
        if (isAuth) {
          // 인증이 되었을 때
          // await memberController.getMemberInfo(user.email!);
          Get.toNamed('/');
        } else {
          // 인증 실패
          await _tryRefreshToken(user);
        }
      }


      // 첫 번째 인증 시도
      await _handleAuth(user);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 100.w,
          height: 100.h,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xff000000), // 상단의 연한 색
                Color(0xff000000),    // 하단의 어두운 색
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Stack(
            children: [
              Image.asset(
                'assets/images/intro.png',
                width: 100.w,
                height: 70.h,
                fit: BoxFit.cover,
              ),

              Positioned(
                bottom: 190,
                left: 10,
                right: 10,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text('Unbound',style: TextStyle(color: Colors.white,fontSize: 30,fontWeight: FontWeight.w900),),
                    SizedBox(height: 10,),
                    Text('listen to your favorite music for',style: TextStyle(color: Colors.grey,fontWeight: FontWeight.w700),),
                    Text('free, anywhere',style: TextStyle(color: Colors.grey,fontWeight: FontWeight.w700),),
                    SizedBox(height: 30,),

                  ],
                ),
              ),
            ],
          ),
        ),

      ),
    );
  }
}
