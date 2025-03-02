import 'dart:async';

import 'package:badboys/controller/match_controller.dart';
import 'package:badboys/controller/member_controller.dart';
import 'package:badboys/model/member/member_model.dart';
import 'package:badboys/screen/comn/custom_appbar_screen.dart';
import 'package:badboys/modal/select_bottom_modal_screen.dart';
import 'package:badboys/screen/comn/custom_calender_screen.dart';
import 'package:badboys/screen/comn/select_match_info_btn.dart';
import 'package:badboys/screen/comn/user_profile_container.dart';
import 'package:badboys/subScreen/home/event_list_item.dart';
import 'package:badboys/subScreen/home/home_match_btn.dart';
import 'package:badboys/subScreen/home/home_menu_list.dart';
import 'package:badboys/subScreen/home/match_list_item.dart';
import 'package:badboys/screen/info/member_page_screen.dart';
import 'package:badboys/subScreen/home/home_menu_btn.dart';
import 'package:badboys/subScreen/playHistory/play_history_result_item.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  int matchIndex = 0;
  String defaultMatchSelText = '지역';
  String defaultMatchSelText2 = '동네';
  late TabController _tabController;
  late PageController _pageController;



  @override
  void initState() {
    super.initState();
    // TabController 초기화 (탭의 개수는 2로 설정)
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


    return Scaffold(
      body: Container(
        color: Colors.black,
        width: 100.w,
        height: 100.h,
        child: SingleChildScrollView(
          child: Column(

              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: 40,),
                CustomAppbarScreen(
                  isNotification: true,
                  isListMenu: false,
                ),

                SizedBox(height: 5,),
                /**
                 *  상단 유저 프로필
                 */
                UserProfileContainer(),

                SizedBox(height: 5,),

                CustomCalenderScreen(),

                Container(
                  margin: EdgeInsets.only(top: 5,bottom: 3),
                  width: 100.w,
                  height: 0.8,
                  color: Colors.orange.withOpacity(0.3),
                ),
                SizedBox(height: 10,),

                Container(
                  width: 95.w,
                  height: 15.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color(0x39ffffff),
                  ),

                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,

                      children: [

                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('양산시',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 15
                                  ),
                                ),
                                Text('물금읍',
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 12
                                  ),
                                ),
                              ],
                            ),

                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text('26',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 20
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Icon(Icons.umbrella,color: Colors.white,),

                                Text('38%',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14
                                  ),
                                ),
                              ],
                            ),


                          ],
                        ),



                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                               
                               Icon(Icons.cloud,color: Colors.white,size: 50,),
                              ],
                            ),

                            Text('9:15 오후',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 20
                              ),
                            ),
                          ],
                        ),




                      ],
                    ),
                  ),
                ),


                Container(
                  // height: 100.h,
                  child: Column(
                    children: [
                      Container(
                        width: 100.w, // 화면 너비에 맞게
                        padding: EdgeInsets.only(left: 30, right: 30),
                        decoration: BoxDecoration(
                          color: Colors.black,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [

                            SizedBox(height: 20,),

                            /**
                             * 홈 메뉴
                             */
                            HomeMenuList(),


                          ],
                        ),
                      ),
                      SizedBox(height: 10,),

                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(15),
                            topRight: Radius.circular(15),
                          ),
                          color: Colors.black,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.3),
                              spreadRadius: 5,
                              blurRadius: 9,
                              offset: Offset(0, -4),
                            ),
                          ],
                        ),

                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // TabBar 생성
                            TabBar(
                              tabAlignment: TabAlignment.start,
                              isScrollable: true,
                              controller: _tabController,
                              indicatorSize: TabBarIndicatorSize.label,
                              // 탭에 맞는 indicator 크기
                              tabs: [
                                Tab(
                                  child: Text(
                                    '경기 정보',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w900),
                                  ),
                                ),
                                Tab(
                                  child: Text(
                                    '이벤트',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w900),
                                  ),
                                ),
                              ],
                            ),
                            // TabBarView를 사용하여 탭에 따라 다른 내용을 표시
                            Container(
                              height: 100.h,
                              child: TabBarView(
                                controller: _tabController,
                                children: [
                                  // 첫 번째 탭 (새로운 사람들)
                                  Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.center,
                                    children: [
                                      // Padding(
                                      //   padding: const EdgeInsets.all(15.0),
                                      //   child: Text(
                                      //     '최근 진행된 경기',
                                      //     style: TextStyle(
                                      //         fontWeight: FontWeight.w700,
                                      //         fontSize: 17,
                                      //         color: Colors.white
                                      //     ),
                                      //   ),
                                      // ),
                                      //
                                      // Container(
                                      //   decoration: BoxDecoration(
                                      //       borderRadius: BorderRadius.circular(
                                      //           10),
                                      //       border: Border.all(
                                      //           width: 3, color: Colors.white)
                                      //   ),
                                      //   child: PlayHistoryResultItem(
                                      //     pageCnt: 3,),
                                      // ),

                                      SizedBox(
                                        height: 20,
                                      ),

                                      for (int i = 0; i < 6; i++)
                                        MatchListItem()

                                    ],
                                  ),


                                  // 두 번째 탭 (주변의 코트)
                                  Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          '최근 이벤트',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w700,
                                              fontSize: 17,
                                              color: Colors.white
                                          ),
                                        ),
                                      ),

                                      for (int i = 0; i < 3; i++)
                                        EventListItem()
                                    ],
                                  ),
                                ],
                              ),
                            ),

                          ],
                        ),
                      )


                    ],
                  ),
                ),
              ],
            ),




        ),
      ),
    );
  }
}
