import 'package:badboys/model/match/match_member_position_model.dart';
import 'package:badboys/screen/subScreen/comn/appbar/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';



class TeamChngModalPop extends StatefulWidget {
  const TeamChngModalPop({super.key});

  @override
  State<TeamChngModalPop> createState() => _TeamChngModalPopState();
}

class _TeamChngModalPopState extends State<TeamChngModalPop> {
  List<MatchMemberPositionModel> items = [
    MatchMemberPositionModel(top: 5.h, left: 15.w, right: 0),
    MatchMemberPositionModel(top: 16.5.h, left: 30.w, right: 0),
    MatchMemberPositionModel(top: 28.h, left: 15.w, right: 0),

    MatchMemberPositionModel(top: 5.h, left: 70.w, right: 0 ),
    MatchMemberPositionModel(top: 16.5.h, left:55.w, right: 0),
    MatchMemberPositionModel(top: 28.h, left: 70.w, right: 0),
  ];




  int? selectedItemIndex;

  void _swapPositions(int firstIndex, int secondIndex) {
    setState(() {
      MatchMemberPositionModel temp = items[firstIndex - 1];
      items[firstIndex - 1] = items[secondIndex - 1];
      items[secondIndex - 1] = temp;
    });
  }

  void _onItemTap(int itemIndex) {
    setState(() {
      if (selectedItemIndex == null) {
        selectedItemIndex = itemIndex;
      } else if (selectedItemIndex != itemIndex) {
        _swapPositions(selectedItemIndex!, itemIndex);
        selectedItemIndex = null;
      }
    });
  }

  @override
  Widget build(BuildContext context) {


    return Container(
      width: 100.w,
      height: 100.h,
      decoration: BoxDecoration(
        color: Colors.black,
    ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 50,),
          CustomAppbar(isNotification: false, ),

          Container(
            padding: EdgeInsets.only(left: 25, right: 25),
            child: Row(
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
          ),

          SizedBox(height: 150,),

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

              for (int i = 0; i < items.length; i++)
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
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        border: Border.all(color: (i + 1) == selectedItemIndex ? Colors.red : Colors.white, width: 3),
                      ),
                      child: ClipOval(
                        child: Image.asset(
                          'assets/images/intro.png',
                          width: 13.w,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                ),
            ],
          ),

          GestureDetector(
            onTap: ()=>{
              Navigator.pop(context)
            },
            child: Container(
              width: 100.w,
              height: 5.h,
              color: Colors.black,
              child: Center(
                child: Text(
                  '변경 완료',
                  style: TextStyle(color: Colors.white,fontWeight: FontWeight.w700,fontSize: 17,fontFamily: 'EHSMB'),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
