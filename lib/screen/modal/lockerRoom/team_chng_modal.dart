import 'package:badboys/controller/match_controller.dart';
import 'package:badboys/model/match/match_member_position_model.dart';
import 'package:badboys/model/match/match_model.dart';
import 'package:badboys/model/member/user_info.dart';
import 'package:badboys/screen/subScreen/comn/appbar/custom_appbar.dart';
import 'package:badboys/screen/subScreen/comn/cachedNetworkImage/custom_cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class TeamChngModal extends StatefulWidget {
  const TeamChngModal({super.key});

  @override
  State<TeamChngModal> createState() => _TeamChngModalState();
}


class _TeamChngModalState extends State<TeamChngModal> {

  late MatchController matchController;
  late MatchModel matchModel;
  int? selectedItemIndex;

  List<MatchMemberPositionModel> items = [
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

  void _swapPositions(int firstIndex, int secondIndex) {
    UserInfo memberTemp = matchModel.matchMemberModel[firstIndex - 1];
    matchModel.matchMemberModel[firstIndex - 1] = matchModel.matchMemberModel[secondIndex - 1];
    matchModel.matchMemberModel[secondIndex - 1] = memberTemp;
  }

  void _onItemTap(int itemIndex) {
      if (selectedItemIndex == null) {
        selectedItemIndex = itemIndex;
      } else if (selectedItemIndex != itemIndex) {
        _swapPositions(selectedItemIndex!, itemIndex);
        selectedItemIndex = null;
      }

      setState(() {});
  }

  @override
  Widget build(BuildContext context) {

    return GetBuilder<MatchController>(
        init: matchController,
        builder: (matchControllerContext) {

          matchModel = matchController.matchModel;

          return Container(
          width: 100.w,
          height: 100.h,
          decoration: BoxDecoration(
            color: Colors.black87,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 50,),
              CustomAppbar(isNotification: false, isBackButton : false ),

              Container(
                padding: EdgeInsets.only(left: 25, right: 25),
                child: Column(
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
                                // 테두리 색상
                                fontSize: 65,
                                // fontWeight: FontWeight.w600,
                                fontFamily: 'backToSchool',
                                shadows: [
                                  Shadow(
                                    blurRadius: 3.0,
                                    color: Colors.white, // 테두리 색상
                                    offset: Offset(1.0, 1.0), // 테두리의 위치
                                  ),
                                ],
                              ),
                            ),
                            // 실제 텍스트
                            Text(
                              'HOME',
                              style: TextStyle(
                                color: Colors.orange,
                                fontSize: 65,
                                // fontWeight: FontWeight.w600,
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
                                color: Colors.orange,
                                // 테두리 색상
                                fontSize: 60,
                                // fontWeight: FontWeight.w600,
                                fontFamily: 'backToSchool',

                              ),
                            ),
                            // 실제 텍스트
                            Text(
                              'AWAY',
                              style: TextStyle(
                                color: Colors.orange,
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

                        Container(
                          width: 35.w,
                          height: 13.5.h,
                          padding: EdgeInsets.only(bottom: 20),
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Center(
                            child: Text(
                              "00",
                              style: TextStyle(
                                color: Colors.white10,
                                fontSize: 98,
                                fontFamily: 'EHSMB',
                                letterSpacing: 0,
                              ),
                            ),
                          ),
                        ),


                        Container(
                          width: 35.w,
                          height: 13.5.h,
                          padding: EdgeInsets.only(bottom: 20),
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Center(
                            child: Text(
                              "00",
                              style: TextStyle(
                                color: Colors.white10,
                                fontSize: 98,
                                fontFamily: 'EHSMB',
                                letterSpacing: 0,
                              ),
                            ),
                          ),
                        ),


                      ],
                    ),
                  ],
                ),
              ),



              SizedBox(height: 30,),

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

                  for (int i = 0; i < matchModel.matchMemberModel.length; i++)
                    AnimatedPositioned(
                      top: items[i].top,
                      left: items[i].left != 0 ? items[i].left : null,
                      right: items[i].right != 0 ? items[i].right : null,
                      duration: Duration(milliseconds: 500),
                      curve: Curves.easeInOut,
                      child: GestureDetector(
                        onTap: () {
                          _onItemTap(i + 1);
                        },
                        child: Column(
                          children: [
                            AnimatedContainer(
                              duration: Duration(milliseconds: 300),
                              curve: Curves.easeInOut,
                              width: (i + 1) == selectedItemIndex ? 17.w : 15.w,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                border: Border.all(
                                  color: (i + 1) == selectedItemIndex ? Colors.orange : Colors.transparent,
                                  width: 5,
                                ),
                              ),
                              child: ClipOval(
                                child: CustomCachedNetworkImage(
                                  imagePath: matchModel.matchMemberModel[i].profileImage,
                                  imageWidth:(i + 1) == selectedItemIndex ? 17.w : 15.w,
                                  imageHeight: null,

                                ),
                              ),
                            ),

                            Text(
                              matchModel.matchMemberModel[i].username.toString(),
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 13.5,
                                fontWeight: FontWeight.w700,
                                fontFamily: 'EHSMB',
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                ],
              ),

              SizedBox(height: 40,),

              Center(
                child: GestureDetector(
                  onTap: () async {
                    await matchController.fnGameStart();
                    Navigator.pop(context);
                  },
                  child: Container(
                    width: 50.w,
                    height: 5.h,
                    color: Colors.orange,
                    child: Center(
                      child: Text(
                        '경기 시작',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 17,
                            fontFamily: 'EHSMB'),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      }
    );
  }
}
