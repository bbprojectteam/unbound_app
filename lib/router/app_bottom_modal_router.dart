import 'package:badboys/model/member/user_info.dart';
import 'package:badboys/screen/appScreen/register/profile_setting_screen.dart';
import 'package:badboys/screen/modal/chat/select_image_bottom_modal.dart';
import 'package:badboys/screen/modal/game/playing_result_modal_pop.dart';
import 'package:badboys/screen/modal/lockerRoom/locker_room_setting_bottom_modal.dart';
import 'package:badboys/screen/modal/lockerRoom/select_locale_bottom_modal.dart';
import 'package:badboys/screen/modal/lockerRoom/team_chng_modal_pop.dart';
import 'package:badboys/screen/modal/lockerRoom/team_player_list_modal_pop.dart';
import 'package:badboys/screen/modal/match/matching_history_modal.dart';
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
        return TeamPlayerListModalPop(chatRoomId: chatRoomId,);
      },
      1: () async {
        return TeamChngModalPop();
      },
      2: () async {
        return LockerRoomSettingBottomModal(chatRoomId : chatRoomId);
      },
      3: () async {
        return DaumPostcodeSearch();
      },
      4: () async{
        return ProfileSettingScreen(userInfo : null);
      },
      5: () async{
        return MatchingHistoryModal();
      },
      6: () async{
        return PlayingResultModalPop();
      },
      7: () async{
        return ProfileSettingScreen(userInfo : userInfo);
      },
      8: () async{
        return SelectImageBottomModal(callBack : (imageFile) {
          callBack!(imageFile);
        });
      },

    };


    // Modal 위젯이 존재하면 showModalBottomSheet 호출
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
