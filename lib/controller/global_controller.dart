import 'dart:async';
import 'package:badboys/controller/match_controller.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GlobalController extends GetxController {

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