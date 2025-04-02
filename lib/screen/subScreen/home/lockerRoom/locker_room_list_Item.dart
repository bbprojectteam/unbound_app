import 'package:badboys/controller/match_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LockerRoomListItem extends StatefulWidget {
  const LockerRoomListItem({
    super.key,
    required this.matchingRoomId,
    required this.isExitButton,
    required this.isModalScreen,
    required this.callBack,
  });

  final int matchingRoomId;
  final bool isExitButton;
  final bool isModalScreen;
  final Function callBack;

  @override
  State<LockerRoomListItem> createState() => _LockerRoomListItemState();
}

class _LockerRoomListItemState extends State<LockerRoomListItem> {

  late MatchController matchController;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    matchController = Get.put(MatchController());

  }
  @override
  Widget build(BuildContext context) {


    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.grey,
            width: 1,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              Text('03/18',style: TextStyle(fontWeight: FontWeight.w900,fontSize: 17,letterSpacing: -0.3,color: Colors.white,fontFamily: 'EHSMB'),),
              SizedBox(width: 5.w,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('대전 서구 실내 농구장',style: TextStyle(fontWeight: FontWeight.w800,color: Colors.white,fontFamily: 'EHSMB'),),
                  Text('평균 pts - 2304 ',style: TextStyle(color: Colors.white,fontFamily: 'EHSMB'),),
                  Text('남녀 모두 - 3 vs 3',style: TextStyle(fontSize: 14,color: Colors.white.withOpacity(0.8),fontFamily: 'EHSMB'),),
                ],
              ),
            ],
          ),

          Row(
            children: [
              GestureDetector(
                onTap: () async {

                  if (widget.isModalScreen){
                    Get.back();
                  }
                  widget.callBack();
                },
                child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(width: 1,color: Colors.orange),
                      color: Colors.orange
                  ),
                  child: Text('아동',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w900,fontSize: 15,fontFamily: 'EHSMB'),),
                ),
              ),

              if(widget.isExitButton)...[
                SizedBox(width: 5,),

                GestureDetector(
                  onTap: () async {
                    await matchController.fnMatchExit(widget.matchingRoomId.toString());

                  },
                  child: Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(width: 1,color: Colors.orange),
                        color: Colors.orange
                    ),
                    child: Text('나가기',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w900,fontSize: 15,fontFamily: 'EHSMB'),),
                  ),
                ),
              ]
            ],
          ),


        ],
      ),
    );
  }
}
