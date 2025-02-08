import 'package:badboys/controller/member_controller.dart';
import 'package:badboys/screen/comn/custom_appbar_screen.dart';
import 'package:badboys/screen/comn/custom_select_bottom_modal_screen.dart';
import 'package:badboys/subScreen/home/event_list_item.dart';
import 'package:badboys/subScreen/home/match_list_item.dart';
import 'package:badboys/screen/info/member_page_screen.dart';
import 'package:badboys/subScreen/home/home_menu_btn.dart';
import 'package:badboys/subScreen/playHistory/play_history_result_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:go_router/go_router.dart';
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
  late MemberController memberController;

  @override
  void initState() {
    super.initState();
    memberController = Get.put(MemberController());
    memberController.fnGetMemberInfo();

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
          child: Obx(() {

            if (memberController.isLoading.value) {
              return CircularProgressIndicator();
            }
            var model = memberController.model;

            return Column(

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

                Padding(
                  padding: EdgeInsets.only(left: 5, right: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          ClipOval(
                            child: Image.asset(
                              'assets/images/intro.png',
                              width: 10.w,
                              height: 5.h,
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(width: 5,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('오민규',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 17,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              Text('대전 탄방동',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ],
                          ),

                        ],
                      ),

                      Row(
                        children: [
                          Image.asset(
                            'assets/images/color_world.png',
                            width: 5.w,
                            height: 2.h,
                            color: Colors.white,
                            fit: BoxFit.cover,
                          ),
                          SizedBox(width: 7,),
                          Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text('2142 pts',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ]
                          ),
                        ],
                      ),
                    ],
                  ),
                ),


                Container(
                  width: 100.w,
                  padding: EdgeInsets.only(left: 10, right: 10, top: 12),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        GestureDetector(
                          onTap: () {
                            showModalBottomSheet(
                              context: context,
                              builder: (BuildContext context) {
                                return CustomSelectBottomModalScreen();
                              },
                            );
                          },
                          child: Container(
                            padding: EdgeInsets.only(
                                left: 10, right: 10, top: 5, bottom: 5),
                            decoration: BoxDecoration(
                              color: Color(0xff333333),
                              borderRadius: BorderRadius.circular(50),
                              border:
                              Border.all(color: Color(0xff333333), width: 2.5),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  '지역',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 13,
                                  ),
                                ),
                                Icon(
                                  Icons.arrow_drop_down_sharp,
                                  color: Colors.white,
                                  size: 15,
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Container(
                          padding: EdgeInsets.only(
                              left: 10, right: 10, top: 5, bottom: 5),
                          decoration: BoxDecoration(
                            color: Color(0xff333333),
                            borderRadius: BorderRadius.circular(50),
                            border:
                            Border.all(color: Color(0xff333333), width: 2.5),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                '동네',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 13,
                                ),
                              ),
                              Icon(
                                Icons.arrow_drop_down_sharp,
                                color: Colors.white,
                                size: 15,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Container(
                          padding: EdgeInsets.only(
                              left: 10, right: 10, top: 5, bottom: 5),
                          decoration: BoxDecoration(
                            color: Color(0xff333333),
                            borderRadius: BorderRadius.circular(50),
                            border:
                            Border.all(color: Color(0xff333333), width: 2.5),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                '마감 가리기',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 13,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Container(
                          padding: EdgeInsets.only(
                              left: 10, right: 10, top: 5, bottom: 5),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: Color(0xff333333),
                            border:
                            Border.all(color: Color(0xff333333), width: 2.5),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                '성별',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 13,
                                ),
                              ),
                              Icon(
                                Icons.arrow_drop_down_sharp,
                                color: Colors.white,
                                size: 15,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Container(
                          padding: EdgeInsets.only(
                              left: 10, right: 10, top: 5, bottom: 5),
                          decoration: BoxDecoration(
                            color: Color(0xff333333),
                            borderRadius: BorderRadius.circular(50),
                            border:
                            Border.all(color: Color(0xff333333), width: 2.5),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                '레벨',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 13,
                                ),
                              ),
                              Icon(
                                Icons.arrow_drop_down_sharp,
                                color: Colors.white,
                                size: 15,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Container(
                          padding: EdgeInsets.only(
                              left: 10, right: 10, top: 5, bottom: 5),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: Color(0xff333333),
                            border:
                            Border.all(color: Color(0xff333333), width: 2.5),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                '스꺼러스꺼러',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 13,
                                ),
                              ),
                              Icon(
                                Icons.arrow_drop_down_sharp,
                                color: Colors.white,
                                size: 15,
                              ),
                            ],
                          ),
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

                                  ElevatedButton(
                                    style: ButtonStyle(
                                      backgroundColor: WidgetStateProperty.all(
                                          Colors.white),
                                      shadowColor: WidgetStateProperty.all(
                                          Colors.transparent),
                                      shape: WidgetStateProperty.all(
                                        RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                              50),
                                        ),
                                      ),
                                    ),
                                    onPressed: () =>
                                    {
                                      if (matchIndex == 0)
                                        {
                                          setState(() {
                                            matchIndex = 1;
                                          })
                                        }
                                      else
                                        if (matchIndex == 1)
                                          {
                                            Get.toNamed('/lockerRoomScreen')
                                          }
                                    },
                                    child: Container(
                                      padding: EdgeInsets.all(10),
                                      child: Text(
                                        matchIndex == 0 ? '매칭하기' : '라커룸 이동',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 20,
                                            fontWeight: FontWeight.w700
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(height: 20,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                HomeMenuBtn(icon: null,
                                    imagePath: 'assets/images/admin.png',
                                    title: "내 정보",
                                    iconWSize: 6.6.w,
                                    iconHSize: 3.h,
                                    uri: '/memberPageScreen',
                                    arguments: {'tab': 0,}),
                                HomeMenuBtn(icon: null,
                                    imagePath: 'assets/images/rank.png',
                                    title: "동네랭킹",
                                    iconWSize: 6.6.w,
                                    iconHSize: 3.h,
                                    uri: '/rank',
                                    arguments: {}),
                                HomeMenuBtn(icon: null,
                                    imagePath: 'assets/images/play_record.png',
                                    title: "경기기록",
                                    iconWSize: 6.6.w,
                                    iconHSize: 3.h,
                                    uri: '/memberPageScreen',
                                    arguments: {'tab': 1}),
                                HomeMenuBtn(icon: null,
                                    imagePath: 'assets/images/notice.png',
                                    title: "공지",
                                    iconWSize: 10.6.w,
                                    iconHSize: 3.h,
                                    uri: '/',
                                    arguments: {}),
                              ],
                            ),
                            SizedBox(height: 10,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                HomeMenuBtn(icon: null,
                                    imagePath: 'assets/images/admin.png',
                                    title: "방 만들기",
                                    iconWSize: 6.6.w,
                                    iconHSize: 3.h,
                                    uri: '/',
                                    arguments: {}),
                                HomeMenuBtn(icon: null,
                                    imagePath: 'assets/images/admin.png',
                                    title: "내 정보",
                                    iconWSize: 6.6.w,
                                    iconHSize: 3.h,
                                    uri: '/',
                                    arguments: {}),
                                HomeMenuBtn(icon: null,
                                    imagePath: 'assets/images/admin.png',
                                    title: "문의하기",
                                    iconWSize: 6.6.w,
                                    iconHSize: 3.h,
                                    uri: '/inquiry',
                                    arguments: {}),
                                HomeMenuBtn(icon: null,
                                    imagePath: 'assets/images/admin.png',
                                    title: "신고하기",
                                    iconWSize: 6.6.w,
                                    iconHSize: 3.h,
                                    uri: '/report',
                                    arguments: {}),
                              ],
                            ),


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
            );

          }
          ),


        ),
      ),
    );
  }
}
