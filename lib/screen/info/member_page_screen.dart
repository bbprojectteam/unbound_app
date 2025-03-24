import 'package:badboys/controller/member_controller.dart';
import 'package:badboys/screen/comn/custom_appbar_screen.dart';
import 'package:badboys/subScreen/info/member_play_record_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class MemberPageScreen extends StatefulWidget {
  const MemberPageScreen({super.key});

  @override
  State<MemberPageScreen> createState() => _MemberPageScreenState();
}

class _MemberPageScreenState extends State<MemberPageScreen>  with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late MemberController memberController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    memberController = Get.put(MemberController());
    memberController.fnGetMemberInfo();

    _tabController = TabController(length: 2, vsync: this);

    dynamic args = Get.arguments ?? {};
    if (args == null || args['tab'] == null){
      args['tab'] = 0;
    }

    _tabController.index = args['tab'];
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {


    return Scaffold(
      body: Obx((){

          if (memberController.isLoading.value) {
            return CircularProgressIndicator();
          }
          var model = memberController.model.value;


          return Container(
            color: Colors.black,
            width: 100.w,
            height: 100.h,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 40,),
                  CustomAppbarScreen(isNotification: true, ),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ClipOval(
                        child: Image.asset(
                          'assets/images/intro.png',
                          // width: 100, // 원래 크기 유지
                          height: 100, // 원래 크기 유지
                          fit: BoxFit.cover, // 이미지가 잘리거나 확대되면서 원형을 유지
                        ),
                      ),
                      SizedBox(height: 6,),
                      Text('스꺼러',style: TextStyle(fontSize: 19, color: Colors.white,fontWeight: FontWeight.w600,fontFamily: 'EHSMB'),),
                      SizedBox(height: 6,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('20대',style: TextStyle(fontSize: 13, color: Colors.grey,fontWeight: FontWeight.w600,fontFamily: 'EHSMB'),),
                          SizedBox(width: 5,),
                          Text('여자',style: TextStyle(fontSize: 13,color: Colors.grey,fontWeight: FontWeight.w600,fontFamily: 'EHSMB'),),
                          SizedBox(width: 5,),
                          Text('서울 강서구',style: TextStyle(fontSize: 13,color: Colors.grey,fontWeight: FontWeight.w600,fontFamily: 'EHSMB'),),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Text('24회',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w700,fontSize: 17,fontFamily: 'EHSMB'),),
                          SizedBox(width: 2,),
                          Text('참여',style: TextStyle(color: Colors.grey,fontWeight: FontWeight.w700,fontSize: 13,fontFamily: 'EHSMB'),)
                        ],
                      ),
                      SizedBox(width: 15,),
                      Row(
                        children: [
                          Text('2403',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w700,fontSize: 17,fontFamily: 'EHSMB'),),
                          SizedBox(width: 3,),
                          Text('pts',style: TextStyle(color: Colors.grey,fontWeight: FontWeight.w700,fontSize: 13,fontFamily: 'EHSMB'),)
                        ],
                      ),
                    ],
                  ),


                  SizedBox(height: 10),
                  TabBar(
                    controller: _tabController,
                    labelColor: Colors.white,
                    unselectedLabelColor: Colors.white,
                    tabAlignment: TabAlignment.center,
                    isScrollable: true,
                    indicatorColor: Colors.orange,
                    indicatorSize: TabBarIndicatorSize.label,
                    onTap: (index){
                      _tabController.index = index;
                      setState(() {});
                    },
                    tabs: [
                      Tab(child: Text('   소개   ',
                        style: TextStyle(
                            color: _tabController.index == 0 ? Colors.white : Colors.grey,
                            fontSize: 16,
                            fontWeight:
                            FontWeight.w700,
                          fontFamily: 'EHSMB',
                        ),
                        ),
                      ),

                      Tab(child: Text(' 경기기록  ',
                        style: TextStyle(
                            color: _tabController.index == 1 ? Colors.white : Colors.grey,
                            fontSize: 16,
                            fontWeight:
                            FontWeight.w700,
                          fontFamily: 'EHSMB',
                        ),
                        ),
                      ),
                    ],
                  ),

                  // Tab view content
                  Container(
                    height: 60.h,
                    child: TabBarView(
                      controller: _tabController,
                      children: [
                        Container(
                          width : 100.w,
                          height: 100,
                          padding: EdgeInsets.all(15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '안녕하세요.',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 17,
                                ),
                              ),
                              Text(
                                '저는 길거리 농구 시작한지 10년차 입니다..',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 17,
                                ),
                              ),
                              Text(
                                '같이 하실 분은 용병신청 해주세요.',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 17,
                                ),
                              ),


                            ],
                          ),
                        ),

                        ///두번째 탭
                        Container(
                          child: SingleChildScrollView(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  MemberPlayRecordItem(isWin: true,),
                                  MemberPlayRecordItem(isWin: false,),
                                  MemberPlayRecordItem(isWin: true,),
                                  MemberPlayRecordItem(isWin: false,),
                                  MemberPlayRecordItem(isWin: true,),
                                ],
                              ),
                            ),
                          ),
                        ),

                      ],
                    ),
                  ),




                ],
              ),
            ),
          );
        }
      ),

    );
  }
}

