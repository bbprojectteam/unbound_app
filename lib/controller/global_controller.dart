import 'dart:async';
import 'package:badboys/controller/match_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GlobalController extends GetxController {

  var bottomNavigatorIndex = 0.obs;  // 바텀 네비게이션의 인덱스

  RxInt matchingStateCd = 0.obs;
  RxString matchingTime = "00:00".obs;
  Timer? timer;

  Future<void> handleMatchButtonPress(MatchController matchController) async {

    SharedPreferences prefs = await SharedPreferences.getInstance();

    if (matchingStateCd.value == 0) {

      await matchController.fnMatchStart();


      matchingStateCd.value = 1;
      int secondsPassed = 0;
      timer = Timer.periodic(const Duration(seconds: 1), (timer) {
        secondsPassed++;

        // FlutterLocalNotificationsPlugin().show(
        //   0, // 알림 ID 고정
        //   '매칭 시간',
        //   '현재 시간: ${secondsPassed}',
        //   NotificationDetails( android: AndroidNotificationDetails(
        //     'high_importance_channel',
        //     'high_importance_notification',
        //     importance: Importance.max,
        //     color: Colors.black54, // 알림 아이콘 색상 설정 (배경 색상은 따로 스타일로 설정)
        //     category: 'category_alert',
        //   ),
        //   ), // 플랫폼별 알림 세부 설정
        // );


        matchingTime.value = "${(secondsPassed ~/ 60).toString().padLeft(2, '0')}:${(secondsPassed % 60).toString().padLeft(2, '0')}";

        if (prefs.getBool("isMatching") == true) {
          matchingStateCd.value = 2;
          timer.cancel();
        }
        update();
      });

    } else if (matchingStateCd.value == 2){
      if (timer != null) {
        timer?.cancel();
      }
      matchingStateCd.value = 0;
      update();
      String? matchingRoomId = prefs.getString('matchingRoomId');
      Get.toNamed('/lockerRoomScreen',arguments: {'matchingRoomId' : matchingRoomId});
    }
  }

  Future<void> handleMatchCancelButtonPress(MatchController matchController) async {
    await matchController.fnMatchStop();
    matchingStateCd.value = 0;
    matchingTime.value = "00:00";
    timer?.cancel();
    update();
  }

}