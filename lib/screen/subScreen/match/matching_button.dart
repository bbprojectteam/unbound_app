import 'dart:async';

import 'package:badboys/controller/match_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MatchingButton extends StatefulWidget {
  const MatchingButton({
    super.key
  });

  @override
  State<MatchingButton> createState() => _MatchingButtonState();
}

class _MatchingButtonState extends State<MatchingButton> {
  MatchController matchController = Get.put(MatchController());
  late SharedPreferences prefs;
  Timer? timer = null;

  @override
  void initState() {
    super.initState();
    // 임시 저장소 값 확인
    _checkInitialMatchingStatus();
  }

  // 처음 화면에 접근했을 때 임시 저장소 값 확인
  Future<void> _checkInitialMatchingStatus() async {
    prefs = await SharedPreferences.getInstance();
    bool? isMatching = prefs.getBool("isMatching");

    if (isMatching == null || !isMatching) {
      matchController.isMatch.value = false;
    } else {
      matchController.isMatch.value = true;
    }
  }

  // 매칭 상태에 따라 UI 업데이트
  Future<void> _handleMatchButtonPress() async {
    if (!matchController.isMatch.value) {
      matchController.isMatching.value = true;
      await matchController.fnMatchStart();
      matchController.isMatch.value = true;

      // 타이머로 매칭 완료 여부 확인
      timer = Timer.periodic(Duration(seconds: 100), (timer) {
        if (prefs.getBool("isMatching") == true) {
          matchController.isMatching.value = false;
          // 매칭이 완료되면 타이머 종료
          timer.cancel();
          setState(() {});
        }
      });
    } else {
      // 이미 매칭된 상태이면 락커룸 이동
      if (timer != null) {
        timer?.cancel();
      }


      final prefs = await SharedPreferences.getInstance();
      String? matchingRoomId =  await prefs.getString('matchingRoomId');
      Get.toNamed('/lockerRoomScreen',arguments: {'matchingRoomId' : matchingRoomId});

    }
  }

  @override
  void dispose() {
    // 화면이 닫힐 때 타이머가 남아있지 않도록 취소
    if (timer != null) {
      timer?.cancel();
    }
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return GestureDetector(
        onTap: (){
          _handleMatchButtonPress();
        },
        child: Container(
          decoration: BoxDecoration(
              color: Colors.black,
              border: Border.all(width: 1.5,color: Colors.orange),
              borderRadius: BorderRadius.circular(10)
          ),
          child: matchController.isMatching.value
              ? Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircularProgressIndicator(
                      color: Colors.orange,
                      strokeWidth: 2.5,
                    ),
                  ],
                ),
              )
              : Center(
                child: Text(
                  matchController.isMatch.value
                      ? '라커룸 이동'
                      : '매칭',
                  style: TextStyle(
                    color: Colors.orange,
                    fontSize: 19,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'EHSMB'

                  ),
                ),
              ),
        ),
      );
    });
  }
}
