import 'package:badboys/screen/appScreen/splash/splash_screen.dart';
import 'package:badboys/screen/appScreen/game/count_down_screen.dart';
import 'package:badboys/screen/appScreen/game/playing_screen.dart';
import 'package:badboys/screen/appScreen/home/home_screen.dart';
import 'package:badboys/screen/appScreen/match/match_screen.dart';
import 'package:badboys/screen/appScreen/rank/rank_screen.dart';
import 'package:badboys/screen/appScreen/login/login_screen.dart';
import 'package:badboys/screen/appScreen/register/profile_setting_screen.dart';
import 'package:badboys/screen/subScreen/comn/bottomNavigatorBar/custom_bottom_navigatoion_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';


class AppScreen extends StatefulWidget {
  final Widget child;

  AppScreen({required this.child});

  @override
  _AppScreenState createState() => _AppScreenState();
}

class _AppScreenState extends State<AppScreen> {
  var _currentIndex = 0.obs;  // 바텀 네비게이션의 인덱스

  Rx<Widget> _childNotifier = Rx<Widget>(Container());  // child 화면을 Rx로 관리

  @override
  void initState() {
    super.initState();
    _childNotifier.value = widget.child;
  }


  @override
  Widget build(BuildContext context) {


    bool showBottomNav = !(
        widget.child is SplashScreen ||
            widget.child is LoginScreen ||
            widget.child is ProfileSettingScreen ||
            widget.child is CountDownScreen ||
            widget.child is PlayingScreen
    );

    print('앱스크린 빌드');

    return Scaffold(
      body: Stack(
        children: [
          Obx(() => _childNotifier.value),
        ],
      ),
      bottomNavigationBar: showBottomNav
          ? Obx(() => CustomBottomNavigationBar(
        currentIndex: _currentIndex.value,
        onTap: (index) {
          // 상태 변경 (Rx)
          _currentIndex.value = index;

          // 페이지 전환
          if (index == 0) {
            _childNotifier.value = HomeScreen(); // HomeScreen
          } else if (index == 1) {
            _childNotifier.value = MatchScreen();
          } else if (index == 2) {
            _childNotifier.value = RankScreen();
          }

        },
      ))
          : null,
    );
  }
}
