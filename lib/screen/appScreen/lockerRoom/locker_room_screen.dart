import 'package:badboys/controller/chat_controller.dart';
import 'package:badboys/controller/match_controller.dart';
import 'package:badboys/model/match/match_model.dart';
import 'package:badboys/screen/subScreen/comn/appbar/custom_match_appbar.dart';

import 'package:badboys/screen/subScreen/lockerRoom/chat/chat_list.dart';
import 'package:badboys/screen/subScreen/lockerRoom/lockerRoom/locker_room_info.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class LockerRoomScreen extends StatefulWidget {
  const LockerRoomScreen({
    super.key,
  });

  @override
  State<LockerRoomScreen> createState() => _LockerRoomScreenState();
}

class _LockerRoomScreenState extends State<LockerRoomScreen> with TickerProviderStateMixin {

  late TabController _tabController;
  late PageController _pageController;
  late ChatController chatController;
  late MatchController matchController;
  late String matchingRoomId;

  @override
  void initState() {
    super.initState();
    // TabController 초기화 (탭의 개수는 2로 설정)
    matchingRoomId = Get.arguments['matchingRoomId'];

    chatController = Get.put(ChatController());
    matchController = Get.put(MatchController());

    _tabController = TabController(length: 2, vsync: this);
    _pageController = PageController();
  }

  @override
  void dispose() {
    if (chatController.isApiCalled.value) {
      chatController.disconnect();
    }
    chatController.isApiCalled = false.obs;
    matchController.isApiCalled = false.obs;

    _tabController.dispose();
    _pageController.dispose();
    Get.delete<MatchController>();
    Get.delete<ChatController>();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {

    return Container(
      color: Colors.black,
      width: 100.w,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: 40,),
          CustomMatchAppbar(
            isBackButton : true,
            chatRoomId: matchingRoomId,
          ),

          TabBar(
            tabAlignment : TabAlignment.start,
            isScrollable : true,
            controller: _tabController,
            indicator: BoxDecoration(),  // 밑줄 제거
            labelStyle: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w900,
            ),
            unselectedLabelStyle: TextStyle(
              fontSize: 15,
              color: Colors.grey.withOpacity(0.7),  // 선택되지 않은 탭의 텍스트 색
            ),
            indicatorColor: Colors.white,
            onTap: (index){

              if (!matchController.matchModel.isJoinLockerRoom!) {
                _tabController.index = 0;

                Fluttertoast.showToast(
                  msg: "라커룸 참여를 해주세요.", // 메시지 내용
                  toastLength: Toast.LENGTH_SHORT, // 토스트의 길이 (짧거나 길게 설정)
                  gravity: ToastGravity.BOTTOM,  // 토스트 위치 (BOTTOM, CENTER, TOP)
                  timeInSecForIosWeb: 1,         // iOS/Web에서의 지속 시간 설정
                  backgroundColor: Colors.black, // 배경색
                  textColor: Colors.white,       // 텍스트 색
                  fontSize: 16.0,                // 폰트 크기
                );
              }


            },
            tabs: [
              Tab(child: Text('정보',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w800,fontFamily: 'EHSMB'),),),
              Tab(child: Text('대기실',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w800,fontFamily: 'EHSMB'),),),
            ],
          ),

          //TabBarView를 사용하여 탭에 따라 다른 내용을 표시
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [

                // 첫 번째 탭 (새로운 사람들)
                LockerRoomInfo(chatRoomId : matchingRoomId),



                // 두 번째 탭
                ChatList(chatRoomId: matchingRoomId,),


              ],
            ),
          ),






        ],
      ),
    );
  }


}
