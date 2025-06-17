import 'package:badboys/controller/chat_controller.dart';
import 'package:badboys/controller/match_controller.dart';
import 'package:badboys/model/match/match_member_position_model.dart';
import 'package:badboys/model/match/match_model.dart';
import 'package:badboys/screen/subScreen/comn/appbar/custom_appbar.dart';
import 'package:badboys/screen/subScreen/game/member_icon_item.dart';
import 'package:badboys/screen/subScreen/match/matching_button.dart';
import 'package:badboys/utils/helpers.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:flutter/cupertino.dart'; // CupertinoPicker 사용을 위한 임포트

class PlayingResultModal extends StatefulWidget {
  const PlayingResultModal({super.key});

  @override
  State<PlayingResultModal> createState() => _PlayingResultModalState();
}

class _PlayingResultModalState extends State<PlayingResultModal> {

  late MatchController matchController;

  List<MatchMemberPositionModel> matchMemberPositionModel = [
    MatchMemberPositionModel(top: 5.h, left: 15.w, right: 0),
    MatchMemberPositionModel(top: 16.5.h, left: 30.w, right: 0),
    MatchMemberPositionModel(top: 28.h, left: 15.w, right: 0),

    MatchMemberPositionModel(top: 5.h, left: 70.w, right: 0 ),
    MatchMemberPositionModel(top: 16.5.h, left:55.w, right: 0),
    MatchMemberPositionModel(top: 28.h, left: 70.w, right: 0),
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    matchController = Get.find<MatchController>();
  }

  @override
  Widget build(BuildContext context) {

    MatchModel matchModel = matchController.matchModel;

    if (int.parse(matchModel.aTeamValue!) > int.parse(matchModel.bTeamValue!)) {
      matchModel.winTeam = 'a';
    } else if (int.parse(matchModel.aTeamValue!) < int.parse(matchModel.bTeamValue!)) {
      matchModel.winTeam = 'b';
    } else {
      matchModel.winTeam = 'ab';
    }


    return Container(
      width: 100.w,
      height: 90.h,
      color: Colors.black87,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CustomAppbar(isNotification: false, isBackButton : false),
          ),

          Container(
            padding: EdgeInsets.only(left: 25, right: 25),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Stack(
                      children: [
                        // 테두리 텍스트
                        Text(
                          'HOME',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 65,
                            fontFamily: 'backToSchool',
                            shadows: [
                              Shadow(
                                blurRadius: 3.0,
                                color: matchModel.winTeam.contains('a') ? Colors.white : Colors.grey, // 테두리 색상
                                offset: Offset(1.0, 1.0), // 테두리의 위치
                              ),
                            ],
                          ),
                        ),
                        Text(
                          'HOME',
                          style: TextStyle(
                            color: matchModel.winTeam.contains('a') ? Colors.orange : Colors.grey,
                            fontSize: 65,
                            fontFamily: 'backToSchool',
                          ),
                        ),
                      ],
                    ),

                    Stack(
                      children: [
                        // 테두리 텍스트
                        Text(
                          'AWAY',
                          style: TextStyle(
                            color: matchModel.winTeam.contains('b') ? Colors.white : Colors.grey,
                            // 테두리 색상
                            fontSize: 60,
                            fontFamily: 'backToSchool',

                          ),
                        ),
                        // 실제 텍스트
                        Text(
                          'AWAY',
                          style: TextStyle(
                            color: matchModel.winTeam.contains('b') ? Colors.orange : Colors.grey,
                            fontSize: 60,
                            // fontWeight: FontWeight.w600,
                            fontFamily: 'backToSchool',
                          ),
                        ),
                      ],
                    ),


                  ],
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    Stack(
                      children: [
                        Container(
                            width: 35.w,
                            height: 13.5.h,
                            padding: EdgeInsets.only(bottom: 20),
                            decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Align(
                              alignment: Alignment.topCenter,
                              child: Text.rich(
                                TextSpan(
                                  children: [
                                    TextSpan(
                                      text: matchModel.aTeamValue.toString()[0], // 첫 번째 문자
                                      style: TextStyle(
                                        color: int.parse(matchModel.aTeamValue.toString()) <= 10 || !matchModel.winTeam.contains('a')
                                            ? Colors.white10
                                            : Colors.white,
                                        fontSize: 98,
                                        fontFamily: 'EHSMB',
                                        letterSpacing: 0,
                                      ),
                                    ),
                                    TextSpan(
                                      text: matchModel.aTeamValue.toString()[1], // 두 번째 문자
                                      style: TextStyle(
                                        color: int.parse(matchModel.aTeamValue.toString()) == 0 || !matchModel.winTeam.contains('a')
                                            ? Colors.white10
                                            : Colors.white,
                                        fontSize: 98,
                                        fontFamily: 'EHSMB',
                                        letterSpacing: 0,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )
                        ),
                      ],
                    ),


                    Stack(
                      children: [
                        Container(
                            width: 35.w,
                            height: 13.5.h,
                            padding: EdgeInsets.only(bottom: 20),
                            decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Align(
                              alignment: Alignment.topCenter,
                              child: Text.rich(
                                TextSpan(
                                  children: [
                                    TextSpan(
                                      text: matchModel.bTeamValue.toString()[0], // 두 번째 문자
                                      style: TextStyle(
                                        color: int.parse(matchModel.bTeamValue.toString()) <= 10 || !matchModel.winTeam.contains('b')
                                            ? Colors.white10
                                            : Colors.white,
                                        fontSize: 98,
                                        fontFamily: 'EHSMB',
                                        letterSpacing: 0,
                                      ),
                                    ),
                                    TextSpan(
                                      text: matchModel.bTeamValue.toString()[1], // 두 번째 문자
                                      style: TextStyle(
                                        color:  int.parse(matchModel.bTeamValue.toString()) == 0 || !matchModel.winTeam.contains('b')
                                            ? Colors.white10
                                            : Colors.white,
                                        fontSize: 98,
                                        fontFamily: 'EHSMB',
                                        letterSpacing: 0,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )
                        ),
                      ],
                    ),


                  ],
                ),
              ],
            ),
          ),

          SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 40.w,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      width: 10.w,
                      height: 5.h,
                      color: Colors.red,
                      child: Center(
                        child: Text("+ 1",
                          style: TextStyle(
                            color: Colors.black54,
                            fontSize: 25,
                            fontWeight: FontWeight.w700,
                            fontFamily: 'roboto',

                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: 10.w,
                      height: 5.h,
                      color: Colors.red,
                      child: Center(
                        child: Text("+ 2",
                          style: TextStyle(
                            color: Colors.black54,
                            fontSize: 25,
                            fontWeight: FontWeight.w700,
                            fontFamily: 'roboto',

                          ),
                        ),
                      ),
                    ),

                    Container(
                      width: 10.w,
                      height: 5.h,
                      color: Colors.red,
                      child: Center(
                        child: Text("+ 3",
                          style: TextStyle(
                            color: Colors.black54,
                            fontSize: 25,
                            fontWeight: FontWeight.w700,
                            fontFamily: 'roboto',

                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              Container(
                width: 40.w,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      width: 10.w,
                      height: 5.h,
                      color: Colors.red,
                      child: Center(
                        child: Text("+ 1",
                          style: TextStyle(
                            color: Colors.black54,
                            fontSize: 25,
                            fontWeight: FontWeight.w700,
                            fontFamily: 'roboto',

                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: 10.w,
                      height: 5.h,
                      color: Colors.red,
                      child: Center(
                        child: Text("+ 2",
                          style: TextStyle(
                            color: Colors.black54,
                            fontSize: 25,
                            fontWeight: FontWeight.w700,
                            fontFamily: 'roboto',

                          ),
                        ),
                      ),
                    ),

                    Container(
                      width: 10.w,
                      height: 5.h,
                      color: Colors.red,
                      child: Center(
                        child: Text("+ 3",
                          style: TextStyle(
                            color: Colors.black54,
                            fontSize: 25,
                            fontWeight: FontWeight.w700,
                            fontFamily: 'roboto',

                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

            ],
          ),

          Stack(
            children: [
              Image.asset(
                'assets/images/court2.jpg',
                width: 100.w,
                height: 40.h,
                fit: BoxFit.cover,
              ),


              for(int i= 0; i < 6; i++)
                MemberIconItem(
                    memberNickName: matchModel.matchMemberModel[i].username.toString(),
                    memberProfileImage: matchModel.matchMemberModel[i].profileImage.toString(),
                    topHeight: matchMemberPositionModel[i].top,
                    leftWidth: matchMemberPositionModel[i].left
                ),

            ],
          ),
          SizedBox(height: 30,),
          GestureDetector(
            onTap: () async{
              await matchController.fnGameEnd();
              matchController.clear();
              Get.delete<MatchController>();
              Helpers.customFlutterToast("저장되었습니다.");
              Navigator.pop(context);
              Get.toNamed('/lockerRoomScreen',arguments: {'matchingRoomId' : matchModel.matchInfoModel?.chatRoomId.toString()});

            },
            child: Container(
              width: 80.w,
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  border: Border.all(width: 1, color: Colors.orange),
                  color: Colors.orange),
              child: Center(
                child: Text(
                  "저장" ,
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w900,
                      fontSize: 16,
                      letterSpacing: -0.3,
                      fontFamily: 'EHSMB'
                  ),

                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
