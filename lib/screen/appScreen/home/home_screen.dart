import 'dart:async';
import 'package:badboys/screen/subScreen/comn/appbar/custom_appbar.dart';
import 'package:badboys/screen/subScreen/comn/custom_calender_screen.dart';
import 'package:badboys/screen/subScreen/comn/user_profile_container.dart';
import 'package:badboys/screen/subScreen/home/event_list_item.dart';
import 'package:badboys/screen/subScreen/home/home_menu_list.dart';
import 'package:badboys/screen/subScreen/home/lockerRoom/stand_by_locker_room_List.dart';
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
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    // TabController 초기화 (탭의 개수는 2로 설정)
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    print('홈 빌드');

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
                CustomAppbar(
                  isNotification: true,
                    isBackButton : false
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

                // Container(
                //   width: 95.w,
                //   height: 15.h,
                //   decoration: BoxDecoration(
                //     borderRadius: BorderRadius.circular(10),
                //     // border: Border.all(color: Colors.orange,width: 1),
                //     color: Color(0x39ffffff),
                //   ),
                //
                //   child: Padding(
                //     padding: const EdgeInsets.all(15.0),
                //     child: Row(
                //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //       crossAxisAlignment: CrossAxisAlignment.start,
                //
                //       children: [
                //
                //         // Column(
                //         //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //         //   crossAxisAlignment: CrossAxisAlignment.start,
                //         //   children: [
                //         //     Column(
                //         //       crossAxisAlignment: CrossAxisAlignment.start,
                //         //       children: [
                //         //         Text('경상남도 양산시',
                //         //           style: TextStyle(
                //         //             color: Colors.white,
                //         //             fontWeight: FontWeight.w700,
                //         //             fontSize: 18,
                //         //               fontFamily: 'EHSMB'
                //         //           ),
                //         //         ),
                //         //         Text('물금읍',
                //         //           style: TextStyle(
                //         //               color: Colors.grey,
                //         //               fontWeight: FontWeight.w700,
                //         //               fontSize: 15,
                //         //               fontFamily: 'EHSMB'
                //         //           ),
                //         //         ),
                //         //       ],
                //         //     ),
                //         //
                //         //     Row(
                //         //       crossAxisAlignment: CrossAxisAlignment.center,
                //         //       children: [
                //         //         Text('26',
                //         //           style: TextStyle(
                //         //               color: Colors.white,
                //         //               fontWeight: FontWeight.w600,
                //         //               fontSize: 20,
                //         //               fontFamily: 'EHSMB'
                //         //           ),
                //         //         ),
                //         //         SizedBox(
                //         //           width: 10,
                //         //         ),
                //         //         Icon(Icons.umbrella,color: Colors.white,),
                //         //
                //         //         Text('38%',
                //         //           style: TextStyle(
                //         //               color: Colors.white,
                //         //               fontWeight: FontWeight.w600,
                //         //               fontSize: 14,
                //         //               fontFamily: 'EHSMB'
                //         //           ),
                //         //         ),
                //         //       ],
                //         //     ),
                //         //
                //         //
                //         //   ],
                //         // ),
                //
                //
                //
                //         Column(
                //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //           children: [
                //             Column(
                //               crossAxisAlignment: CrossAxisAlignment.end,
                //               children: [
                //
                //                Icon(Icons.cloud,color: Colors.white,size: 50,),
                //               ],
                //             ),
                //
                //             Text('9:15 오후',
                //               style: TextStyle(
                //                   color: Colors.white,
                //                   fontWeight: FontWeight.w700,
                //                   fontSize: 20,
                //                   fontFamily: 'EHSMB'
                //               ),
                //             ),
                //           ],
                //         ),
                //
                //
                //
                //
                //       ],
                //     ),
                //   ),
                // ),


                Container(
                  // height: 100.h,
                  child: Column(
                    children: [
                      Container(
                        width: 100.w, // 화면 너비에 맞게
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
                              tabAlignment: TabAlignment.center,
                              isScrollable: true,
                              controller: _tabController,
                              indicatorColor: Colors.orange,
                              indicatorSize: TabBarIndicatorSize.label,
                              // 탭에 맞는 indicator 크기
                              tabs: [
                                Tab(
                                  child: Text(
                                    '라커룸',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w900),
                                  ),
                                ),
                              ],
                            ),


                            Container(
                              height: 100.h,
                              child: TabBarView(
                                controller: _tabController,
                                children: [
                                  // 첫 번째 탭 (새로운 사람들)
                                  StandByLockerRoomList(),


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
