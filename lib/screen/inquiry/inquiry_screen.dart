import 'package:badboys/screen/comn/custom_appbar_screen.dart';
import 'package:badboys/subScreen/inquiry/inquiry_wrt_screen.dart';
import 'package:badboys/subScreen/inquiry/inquirt_list_item.dart';
import 'package:badboys/subScreen/report/report_drop_down_item.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class InquiryScreen extends StatefulWidget {
  const InquiryScreen({super.key});

  @override
  State<InquiryScreen> createState() => _InquiryScreenState();
}

class _InquiryScreenState extends State<InquiryScreen> with TickerProviderStateMixin {

  late TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.w,
      height: 100.h,
      color: Colors.black,
      child: Column(
        children: [
          SizedBox(height: 40,),
          CustomAppbarScreen(isNotification: true, ),

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
              Tab(child: Text('자주 하는 문의',style: TextStyle(fontSize: 15,fontWeight: FontWeight.w800),),),
              Tab(child: Text('내 문의',style: TextStyle(fontSize: 15,fontWeight: FontWeight.w800),),),
              Tab(child: Text('문의하기',style: TextStyle(fontSize: 15,fontWeight: FontWeight.w800),),),

            ],
          ),

          // TabBarView를 사용하여 탭에 따라 다른 내용을 표시
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10,right: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        InquirtListItem(inquiryTitle: "매칭이 잘 안되는 거 같아요.",inquiryDetails: "디에틸내용",isInquiryCd: null,),
                        InquirtListItem(inquiryTitle: "사용 밥법을 모르겠어요",inquiryDetails: "디에틸내용",isInquiryCd: null,),
                        InquirtListItem(inquiryTitle: "게임을 이겼는데 점수가 안올랐어요",inquiryDetails: "디에틸내용",isInquiryCd: null,),
                        InquirtListItem(inquiryTitle: "오류가 있어요",inquiryDetails: "디에틸내용",isInquiryCd: null,),
                        InquirtListItem(inquiryTitle: "매칭이 잘 안되는 거 같아요.",inquiryDetails: "디에틸내용",isInquiryCd: null,),

                        InquirtListItem(inquiryTitle: "매칭이 잘 안되는 거 같아요.",inquiryDetails: "디에틸내용",isInquiryCd: null,),
                        InquirtListItem(inquiryTitle: "사용 밥법을 모르겠어요",inquiryDetails: "디에틸내용",isInquiryCd: null,),
                        InquirtListItem(inquiryTitle: "게임을 이겼는데 점수가 안올랐어요",inquiryDetails: "디에틸내용",isInquiryCd: null,),
                        InquirtListItem(inquiryTitle: "오류가 있어요",inquiryDetails: "디에틸내용",isInquiryCd: null,),
                        InquirtListItem(inquiryTitle: "매칭이 잘 안되는 거 같아요.",inquiryDetails: "디에틸내용",isInquiryCd: null,),






                        // Text(
                        //   '내 문의',
                        //   style: TextStyle(
                        //     color: Colors.white,
                        //     fontWeight: FontWeight.w700,
                        //     fontSize: 18,
                        //   ),
                        // ),
                        // InquirtListItem(inquiryTitle: "매칭이 안돼요",inquiryDetails: "디에틸내용",),
                        // InquirtListItem(inquiryTitle: "매칭이 안돼요1",inquiryDetails: "디에틸내용",),
                        // InquirtListItem(inquiryTitle: "매칭이 안돼요2",inquiryDetails: "디에틸내용",),
                        // InquirtListItem(inquiryTitle: "매칭이 안돼요3",inquiryDetails: "디에틸내용",),
                        // Center(
                        //   child: Text(
                        //     '문의 내역이 없습니다.',
                        //     style: TextStyle(
                        //       color: Colors.white,
                        //       fontSize: 20,
                        //       fontWeight: FontWeight.w700
                        //     ),
                        //   ),
                        // ),



                      ],
                    ),
                  ),
                ),

                SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10,right: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        InquirtListItem(inquiryTitle: "매칭이 잘 안되는 거 같아요.",inquiryDetails: "디에틸내용",isInquiryCd: 0,),
                        InquirtListItem(inquiryTitle: "사용 밥법을 모르겠어요",inquiryDetails: "디에틸내용",isInquiryCd: 1,),
                        InquirtListItem(inquiryTitle: "게임을 이겼는데 점수가 안올랐어요",inquiryDetails: "디에틸내용",isInquiryCd: 0,),
                        InquirtListItem(inquiryTitle: "오류가 있어요",inquiryDetails: "디에틸내용",isInquiryCd: 1,),
                        InquirtListItem(inquiryTitle: "매칭이 잘 안되는 거 같아요.",inquiryDetails: "디에틸내용",isInquiryCd: 0,),



                        // Text(
                        //   '내 문의',
                        //   style: TextStyle(
                        //     color: Colors.white,
                        //     fontWeight: FontWeight.w700,
                        //     fontSize: 18,
                        //   ),
                        // ),
                        // InquirtListItem(inquiryTitle: "매칭이 안돼요",inquiryDetails: "디에틸내용",),
                        // InquirtListItem(inquiryTitle: "매칭이 안돼요1",inquiryDetails: "디에틸내용",),
                        // InquirtListItem(inquiryTitle: "매칭이 안돼요2",inquiryDetails: "디에틸내용",),
                        // InquirtListItem(inquiryTitle: "매칭이 안돼요3",inquiryDetails: "디에틸내용",),
                        // Center(
                        //   child: Text(
                        //     '문의 내역이 없습니다.',
                        //     style: TextStyle(
                        //       color: Colors.white,
                        //       fontSize: 20,
                        //       fontWeight: FontWeight.w700
                        //     ),
                        //   ),
                        // ),



                      ],
                    ),
                  ),
                ),

                InquiryWrtScreen(),

              ],
            ),
          ),




        ],
      ),
    );
  }
}
