import 'package:badboys/firebase/auth_service.dart';
import 'package:badboys/modal/locker_room_setting_modal_pop.dart';
import 'package:badboys/modal/team_chng_modal_pop.dart';
import 'package:badboys/modal/team_player_list_modal_pop.dart';
import 'package:badboys/router/app_bottom_modal_router.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CustomMatchAppbarScreen extends StatefulWidget {
  const CustomMatchAppbarScreen({
    super.key,
    required this.chatRoomId
  });

  final String chatRoomId;

  @override
  State<CustomMatchAppbarScreen> createState() => _CustomMatchAppbarScreenState();
}

class _CustomMatchAppbarScreenState extends State<CustomMatchAppbarScreen> {
  @override
  Widget build(BuildContext context) {

    AuthService _authService = AuthService();


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
                    _showDropdownMenu(context),
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

  void _showDropdownMenu(BuildContext context) async {

    await showMenu(
      context: context,
      position: RelativeRect.fromLTRB(70, 80, 0, 0), // 드롭다운 위치
      items: [
        PopupMenuItem<int>(
          value: 100,
          child: Text('참여자 확인'),
        ),
        PopupMenuItem<int>(
          value: 200,
          child: Text('팀변경'),
        ),
        PopupMenuItem<int>(
          value: 300,
          child: Text('경기시작'),
        ),
        PopupMenuItem<int>(
          value: 400,
          child: Text('대기실 나가기'),
        ),
        PopupMenuItem<int>(
          value: 500,
          child: Text('방 설정'),
        ),




      ],
      elevation: 8.0,
    ).then((value) {
      if (value != null) {

        if(value == 100) {
          AppBottomModalRouter.fnModalRouter(context,0,chatRoomId: widget.chatRoomId );
        } else if (value == 200) {
          AppBottomModalRouter.fnModalRouter(context,1 );
        } else if(value == 300){
          Get.toNamed('/countDownScreen');
        } else if (value == 400 ){

        } else if (value == 500){
          AppBottomModalRouter.fnModalRouter(context,2, chatRoomId: widget.chatRoomId );
        }


      }
    });
  }

}

