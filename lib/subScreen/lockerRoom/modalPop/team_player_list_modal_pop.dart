import 'package:badboys/screen/comn/custom_appbar_screen.dart';
import 'package:badboys/subScreen/lockerRoom/modalPop/team_player_list_item.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class TeamPlayerListModalPop extends StatefulWidget {
  const TeamPlayerListModalPop({super.key});

  @override
  State<TeamPlayerListModalPop> createState() => _TeamPlayerListModalPopState();
}

class _TeamPlayerListModalPopState extends State<TeamPlayerListModalPop> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.w,
      height: 47.h,
      decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(15)
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomAppbarScreen(isNotification: false, isListMenu: false),

          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  for(int i = 0; i< 10; i++)
                    TeamPlayerListItem(),


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
                  style: TextStyle(color: Colors.white,fontWeight: FontWeight.w700,fontSize: 17),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
