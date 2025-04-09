import 'package:badboys/controller/match_controller.dart';
import 'package:badboys/firebase/auth_service.dart';
import 'package:badboys/model/match/match_model.dart';
import 'package:badboys/screen/subScreen/lockerRoom/lockerRoom/dropDownMenu/locker_room_setting_drop_down_menu.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CustomMatchAppbar extends StatefulWidget {
  const CustomMatchAppbar({
    super.key,
    required this.chatRoomId
  });

  final String chatRoomId;

  @override
  State<CustomMatchAppbar> createState() => _CustomMatchAppbarState();
}

class _CustomMatchAppbarState extends State<CustomMatchAppbar> {

  late MatchController matchController;
  late MatchModel matchModel;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    matchController = Get.find<MatchController>();
  }


  @override
  Widget build(BuildContext context) {

    AuthService _authService = AuthService();


    return GetBuilder<MatchController>(
        init: matchController,
        builder: (matchControllerContext) {

          matchModel = matchController.matchModel;

        return Container(
          padding: EdgeInsets.only(left: 10, right: 10),
          color: Colors.transparent,
          width: 100.w,
          height: 40,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [

              GestureDetector(
                onTap: () async{
                  await _authService.signOut();
                  Get.toNamed('/splash');
                },
                child: Text(
                  'Unbound',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w900,
                      fontSize: 20,
                      fontFamily: 'EHSMB',
                  ),
                ),
              ),

              Row(
                children: [
                    GestureDetector(
                      onTap: ()=>{
                        LockerRoomSettingDropDownMenu.showDropdownMenu(context, widget.chatRoomId, matchModel.isJoinLockerRoom!),
                      },
                      child: Container(
                        padding: EdgeInsets.all(3),
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: Icon(
                          Icons.menu ,
                          color: Colors.white,
                          size: 25,
                        ),
                      ),
                    ),
                ],
              ),
            ],
          ),
        );
      }
    );
  }



}

