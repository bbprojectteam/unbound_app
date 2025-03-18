import 'package:badboys/subScreen/home/home_menu_btn.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class HomeMenuList extends StatefulWidget {
  const HomeMenuList({super.key});

  @override
  State<HomeMenuList> createState() => _HomeMenuListState();
}

class _HomeMenuListState extends State<HomeMenuList> {
  @override
  Widget build(BuildContext context) {
    return Column(

      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            HomeMenuBtn(icon: null,
                imagePath: 'assets/images/admin.png',
                title: "내 정보",
                iconWSize: 6.6.w,
                iconHSize: 3.h,
                uri: '/memberPageScreen',
                arguments: {'tab': 0,}),
            HomeMenuBtn(icon: null,
                imagePath: 'assets/images/rank.png',
                title: "동네랭킹",
                iconWSize: 6.6.w,
                iconHSize: 3.h,
                uri: '/rank',
                arguments: {}),

          ],
        ),
        SizedBox(height: 20,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            HomeMenuBtn(icon: null,
                imagePath: 'assets/images/play_record.png',
                title: "경기기록",
                iconWSize: 6.6.w,
                iconHSize: 3.h,
                uri: '/memberPageScreen',
                arguments: {'tab': 1}),

            HomeMenuBtn(icon: null,
                imagePath: 'assets/images/admin.png',
                title: "문의하기",
                iconWSize: 6.6.w,
                iconHSize: 3.h,
                uri: '/inquiry',
                arguments: {}),

          ],
        ),
      ],
    );
  }
}
