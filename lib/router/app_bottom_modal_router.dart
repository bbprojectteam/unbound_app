import 'package:badboys/modal/locker_room_setting_modal_pop.dart';
import 'package:badboys/modal/select_locale_bottom_modal.dart';
import 'package:badboys/modal/team_chng_modal_pop.dart';
import 'package:badboys/modal/team_player_list_modal_pop.dart';
import 'package:flutter/material.dart';


// AppBottomRouter 클래스 정의
class AppBottomModalRouter {

  static void fnModalRouter(
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
        return LockerRoomSettingModalPop(chatRoomId : chatRoomId);
      },
      3: () async {
        return SelectLocaleBottomModal();
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
