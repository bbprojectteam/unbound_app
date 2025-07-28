import 'package:badboys/controller/match_controller.dart';
import 'package:badboys/model/match/match_model.dart';
import 'package:badboys/screen/subScreen/comn/appbar/custom_appbar.dart';
import 'package:badboys/screen/modal/lockerRoom/team_player_list_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class TeamPlayerListModal extends StatefulWidget {
  const TeamPlayerListModal({
    super.key,
    required this.chatRoomId,
  });

  final String? chatRoomId;

  @override
  State<TeamPlayerListModal> createState() => _TeamPlayerListModalState();
}

class _TeamPlayerListModalState extends State<TeamPlayerListModal> {

  late MatchController matchController;
  late MatchModel matchModel;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    matchController = Get.put(MatchController());
    matchController.fnMatchInfo(widget.chatRoomId.toString());
  }

  @override
  Widget build(BuildContext context) {

    return GetBuilder<MatchController>(
      init: matchController,
      builder: (matchControllerContext) {

        matchModel = matchController.matchModel;

        return Container(
          width: 100.w,
          height: 47.h,
          decoration: BoxDecoration(
              color: Colors.black,
          ),
          child: Padding(
            padding: const EdgeInsets.all(3.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomAppbar(
                    isNotification: false,
                    isBackButton : false
                ),

                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        for (int i = 0; i< matchModel.matchMemberModel.length; i++)
                          TeamPlayerListItem(chatRoomId : widget.chatRoomId, matchMemberModel : matchModel.matchMemberModel[i], isOwnerAuth: matchController.isOwnerAuth.value),
                      ],
                    ),
                  ),
                ),



                GestureDetector(
                  onTap: ()=>{
                    Navigator.pop(context)
                  },
                  child: Container(
                    width: 100.w,
                    height: 8.h,
                    color: Colors.black,
                    child: Center(
                      child: Text(
                        '닫기',
                        style: TextStyle(color: Colors.white,fontWeight: FontWeight.w700,fontSize: 17,fontFamily: 'EHSMB'),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      }
    );
  }
}
