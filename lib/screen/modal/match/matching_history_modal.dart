import 'package:badboys/screen/subScreen/home/lockerRoom/locker_room_list_Item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class MatchingHistoryModal extends StatefulWidget {
  const MatchingHistoryModal({super.key});

  @override
  State<MatchingHistoryModal> createState() => _MatchingHistoryModalState();
}

class _MatchingHistoryModalState extends State<MatchingHistoryModal> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.w,
      height: 90.h,
      color: Colors.black,
      child: Column(
        children: [
          Container(
            width: 100.w,
            padding: EdgeInsets.all(14),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Colors.grey, // Set the border color
                  width: 1, // Set the border width
                ),
              ),
            ),
            child: Text(
              'Unbound',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 19,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'EHSMB'
              ),
            ),
          ),

          SizedBox(height: 20,),


          SizedBox(
            height: 79.h,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  for(int i = 0; i <15; i++)
                    LockerRoomListItem(
                      matchingRoomId: 70,
                      isExitButton: true,
                      isModalScreen: true,
                      callBack: () {
                        Get.toNamed('/lockerRoomScreen',arguments: {'matchingRoomId' : "70"});
                      },
                    )
                ],
              ),
            ),
          )

        ],
      ),
    );
  }
}
