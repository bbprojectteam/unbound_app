import 'package:badboys/controller/member_controller.dart';
import 'package:badboys/model/match/member_match_history_model.dart';
import 'package:badboys/model/member/member_model.dart';
import 'package:badboys/router/app_bottom_modal_router.dart';
import 'package:badboys/screen/subScreen/comn/appbar/custom_appbar.dart';
import 'package:badboys/screen/subScreen/comn/custom_cached_network_image.dart';
import 'package:badboys/screen/subScreen/info/member_play_record_item.dart';
import 'package:badboys/utils/helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class MemberPageScreen extends StatefulWidget {
  const MemberPageScreen({super.key,});


  @override
  State<MemberPageScreen> createState() => _MemberPageScreenState();
}

class _MemberPageScreenState extends State<MemberPageScreen>  with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late MemberController memberController;
  late MemberMatchHistoryModel memberMatchHistoryModel;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    dynamic args = Get.arguments ?? {};

    memberController = Get.put(MemberController());
    memberController.fnGetMemberInfo(args['memberId']);

    if (args == null || args['tab'] == null){
      args['tab'] = 0;
    }

    _tabController.index = args['tab'];
    _isAuth(args['memberId']);

  }

  void _isAuth(int memberId) async {
    memberController.isAuth.value = await Helpers.getMemberId() == memberId;
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {


    return Scaffold(
      body: GetBuilder<MemberController>(
        init: memberController,
        builder: (memberControllerContext) {

          memberMatchHistoryModel = memberController.memberMatchHistoryModel;

          return Container(
                color: Colors.black,
                width: 100.w,
                height: 100.h,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(height: 40,),
                      CustomAppbar(isNotification: true),

                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [

                          ClipOval(
                            child: CustomCachedNetworkImage(
                                imagePath: memberMatchHistoryModel.memberModel?.profileImage.toString(),
                                imageWidth: 27.w,
                                imageHeight: null
                            ),
                          ),


                          SizedBox(height: 6,),
                          Text(memberMatchHistoryModel.memberModel?.username ?? "null" ,style: TextStyle(fontSize: 19, color: Colors.white,fontWeight: FontWeight.w600,fontFamily: 'EHSMB'),),

                          SizedBox(height: 6,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('20대 코드 추가 필요',style: TextStyle(fontSize: 13, color: Colors.grey,fontWeight: FontWeight.w600,fontFamily: 'EHSMB'),),
                              SizedBox(width: 5,),
                              Text('${memberMatchHistoryModel.memberModel!.gender == "M" ? "남성" : "여성" }',style: TextStyle(fontSize: 13,color: Colors.grey,fontWeight: FontWeight.w600,fontFamily: 'EHSMB'),),
                              SizedBox(width: 5,),
                              Text(memberMatchHistoryModel.memberModel?.regionNm ?? "null",style: TextStyle(fontSize: 13,color: Colors.grey,fontWeight: FontWeight.w600,fontFamily: 'EHSMB'),),
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
                              Text((memberMatchHistoryModel.memberModel?.mmr ?? 1000).toString() ,style: TextStyle(color: Colors.white,fontWeight: FontWeight.w700,fontSize: 17,fontFamily: 'EHSMB'),),
                              SizedBox(width: 3,),
                              Text('pts',style: TextStyle(color: Colors.grey,fontWeight: FontWeight.w700,fontSize: 13,fontFamily: 'EHSMB'),)
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 5),

                      if(memberController.isAuth.value)
                        GestureDetector(
                          onTap :() async {
                            await AppBottomModalRouter.fnModalRouter(context, 4);
                            await memberController.fnGetMemberInfo(memberMatchHistoryModel.memberModel?.userId);
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.edit_outlined,color: Colors.orange,size: 17,),
                              SizedBox(width: 5,),
                              Text('프로필 수정' ,style: TextStyle(fontSize: 13, color: Colors.orange,fontWeight: FontWeight.w600,fontFamily: 'EHSMB'),),

                            ],
                          ),
                        ),

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
                            ///첫번째 탭
                            Container(
                              width : 100.w,
                              height: 100,
                              padding: EdgeInsets.all(15),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    memberMatchHistoryModel.memberModel?.introduction ?? "",
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
                                      for(int i = 0; i < memberMatchHistoryModel.userMatchInfoList.length; i++)
                                        MemberPlayRecordItem(isWin: true, matchHistoryInfoModel : memberMatchHistoryModel.userMatchInfoList[i] ),
                                      // MemberPlayRecordItem(isWin: false,),
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

