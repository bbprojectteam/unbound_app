import 'dart:async';

import 'package:badboys/controller/match_controller.dart';
import 'package:badboys/controller/member_controller.dart';
import 'package:badboys/model/member/member_model.dart';
import 'package:badboys/screen/comn/custom_appbar_screen.dart';
import 'package:badboys/modal/select_bottom_modal_screen.dart';
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

                // SingleChildScrollView(
                //   scrollDirection: Axis.horizontal,
                //   child: Row(
                //     children: [
                //       for (int i = 0; i < 10; i++)...[
                //         Container(
                //           width: 10.w,
                //           height: 5.h,
                //           decoration: BoxDecoration(
                //             borderRadius: BorderRadius.circular(100),
                //           ),
                //           child: Column(
                //             mainAxisAlignment: MainAxisAlignment.center,
                //             children: [
                //               Text(
                //                 '3',
                //                 style: TextStyle(
                //                   color: i == 2 ? Colors.white : i==3 ?  Colors.blue : i == 4 ? Colors.red : null,
                //                   fontWeight: FontWeight.w800,
                //
                //                 ),
                //               ),
                //               Text(
                //                 '금',
                //                 style: TextStyle(
                //                   color: i == 2 ? Colors.white : i==3 ?  Colors.blue : i == 4 ? Colors.red : null,
                //                   fontWeight: FontWeight.w800,
                //
                //                 ),
                //               ),
                //             ],
                //           ),
                //         ),
                //
                //         SizedBox(
                //           width: 10,
                //         ),
                //       ],
                //
                //     ],
                //   ),
                // ),

                // Container(
                //   margin: EdgeInsets.only(top: 5,bottom: 3),
                //   width: maxWidth,
                //   height: 0.8,
                //   color: Colors.black.withOpacity(0.3),
                // ),


                /**
                 *  상단 유저 프로필
                 */
                UserProfileContainer(),





                Container(
                  width: 100.w,
                  padding: EdgeInsets.only(left: 10, right: 10, top: 12),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SelectMatchInfoBtn(title: "지역",listId: 1,),
                        SizedBox(
                          width: 5,
                        ),
                        SelectMatchInfoBtn(title: "성별",listId: 2,),
                        SizedBox(
                          width: 5,
                        ),
                        SelectMatchInfoBtn(title: "pts",listId: 3,),
                        SizedBox(
                          width: 5,
                        ),
                        SelectMatchInfoBtn(title: "10km",listId: 4,),
                        SizedBox(
                          width: 5,
                        ),

                      ],
                    ),
                  ),
                ),



                SizedBox(height: 20,),
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
                            Container(
                              width: 100.w,
                              height: 18.h,
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color: Colors.white, width: 3),
                                // 테두리 색상과 두께 설정
                                borderRadius:
                                BorderRadius.circular(50), // 동그란 모서리 설정
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [

                                  /**
                                   * 매칭버튼
                                   */
                                  HomeMatchBtn(regionId : 1)

                                ],
                              ),
                            ),
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
                                      Padding(
                                        padding: const EdgeInsets.all(15.0),
                                        child: Text(
                                          '최근 진행된 경기',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w700,
                                              fontSize: 17,
                                              color: Colors.white
                                          ),
                                        ),
                                      ),

                                      Container(
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                                10),
                                            border: Border.all(
                                                width: 3, color: Colors.white)
                                        ),
                                        child: PlayHistoryResultItem(
                                          pageCnt: 3,),
                                      ),

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
