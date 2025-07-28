import 'package:badboys/controller/match_controller.dart';
import 'package:badboys/model/match/match_info_model.dart';
import 'package:badboys/screen/subScreen/comn/loadingBar/custom_progress_Indicator_item.dart';
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

  late MatchController matchController;
  late List<MatchInfoModel> joinMatchModelList;

  @override
  void initState() {

    super.initState();
    matchController = Get.put(MatchController());
    matchController.fnGetJoinLockerRoomList();

  }

  @override
  Widget build(BuildContext context) {


    return GetBuilder<MatchController>(
        init: matchController,  // 초기화
        builder: (context) {

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

              GetBuilder<MatchController>(
                init: matchController,
                builder: (context) {

                  joinMatchModelList = matchController.joinMatchModelList;

                  return SizedBox(
                    height: 79.h,
                    child: matchController.isLoading.value
                        ? Center(child: CustomProgressIndicatorItem())
                        : SingleChildScrollView(
                          child: Column(
                            children: [
                              for (int i = 0; i < joinMatchModelList.length; i++)
                                LockerRoomListItem(
                                  matchItem: joinMatchModelList[i],
                                  matchingRoomId: joinMatchModelList[i].chatRoomId!,
                                  isExitButton: true,
                                  isModalScreen: true,
                                  callBack: () {
                                    Get.toNamed('/lockerRoomScreen',arguments: {'matchingRoomId' : joinMatchModelList[i].chatRoomId.toString(),});
                                  },
                                  deleteChatRoomItem: (int? chatRoomId) {
                                    int index = joinMatchModelList.indexWhere((item) => item.chatRoomId == chatRoomId);
                                    joinMatchModelList.removeAt(index);
                                    matchController.update();
                                  },
                                )
                            ],
                          ),
                        ),
                  );
                }
              )






            ],
          ),
        );
      }
    );
  }
}
