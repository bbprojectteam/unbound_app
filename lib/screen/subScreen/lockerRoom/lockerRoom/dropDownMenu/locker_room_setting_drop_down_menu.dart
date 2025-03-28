import 'package:badboys/router/app_bottom_modal_router.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class LockerRoomSettingDropDownMenu {

  static Future<void> showDropdownMenu(BuildContext context, String chatRoomId) async {
    await showMenu(
      context: context,
      color: Colors.black,
      position: RelativeRect.fromLTRB(5.w, 11.h, 0, 0), // 드롭다운 위치
      items: [
        showDropdownMenuItem(
          value: 100,
          text: '참여자 확인',
        ),
        showDropdownMenuItem(
          value: 200,
          text: '팀 변경',
        ),
        showDropdownMenuItem(
          value: 300,
          text: '경기 시작',
        ),
        showDropdownMenuItem(
          value: 400,
          text: '대기실 나가기',
        ),
        showDropdownMenuItem(
          value: 500,
          text: '설정',
        ),
      ],
      elevation: 8.0,
    ).then((value) {
      if (value != null) {
        _handleMenuSelection(value, context, chatRoomId);
      }
    });
  }

  static PopupMenuItem<int> showDropdownMenuItem({required int value, required String text}) {
    return PopupMenuItem<int>(
      value: value,
      child: Container(
        color: Colors.black,
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w800,
            fontFamily: 'EHSMB',
          ),
        ),
      ),
    );
  }

  static void _handleMenuSelection(int value, BuildContext context, String chatRoomId) {
    if (value == 100) {
      AppBottomModalRouter.fnModalRouter(context, 0, chatRoomId: chatRoomId);
    } else if (value == 200) {
      AppBottomModalRouter.fnModalRouter(context, 1);
    } else if (value == 300) {
      Get.toNamed('/countDownScreen');
    } else if (value == 400) {
      // 대기실 나가기 관련 처리
    } else if (value == 500) {
      AppBottomModalRouter.fnModalRouter(context, 2, chatRoomId: chatRoomId);
    }
  }
}
