import 'package:badboys/screen/appScreen/register/profile_setting_screen.dart';
import 'package:badboys/screen/modal/lockerRoom/locker_room_setting_bottom_modal.dart';
import 'package:badboys/screen/modal/lockerRoom/select_locale_bottom_modal.dart';
import 'package:badboys/screen/modal/lockerRoom/team_chng_modal_pop.dart';
import 'package:badboys/screen/modal/lockerRoom/team_player_list_modal_pop.dart';
import 'package:badboys/screen/modal/match/matching_history_modal.dart';
import 'package:flutter/material.dart';


// AppBottomRouter 클래스 정의
class AppBottomModalRouter {

  static Future<void> fnModalRouter(
      BuildContext context,
      int modalIndex,
      {
        String? chatRoomId,
      }) async {


    final Map<int, Future<dynamic> Function()> modalWidgets = {
      0: () async {
        return TeamPlayerListModalPop(chatRoomId: chatRoomId,);
      },
      1: () async {
        // 파일 선택 처리
        return TeamChngModalPop();
      },
      2: () async {
        return LockerRoomSettingBottomModal(chatRoomId : chatRoomId);
      },
      3: () async {
        return SelectLocaleBottomModal();
      },
      4: () async{
        return ProfileSettingScreen();
      },
      5: () async{
        return MatchingHistoryModal();
      }

    };


    // Modal 위젯이 존재하면 showModalBottomSheet 호출
    if (modalWidgets.containsKey(modalIndex)) {
      dynamic modalFunction = modalWidgets[modalIndex];

      if (modalFunction != null) {
        Widget? modalContent = await modalFunction();

        if (modalContent != null) {
          await showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            builder: (BuildContext context) {
              return modalContent;
            },
          );

        }
      }
    }
  }


}
