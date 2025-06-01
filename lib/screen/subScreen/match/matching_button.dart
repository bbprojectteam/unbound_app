import 'dart:async';

import 'package:badboys/controller/global_controller.dart';
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
  late MatchController matchController;
  late GlobalController globalController;

  @override
  void initState() {
    super.initState();
    matchController = Get.put(MatchController());
    globalController = Get.find<GlobalController>();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return GestureDetector(
        onTap: () async {
          await globalController.handleMatchButtonPress(matchController);
        },
        child: Container(
          decoration: BoxDecoration(
              color: Colors.black,
              border: Border.all(width: 1.5,color: Colors.orange),
              borderRadius: BorderRadius.circular(10)
          ),
          child: globalController.matchingStateCd.value == 1
              ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  Text('${globalController.matchingTime}',
                    style: const TextStyle(
                        color: Colors.orange,
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'EHSMB'
                    ),
                  ),
                  GestureDetector(
                    onTap: () async {
                      await globalController.handleMatchCancelButtonPress(matchController);
                    },
                    child: const Text( '취소',
                      style: TextStyle(
                          color: Colors.orange,
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                          fontFamily: 'EHSMB',
                      ),
                    ),
                  ),
                ],
              )
              : Center(
                child: Text(
                  globalController.matchingStateCd.value == 2
                      ? '라커룸 이동'
                      : '매칭',
                  style: const TextStyle(
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
