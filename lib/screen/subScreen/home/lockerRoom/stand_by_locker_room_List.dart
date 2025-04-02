import 'package:badboys/controller/chat_controller.dart';
import 'package:badboys/controller/match_controller.dart';
import 'package:badboys/model/match/match_model.dart';
import 'package:badboys/screen/subScreen/home/lockerRoom/locker_room_list_Item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class StandByLockerRoomList extends StatefulWidget {
  const StandByLockerRoomList({super.key,});

  @override
  State<StandByLockerRoomList> createState() => _StandByLockerRoomListState();
}

class _StandByLockerRoomListState extends State<StandByLockerRoomList> {

  late MatchController matchController;
  late List<MatchModel> standByMatchModel;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    matchController = Get.put(MatchController());
    matchController.fnGetStandByLockerRoomList();
  }




  @override
  Widget build(BuildContext context) {



    return Column(
      crossAxisAlignment:
      CrossAxisAlignment.center,
      children: [

        SizedBox(
          height: 20,
        ),

        for (int i = 0; i < 6; i++)
          LockerRoomListItem(
            matchingRoomId: 70,
            isExitButton: false,
            isModalScreen: false,
            callBack: () {
              Get.toNamed('/lockerRoomScreen',arguments: {'matchingRoomId' : "70"});
            },
          )

      ],
    );
  }
}
