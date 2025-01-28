import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';


class EventListItem extends StatefulWidget {
  const EventListItem({super.key});

  @override
  State<EventListItem> createState() => _EventListItemState();
}

class _EventListItemState extends State<EventListItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      // width: 100.w,
      // height: 30.h,
      decoration: BoxDecoration(
        color: Colors.black,
        border: Border.all(color: Colors.black,width: 1)
      ),
      child: Column(
        children: [
          Image.asset(
            'assets/images/intro.png',
            width: 95.w,
            height: 20.h,
            fit: BoxFit.cover,
          ),
          SizedBox(height: 7,),
          Text('이벤트 텍스트 입니다',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w800,
              fontSize: 18
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 20,bottom: 10),
            width: 100.w,
            height: 1,
            color: Colors.white.withOpacity(0.3),
          ),
        ],
      ),
    );
  }
}
