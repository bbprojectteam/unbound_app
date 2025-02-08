import 'package:badboys/controller/auth_controller.dart';
import 'package:badboys/controller/member_controller.dart';
import 'package:badboys/subScreen/register/profile_setting_text_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ProfileSettingScreen extends StatefulWidget {
  const ProfileSettingScreen({super.key});

  @override
  State<ProfileSettingScreen> createState() => _ProfileSettingScreenState();
}

class _ProfileSettingScreenState extends State<ProfileSettingScreen> {
  final TextEditingController nickNmTextEdController = TextEditingController();

  @override
  Widget build(BuildContext context) {


    final MemberController memberController = Get.find<MemberController>();

    return
      Scaffold(
        body: Container(
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
                top: 10.h,
                left: 10,
                right: 10,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [

                    Container(
                      width: 100.w,
                      child: Column(
                        children: [
                          ProfileSettingTextField(labelText: "닉네임",textEditingController: nickNmTextEdController),
                          Container(
                            width: 100.w,
                            child: ElevatedButton(
                                style: ButtonStyle(
                                  backgroundColor: WidgetStateProperty.all(Colors.transparent), // 버튼 배경을 투명으로 설정
                                  shadowColor: WidgetStateProperty.all(Colors.transparent), // 그림자 제거
                                  shape: WidgetStateProperty.all(RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8), // 둥근 모서리 설정
                                  )),
                                ),
                                onPressed: () async {


                                  print('회우너가입ㄱ ㅕㄹ과');

                                  bool isUpdate = await memberController.fnSetMemberInfo();
                                  if(isUpdate) {
                                    Get.toNamed('/');
                                  }


                                  // if (user != null) {
                                  //   await memberController.getMemberInfo(user.email!);
                                  //   Get.toNamed('/');
                                  // } else {
                                  //   print('회원가입 실패');
                                  // }
                                },
                                child: Container(
                                  width: 100.w,
                                  height: 50,
                                  decoration: BoxDecoration(
                                    border: Border.all(width: 3,color: Colors.black12),
                                    gradient: LinearGradient(
                                      colors: [Color(0xff200f2), Color(0xff8515e7)], // 그라데이션 색상
                                      begin: Alignment.topLeft,  // 그라데이션 시작 방향
                                      end: Alignment.bottomRight, // 그라데이션 끝 방향
                                    ),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Center(
                                    child: Text(
                                      '저장',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w700,
                                          letterSpacing: 0.5),
                                    ),
                                  ),
                                )
                            ),
                          )
                        ],
                      ),
                    )

                  ],
                ),
              ),
            ],
          ),
        ),
      );
  }
}
