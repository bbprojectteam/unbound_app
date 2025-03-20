import 'package:badboys/controller/match_controller.dart';
import 'package:badboys/model/match/match_model.dart';
import 'package:badboys/screen/comn/custom_match_appbar_Screen.dart';
import 'package:badboys/subScreen/lockerRoom/chat/chat_item.dart';
import 'package:badboys/screen/comn/custom_appbar_screen.dart';
import 'package:badboys/subScreen/home/match_list_item.dart';
import 'package:badboys/subScreen/lockerRoom/chat/chat_list.dart';
import 'package:badboys/subScreen/lockerRoom/locker_room_info.dart';
import 'package:flutter/material.dart';
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
  late String matchingRoomId;

  @override
  void initState() {
    super.initState();
    // TabController 초기화 (탭의 개수는 2로 설정)
    matchingRoomId = Get.arguments['matchingRoomId'];
    _tabController = TabController(length: 2, vsync: this);
    _pageController = PageController();
  }

  @override
  void dispose() {
    _tabController.dispose();
    _pageController.dispose();
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
          CustomMatchAppbarScreen(chatRoomId: matchingRoomId,),

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
            tabs: [
              Tab(child: Text('정보',style: TextStyle(fontSize: 15,fontWeight: FontWeight.w800),),),
              Tab(child: Text('대기실',style: TextStyle(fontSize: 15,fontWeight: FontWeight.w800),),),
            ],
          ),

          // TabBarView를 사용하여 탭에 따라 다른 내용을 표시
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
