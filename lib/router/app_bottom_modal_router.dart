import 'package:badboys/model/member/user_info.dart';
import 'package:badboys/screen/modal/daumPostCodeSearch/daum_post_code_search_modal.dart';
import 'package:badboys/screen/modal/member/profile_setting_modal.dart';
import 'package:badboys/screen/modal/chat/select_image_modal.dart';
import 'package:badboys/screen/modal/game/playing_result_modal.dart';
import 'package:badboys/screen/modal/lockerRoom/locker_room_setting_modal.dart';
import 'package:badboys/screen/modal/lockerRoom/select_locale_bottom_modal.dart';
import 'package:badboys/screen/modal/lockerRoom/team_chng_modal.dart';
import 'package:badboys/screen/modal/lockerRoom/team_player_list_modal.dart';
import 'package:badboys/screen/modal/match/matching_history_modal.dart';
import 'package:badboys/screen/modal/sendInvite/send_invite_modal.dart';
import 'package:daum_postcode_search/data_model.dart';
import 'package:daum_postcode_search/widget.dart';
import 'package:flutter/material.dart';

// AppBottomRouter 클래스 정의
class AppBottomModalRouter {

  static Future<void> fnModalRouter(
      BuildContext context,
      int modalIndex,
      {
        String? chatRoomId,
        UserInfo? userInfo,
        Function? callBack,
      }) async {


    final Map<int, Future<dynamic> Function()> modalWidgets = {
      0: () async {
        return TeamPlayerListModal(chatRoomId: chatRoomId);
      },
      1: () async {
        return const TeamChngModal();
      },
      2: () async {
        return LockerRoomSettingModal(chatRoomId : chatRoomId);
      },
      3: () async {
        return const DaumPostCodeSearchModal();
      },
      4: () async {
        return const ProfileSettingModal(userInfo : null);
      },
      5: () async {
        return const MatchingHistoryModal();
      },
      6: () async {
        return const PlayingResultModal();
      },
      7: () async {
        return ProfileSettingModal(userInfo : userInfo);
      },
      8: () async {
        return SelectImageModal(callBack : (imageFile) {
          callBack!(imageFile);
        });
      },
      9: () async {
        return SendInviteModal(chatRoomId : chatRoomId!, callBack : () {

        });
      },
    };

    if (modalWidgets.containsKey(modalIndex)) {
      dynamic modalFunction = modalWidgets[modalIndex];

      if (modalFunction != null) {
        Widget? modalContent = await modalFunction();

        if (modalContent != null) {

          bool canBeDragged = true;

          if(modalIndex == 1 || modalIndex == 4 ){
            canBeDragged = false;
          }

          var result = await showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            isDismissible: canBeDragged,
            enableDrag: canBeDragged,
            builder: (BuildContext context) {
              return modalContent;
            },
          );

          if(modalIndex == 3) {
            callBack!(result);
          }

        }
      }
    }
  }


}
