import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CustomCalenderScreen extends StatefulWidget {
  const CustomCalenderScreen({super.key});

  @override
  State<CustomCalenderScreen> createState() => _CustomCalenderScreenState();
}

class _CustomCalenderScreenState extends State<CustomCalenderScreen> {

  DateTime today = DateTime.now();
  late DateTime startDate;
  late DateTime endDate;

  @override
  void initState() {
    super.initState();

    // 오늘 날짜를 기준으로 5일 전부터 5일 후까지 표시
    startDate = today.subtract(Duration(days: 4)); // 5일 전
    endDate = today.add(Duration(days: 4)); // 5일 후

  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [

          ...List.generate(9, (i) {
            DateTime date = startDate.add(Duration(days: i));
            return Container(
              width: 11.w,
              height: 5.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: date.day == today.day ? Border.all(color: Colors.orange,width: 2) : null,

              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // 날짜 표시
                  Text(
                    '${date.day}',
                    style: TextStyle(
                      color: date.weekday == 7 // 일요일은 빨간색
                          ? Colors.red // 오늘 날짜는 흰색 글자
                          : date.weekday == 6 // 토요일은 파란색
                          ? Colors.blue
                          : date.day == today.day // 일요일은 빨간색
                          ? Colors.white
                          : Colors.white, // 평일은 기본 흰색
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  // 요일 표시
                  Text(
                    _getDayOfWeek(date),
                    style: TextStyle(
                      color: date.weekday == 7
                          ? Colors.red // 오늘 날짜는 흰색 글자
                          : date.weekday == 6 // 토요일은 파란색
                          ? Colors.blue
                          : date.day == today.day // 일요일은 빨간색
                          ? Colors.white
                          : Colors.white, // 평일은 기본 흰색
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ],
              ),
            );
          }),
          SizedBox(
            width: 10,
          ),
        ],
      ),
    );
  }

  // 날짜에 맞는 요일을 반환하는 함수
  String _getDayOfWeek(DateTime date) {
    switch (date.weekday) {
      case 1:
        return '월';
      case 2:
        return '화';
      case 3:
        return '수';
      case 4:
        return '목';
      case 5:
        return '금';
      case 6:
        return '토';
      case 7:
        return '일';
      default:
        return '';
    }
  }
}
