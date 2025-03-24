import 'package:badboys/router/app_bottom_modal_router.dart';
import 'package:badboys/screen/comn/custom_appbar_screen.dart';
import 'package:badboys/subScreen/lockerRoom/lockerRoom/match_point_item.dart';
import 'package:badboys/subScreen/register/profile_setting_text_field.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class LockerRoomSettingModalPop extends StatefulWidget {
  const LockerRoomSettingModalPop({
    super.key,
    required this.chatRoomId,
  });

  final String? chatRoomId;

  @override
  State<LockerRoomSettingModalPop> createState() => _LockerRoomSettingModalPopState();
}

class _LockerRoomSettingModalPopState extends State<LockerRoomSettingModalPop> {


  TextEditingController lockerRoomTitleEditController = TextEditingController();
  TextEditingController playMonthEditController = TextEditingController();
  TextEditingController playDayEditController = TextEditingController();
  TextEditingController localeEditController = TextEditingController();

  bool chk1 = false;
  bool chk2 = false;
  bool chk3 = false;
  bool chk4 = false;
  bool chk5 = false;
  bool chk6 = false;
  bool chk7 = false;
  bool chk8 = false;
  bool chk9 = false;



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
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
            CustomAppbarScreen(isNotification: false, ),
            SizedBox(height: 40,),

            ProfileSettingTextField(labelText: "방 제목",textEditingController: lockerRoomTitleEditController),

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
                      '2025',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontFamily: 'EHSMB'
                      ),
                    ),
                  ),
                ),

                Container(
                  width: 22.w,
                  height: 5.h,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey,width: 1.5),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text(
                      '05',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontFamily: 'EHSMB'
                      ),
                    ),
                  ),
                ),

                Container(
                  width: 22.w,
                  height: 5.h,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey,width: 1.5),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text(
                      '21',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontFamily: 'EHSMB'
                      ),
                    ),
                  ),
                ),

              ],
            ),

            SizedBox(height: 30,),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [


                Container(
                  width: 43.w,
                  height: 5.h,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey,width: 1.5),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text(
                      '12',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontFamily: 'EHSMB'
                      ),
                    ),
                  ),
                ),
                Text(' : ',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'EHSMB',
                  ),
                ),
                Container(
                  width: 43.w,
                  height: 5.h,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey,width: 1.5),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text(
                      '30',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontFamily: 'EHSMB'
                      ),
                    ),
                  ),
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
              onTap: (){
                AppBottomModalRouter.fnModalRouter(context,3);
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
              onTap: (){

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
