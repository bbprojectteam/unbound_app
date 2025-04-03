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
    MatchMemberPositionModel(top: 70, left: 40, right: 0),
    MatchMemberPositionModel(top: 120, left: 80, right: 0),
    MatchMemberPositionModel(top: 180, left: 40, right: 0),

    MatchMemberPositionModel(top: 70, left: 230, right: 0),
    MatchMemberPositionModel(top: 120, left: 180, right: 0),
    MatchMemberPositionModel(top: 180, left: 230, right: 0),
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
        print(selectedItemIndex);
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
      height: 47.h,
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(15)
    ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomAppbar(isNotification: false, ),
          Stack(
            children: [
              Image.asset(
                'assets/images/court.png',
                // fit: BoxFit.fill,
                width: 100.w,
                height: 34.h,
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
