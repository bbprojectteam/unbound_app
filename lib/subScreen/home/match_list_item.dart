import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MatchListItem extends StatefulWidget {
  const MatchListItem({
    super.key,
  });

  @override
  State<MatchListItem> createState() => _MatchListItemState();
}

class _MatchListItemState extends State<MatchListItem> {
  @override
  Widget build(BuildContext context) {
    double maxWidth = MediaQuery.of(context).size.width;
    double maxHeight = MediaQuery.of(context).size.height;

    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.grey,
            width: 1,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              Text('12:00',style: TextStyle(fontWeight: FontWeight.w900,fontSize: 17,letterSpacing: -0.3,color: Colors.white),),
              SizedBox(width: maxWidth * 0.05,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('지금 신청하면 5,000원 할인',style: TextStyle(color: Colors.white,),),
                  Text('대전 서구 실내 농구장',style: TextStyle(fontWeight: FontWeight.w800,color: Colors.white),),
                  Text('남녀 모두 - 3vs3',style: TextStyle(fontSize: 14,color: Colors.white.withOpacity(0.8)),),
                ],
              ),
            ],
          ),

          GestureDetector(
            onTap: () async {
              SharedPreferences prefs = await SharedPreferences.getInstance();
              String? matchingRoomId =  await prefs.getString('matchingRoomId');
              Get.toNamed('/lockerRoomScreen',arguments: {'matchingRoomId' : matchingRoomId});
            },
            child: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(width: 1,color: Colors.orange),
                color: Colors.orange
              ),
              child: Text('자세히 보기',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w900,fontSize: 13,letterSpacing: -0.3),),
            ),
          ),

        ],
      ),
    );
  }
}
