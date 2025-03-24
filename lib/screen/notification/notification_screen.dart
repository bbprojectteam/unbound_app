import 'package:badboys/subScreen/notification/notification_item.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      height: 100.h,
      padding: EdgeInsets.only(left: 15,right: 15),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 50,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.arrow_back_rounded,
                    color: Colors.white,
                  ),
                ),
        
                Row(
                  children: [
        
                    GestureDetector(
                      onTap: ()=>{
        
                      },
                      child: Container(
                        color: Color(0xFF1C1C1C),
                        padding: EdgeInsets.all(5),
                        child: Text(
                          '전체 읽음',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w800,
                              fontSize: 12,
                              fontFamily: 'EHSMB'
                          ),
                        ),
                      ),
                    ),
        
                    SizedBox(width: 5,),
        
                    GestureDetector(
                      onTap: ()=>{
                        print('전체삭제'),
        
                      },
                      child: Container(
                        color: Color(0xFF1C1C1C),
                        padding: EdgeInsets.all(5),
                        child: Text(
                          '전체 삭제',
                          style: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.w800,
                              fontSize: 12),
                        ),
                      ),
                    ),
                  ],
                ),
        
        
              ],
            ),
            SizedBox(height: 10),
            Text(
              '오늘',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w800,
                  fontSize: 20),
            ),
            SizedBox(height: 5),
            NotificationItem(),
            NotificationItem(),
            NotificationItem(),
        
            SizedBox(height: 10),
            Text(
              '이번 달',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w800,
                  fontSize: 20),
            ),
            SizedBox(height: 5),
            NotificationItem(),
            NotificationItem(),
            SizedBox(height: 10),
            Text(
              'Year',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w800,
                  fontSize: 20),
            ),
            SizedBox(height: 5),
            NotificationItem(),
            NotificationItem(),
            NotificationItem(),
            NotificationItem(),
            NotificationItem(),
            NotificationItem(),
        
        
        
        
            if(false)...[
              Container(
                width : 100.w,
                padding: EdgeInsets.only(top: 33.h),
                child: Text(
                  '비어있습니다.',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ]
        
        
          ],
        ),
      ),
    );
  }
}
