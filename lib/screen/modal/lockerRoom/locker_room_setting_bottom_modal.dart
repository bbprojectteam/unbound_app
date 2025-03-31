import 'package:badboys/controller/match_controller.dart';
import 'package:badboys/router/app_bottom_modal_router.dart';
import 'package:badboys/screen/modal/comn/select_bottom_modal_screen.dart';
import 'package:badboys/screen/modal/lockerRoom/locker_room_date_setting_item.dart';
import 'package:badboys/screen/subScreen/comn/appbar/custom_appbar.dart';
import 'package:badboys/screen/subScreen/lockerRoom/lockerRoom/match_point_item.dart';
import 'package:badboys/screen/subScreen/register/profile_setting_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class LockerRoomSettingBottomModal extends StatefulWidget {
  const LockerRoomSettingBottomModal({
    super.key,
    required this.chatRoomId,
  });

  final String? chatRoomId;

  @override
  State<LockerRoomSettingBottomModal> createState() => _LockerRoomSettingBottomModalState();
}

class _LockerRoomSettingBottomModalState extends State<LockerRoomSettingBottomModal> {

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


  TextEditingController lockerRoomTitleEditController = TextEditingController();
  TextEditingController localeEditController = TextEditingController();

  bool chk1 = true;
  bool chk2 = false;
  bool chk3 = false;
  bool chk4 = false;
  bool chk5 = false;
  bool chk6 = false;
  bool chk7 = false;
  bool chk8 = false;
  bool chk9 = false;


  late MatchController matchController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    matchController = Get.find<MatchController>();


    lockerRoomTitleEditController.text = "새 라커룸";
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
            CustomAppbar(isNotification: false, ),
            SizedBox(height: 40,),

            ProfileSettingTextField(labelText: "방 제목",textEditingController: lockerRoomTitleEditController,maxLines: 1,),

            SizedBox(height: 35,),

            Text("경기 날짜 선택",
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
                      border: Border.all(color: Colors.orange,width: 1.5),
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

            SizedBox(height: 30,),

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

            SizedBox(height: 35,),


            Text("경기장 선택",
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
                  '경기장을 선택해주세요',
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
                await AppBottomModalRouter.fnModalRouter(context,3);
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
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: (){
                    chk1 = true;
                    setState(() {});
                  },
                  child: MatchPointItem(
                      matchPointText: '3 vs 3',
                      matchPointEditStatus: chk1,
                      containerWidth: 43.w),
                ),


                GestureDetector(
                  onTap: (){
                    chk2 = !chk2;
                    setState(() {});
                  },
                  child: MatchPointItem(
                      matchPointText: '농구공',
                      matchPointEditStatus: chk2,
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
                    chk3 = !chk3;
                    setState(() {});
                  },
                  child: MatchPointItem(
                      matchPointText: '백보드',
                      matchPointEditStatus: chk3,
                      containerWidth: 25.w),
                ),

                GestureDetector(
                  onTap: (){
                    chk4 = !chk4;
                    setState(() {});
                  },
                  child: MatchPointItem(
                      matchPointText: '3점 라인 제한',
                      matchPointEditStatus: chk4,
                      containerWidth: 35.w),
                ),

                GestureDetector(
                  onTap: (){
                    chk5 = !chk5;
                    setState(() {});
                  },
                  child: MatchPointItem(
                      matchPointText: '심판',
                      matchPointEditStatus: chk5,
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
                    chk6 = !chk6;
                    setState(() {});
                  },
                  child: MatchPointItem(
                      matchPointText: '하프코트',
                      matchPointEditStatus: chk6,
                      containerWidth: 43.w),
                ),

                GestureDetector(
                  onTap: (){
                    chk7 = !chk7;
                    setState(() {});
                  },
                  child: MatchPointItem(
                      matchPointText: '풀코트',
                      matchPointEditStatus: chk7,
                      containerWidth: 43.w),
                ),

              ],
            ),
            SizedBox(height: 10,),

            SizedBox(height: 30,),
            GestureDetector(
              onTap: () async {

                  String matchName = lockerRoomTitleEditController.text;
                  String matchDt = "$selectedYear-$selectedMonth-$selectedDay $selectedHour:$selectedMinute";

                  Map<String, String> requestMap = {
                    'chatRoomId' : widget.chatRoomId!,
                    'matchName': matchName,
                    'matchDt': matchDt,
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
