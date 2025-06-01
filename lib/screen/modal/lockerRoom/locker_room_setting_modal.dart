
import 'dart:convert';

import 'package:badboys/controller/match_controller.dart';
import 'package:badboys/router/app_bottom_modal_router.dart';
import 'package:badboys/screen/modal/comn/select_bottom_modal.dart';
import 'package:badboys/screen/modal/lockerRoom/locker_room_date_setting_item.dart';
import 'package:badboys/screen/subScreen/comn/appbar/custom_appbar.dart';
import 'package:badboys/screen/subScreen/lockerRoom/lockerRoom/match_point_item.dart';
import 'package:badboys/screen/modal/member/profile_setting_text_field_item.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class LockerRoomSettingModal extends StatefulWidget {
  const LockerRoomSettingModal({
    super.key,
    required this.chatRoomId,
  });

  final String? chatRoomId;

  @override
  State<LockerRoomSettingModal> createState() => _LockerRoomSettingModalState();
}

class _LockerRoomSettingModalState extends State<LockerRoomSettingModal> {

  static List<String> comnNumberBoxList = [
    '01', '02', '03', '04', '05', '06', '07', '08', '09', '10', '11', '12', '13', '14',
    '15', '16', '17', '18', '19', '20', '21', '22', '23', '24', '25', '26',
    '27', '28', '29', '30', '31', '32', '33', '34', '35', '36', '37', '38',
    '39', '40', '41', '42', '43', '44', '45', '46', '47', '48', '49', '50',
    '51', '52', '53', '54', '55', '56', '57', '58', '59', '60'
  ];

  String selectedYear = "2025";
  String selectedMonth = "05";
  String selectedDay = "25";

  String selectedHour = "05";
  String selectedMinute = "30";

  String? location;

  double latitude = 0.0;  // 위도
  double longitude = 0.0;  // 경도

  TextEditingController lockerRoomTitleEditController = TextEditingController();
  TextEditingController lockerRoomDescriptionEditController = TextEditingController();

  String threeOnThreeYn = 'y';
  String ballYn = 'N';
  String backBoardYn = 'N';
  String threePointLimitYn = 'N';
  String refereeYn = 'N';
  String halfCourtYn = 'N';
  String fullCourtYn = 'N';



  late MatchController matchController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    matchController = Get.put(MatchController());
    lockerRoomTitleEditController.text = matchController.matchModel.matchInfoModel!.name!;
    lockerRoomDescriptionEditController.text = matchController.matchModel.matchInfoModel!.description ?? "";
    location = matchController.matchModel.matchInfoModel!.location;

    if (matchController.matchModel.matchInfoModel!.matchDt != null) {
      List<String> matchDt = matchController.matchModel.matchInfoModel!.matchDt!.toString().split(' ');

      selectedYear = matchDt[0].split('-')[0];
      selectedMonth = matchDt[0].split('-')[1];
      selectedDay = matchDt[0].split('-')[2];

      selectedHour = matchDt[1].split(':')[0];
      selectedMinute = matchDt[1].split(':')[1];
    }


    threeOnThreeYn = matchController.matchModel.matchInfoModel!.threeOnThreeYn!;
    ballYn = matchController.matchModel.matchInfoModel!.ballYn!;
    backBoardYn = matchController.matchModel.matchInfoModel!.backBoardYn!;
    threePointLimitYn = matchController.matchModel.matchInfoModel!.threePointLimitYn!;
    refereeYn = matchController.matchModel.matchInfoModel!.refereeYn!;
    halfCourtYn = matchController.matchModel.matchInfoModel!.halfCourtYn!;
    fullCourtYn = halfCourtYn == 'Y' ? 'N' : 'Y';

  }

  @override
  Widget build(BuildContext context) {


    return Container(
      width: 100.w,
      height: 95.h,
      color: Colors.black,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomAppbar(isNotification: false, isBackButton : false),
            SizedBox(height: 15,),

            ProfileSettingTextFieldItem(labelText: "방 제목",textLength : 20 ,textEditingController: lockerRoomTitleEditController,maxLines: 1,),
            SizedBox(height: 5),
            ProfileSettingTextFieldItem(labelText: "메모", textLength : 30, textEditingController: lockerRoomDescriptionEditController,maxLines: 1,),

            SizedBox(height: 10,),

            Text("경기 날짜",
              style: TextStyle(
                color: Colors.white,
                fontSize : 16,
                fontFamily : 'EHSMB'
                
              ),
            ),
            SizedBox(height: 10,),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 44.w,
                  height: 5.h,
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: Colors.orange,width: 1.5),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text(
                      selectedYear,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontFamily: 'EHSMB'
                      ),
                    ),
                  ),
                ),

                LockerRoomDateSettingItem(
                    selectItem: selectedMonth,
                    selectItemList: comnNumberBoxList.sublist(0,12),
                    containerWidth: 22.w,
                    callBack: (int? id, String text) => {
                      selectedMonth = text,
                      setState(() {}),
                    }
                ),

                LockerRoomDateSettingItem(
                    selectItem: selectedDay,
                    selectItemList: comnNumberBoxList.sublist(0,31),
                    containerWidth: 22.w,
                    callBack: (int? id, String text) => {
                      selectedDay = text,
                      setState(() {}),
                    }
                ),

              ],
            ),

            SizedBox(height: 15,),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                LockerRoomDateSettingItem(
                    selectItem: selectedHour,
                    selectItemList: comnNumberBoxList.sublist(0,24),
                    containerWidth: 43.w,
                    callBack: (int? id, String text) => {
                      selectedHour = text,
                      setState(() {}),
                    }
                ),


                Text(' : ',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'EHSMB',
                  ),
                ),

                LockerRoomDateSettingItem(
                    selectItem: selectedMinute,
                    selectItemList: comnNumberBoxList.sublist(0,60),
                    containerWidth: 43.w,
                    callBack: (int? id, String text) => {
                      selectedMinute = text,
                      setState(() {}),
                    }
                ),

              ],
            ),

            SizedBox(height: 20,),


            Text("경기장",
              style: TextStyle(
                  color: Colors.white,
                  fontSize : 16,
                  fontFamily : 'EHSMB'

              ),
            ),
            SizedBox(height: 10,),
            Container(
              width: 100.w,
              height: 5.h,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey,width: 1.5),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Text(
                  location ?? '경기장을 선택해주세요',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontFamily: 'EHSMB'
                  ),
                ),
              ),
            ),

            SizedBox(height: 10,),
            GestureDetector(
              onTap: () async {
                await AppBottomModalRouter.fnModalRouter(context,3, callBack: (value) {
                  location = value.address;

                  WidgetsBinding.instance.addPostFrameCallback((_) async {
                    List<Location> locations = await locationFromAddress(value.roadAddress);
                    if (locations.isNotEmpty) {
                      latitude = locations[0].latitude;
                      longitude = locations[0].longitude;
                    }
                  });

                  setState(() {});
                });
              },
              child: Container(
                width: 100.w,
                height: 5.h,
                decoration: BoxDecoration(
                  color: Colors.white10,
                  border: Border.all(color: Colors.black,width: 1.5),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(
                    '경기장 선택',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontFamily: 'EHSMB'
                    ),
                  ),
                ),
              ),
            ),

            SizedBox(height: 30,),
            Text("매치포인트",
              style: TextStyle(
                  color: Colors.white,
                  fontSize : 16,
                  fontFamily : 'EHSMB'

              ),
            ),
            SizedBox(height: 15,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: (){
                    threeOnThreeYn = 'Y';
                    setState(() {});
                  },
                  child: MatchPointItem(
                      matchPointText: '3 vs 3',
                      matchPointEditStatusYn: threeOnThreeYn,
                      containerWidth: 43.w),
                ),


                GestureDetector(
                  onTap: (){
                    ballYn = (ballYn == 'Y') ? 'N': 'Y';
                    setState(() {});
                  },
                  child: MatchPointItem(
                      matchPointText: '농구공',
                      matchPointEditStatusYn: ballYn,
                      containerWidth: 43.w),
                ),
              ],
            ),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [

                GestureDetector(
                  onTap: (){
                    backBoardYn = (backBoardYn == 'Y') ? 'N': 'Y';
                    setState(() {});
                  },
                  child: MatchPointItem(
                      matchPointText: '백보드',
                      matchPointEditStatusYn: backBoardYn,
                      containerWidth: 25.w),
                ),

                GestureDetector(
                  onTap: (){
                    threePointLimitYn = (threePointLimitYn == 'Y') ? 'N': 'Y';
                    setState(() {});
                  },
                  child: MatchPointItem(
                      matchPointText: '3점 라인 제한',
                      matchPointEditStatusYn: threePointLimitYn,
                      containerWidth: 35.w),
                ),

                GestureDetector(
                  onTap: (){
                    refereeYn = (refereeYn == 'Y') ? 'N': 'Y';
                    setState(() {});
                  },
                  child: MatchPointItem(
                      matchPointText: '심판',
                      matchPointEditStatusYn: refereeYn,
                      containerWidth: 30.w),
                ),


              ],
            ),

            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [

                GestureDetector(
                  onTap: (){
                    halfCourtYn = 'Y';
                    fullCourtYn = 'N';
                    setState(() {});
                  },
                  child: MatchPointItem(
                      matchPointText: '하프코트',
                      matchPointEditStatusYn: halfCourtYn,
                      containerWidth: 43.w),
                ),

                GestureDetector(
                  onTap: (){
                    fullCourtYn = 'Y';
                    halfCourtYn = 'N';
                    setState(() {});
                  },
                  child: MatchPointItem(
                      matchPointText: '풀코트',
                      matchPointEditStatusYn: fullCourtYn,
                      containerWidth: 43.w),
                ),

              ],
            ),
            SizedBox(height: 10,),

            SizedBox(height: 30,),
            GestureDetector(
              onTap: () async {

                  String matchName = lockerRoomTitleEditController.text;
                  String matchDescription = lockerRoomDescriptionEditController.text;
                  String matchDt = "$selectedYear-$selectedMonth-$selectedDay $selectedHour:$selectedMinute";

                  Map<String, String> requestMap = {
                    'chatRoomId' : widget.chatRoomId!,
                    'matchName': matchName,
                    'matchDescription': matchDescription,
                    'matchDt': matchDt,
                    'location': location ?? "",
                    'threeOnThreeYn' : threeOnThreeYn,
                    'ballYn' : ballYn,
                    'backBoardYn' : backBoardYn,
                    'threePointLimitYn' : threePointLimitYn,
                    'refereeYn' :refereeYn,
                    'halfCourtYn' : halfCourtYn,
                  };

                  await matchController.fnMatchRoomInfoUpdate(requestMap);
                  matchController.fnMatchInfo(widget.chatRoomId!);
                  Get.back();
                },
              child: Container(
                width: 100.w,
                height: 5.h,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey,width: 1.5),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(
                    '저장',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontFamily: 'EHSMB'
                    ),
                  ),
                ),
              ),
            ),




          ],
        ),
      ),
    );
  }
}
