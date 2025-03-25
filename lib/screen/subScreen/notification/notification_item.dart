import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class NotificationItem extends StatefulWidget {
  const NotificationItem({super.key});

  @override
  State<NotificationItem> createState() => _NotificationItemState();
}

class _NotificationItemState extends State<NotificationItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.w,
      height: 7.h,
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(width: 1.3, color: Colors.grey), // 위쪽만 테두리 추가
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  'assets/images/intro.png',
                  width: 40,
                  height: 40,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Container(
                width: 67.w,
                child: Text(
                  '알림입니다',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 18,
                      overflow: TextOverflow.ellipsis
                  ),

                ),
              ),
            ],
          ),
          Text(
            '25-12-23',
            style: TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.w700,
                fontSize: 12,
                overflow: TextOverflow.ellipsis
            ),

          ),

        ],
      ),
    );
  }
}
