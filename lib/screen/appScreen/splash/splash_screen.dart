import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:responsive_sizer/responsive_sizer.dart';


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
      Get.toNamed('/');
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
                'assets/images/rank_bg.jpg',
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
                    Text('Unbound',style: TextStyle(color: Colors.white,fontSize: 30,fontWeight: FontWeight.w900,fontFamily: 'EHSMB'),),
                    SizedBox(height: 10,),
                    Text('listen to your favorite music for',style: TextStyle(color: Colors.grey,fontWeight: FontWeight.w700,fontFamily: 'EHSMB'),),
                    Text('free, anywhere',style: TextStyle(color: Colors.grey,fontWeight: FontWeight.w700,fontFamily: 'EHSMB'),),
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
