import 'dart:async';

import 'package:badboys/controller/match_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class HomeMatchBtn extends StatefulWidget {
  const HomeMatchBtn({
    super.key,
    required this.regionId
  });
  final int? regionId;

  @override
  State<HomeMatchBtn> createState() => _HomeMatchBtnState();
}

class _HomeMatchBtnState extends State<HomeMatchBtn> {
  MatchController matchController  = Get.put(MatchController());
  @override
  Widget build(BuildContext context) {

    print('1111');

    return Obx(() {
        return ElevatedButton(
          style: ButtonStyle(
            backgroundColor: WidgetStateProperty.all(
                Colors.white),
            shadowColor: WidgetStateProperty.all(
                Colors.transparent),
            shape: WidgetStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                    50),
              ),
            ),
          ),
          onPressed: () async =>
          {
            if (!matchController.isMatch.value)
              {
                matchController.isMatching.value = true,
                await matchController.fnMatchStart(widget.regionId),
                matchController.isMatch.value = true,
                Timer(const Duration(seconds: 3), () async {
                  matchController.isMatching.value = false;
                })
              }
            else
              if (matchController.isMatch.value){
                matchController.isMatch.value = false,
                Get.toNamed('/lockerRoomScreen')
              }
          },
          child: matchController.isMatching.value ?
          Container(
            padding: const EdgeInsets.only(left: 15,right: 15,top: 5,bottom: 5),
            child: Column(
              children: [
                CircularProgressIndicator(
                  color: Colors.black,
                ),
                SizedBox(height: 15,),
                Text('매칭 시작...',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w700,

                  ),
                )
              ],
            ),

          )
              :Container(
            padding: EdgeInsets.all(10),
            child: Text(
              !matchController.isMatch.value ? '매칭하기' : '라커룸 이동',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w700
              ),
            ),
          ),
        );
      }
    );
  }
}
