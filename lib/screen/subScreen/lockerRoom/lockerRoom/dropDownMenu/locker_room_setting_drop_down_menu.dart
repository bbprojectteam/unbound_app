import 'package:badboys/controller/match_controller.dart';
import 'package:badboys/router/app_bottom_modal_router.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

  static void _handleMenuSelection(int value, BuildContext context, String chatRoomId) async {
    if (value == 100) {
      await AppBottomModalRouter.fnModalRouter(context, 0, chatRoomId: chatRoomId);
    } else if (value == 200) {
      await AppBottomModalRouter.fnModalRouter(context, 1);
    } else if (value == 300) {

      // 멤버정보
      MatchController matchController = Get.find<MatchController>();

      if(matchController.matchModel.matchMemberModel.length == 6){
        Get.toNamed('/countDownScreen');
      }else {
        print('6명 아닌데 경기시작 오류 발생');

        Get.toNamed('/countDownScreen');
      }


    } else if (value == 400) {

      /// 매칭 나가기 api 후 데이터 지우고 홈으로 이동
      MatchController matchController = Get.find<MatchController>();
      await matchController.fnMatchExit(chatRoomId);
      Get.toNamed('/');

      // 대기실 나가기 관련 처리
    } else if (value == 500) {
      await AppBottomModalRouter.fnModalRouter(context, 2, chatRoomId: chatRoomId);
    }
  }
}
