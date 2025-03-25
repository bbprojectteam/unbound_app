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
  var _currentPage = 0.obs;   // 현재 페이지 상태
  Rx<Widget> _childNotifier = Rx<Widget>(Container());  // child 화면을 Rx로 관리

  PageController _pageController = PageController();

  @override
  void initState() {
    super.initState();

    // _childNotifier 초기화 (여기서 초기화는 한 번만)
    _childNotifier.value = widget.child;

    _pageController.addListener(() {
      int newPage = _pageController.page!.round();
      if (newPage != _currentPage.value) {
        _currentPage.value = newPage;
      }
    });
  }

  @override
  void didUpdateWidget(covariant AppScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.child != widget.child) {
      _childNotifier.value = widget.child;  // child가 변경되면 갱신
    }
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

    return Scaffold(
      body: Stack(
        children: [
          // ValueListenableBuilder 대신 Rx를 활용한 값의 자동 업데이트
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
            Get.toNamed('/'); // HomeScreen
            _childNotifier.value = HomeScreen();
          } else if (index == 1) {
            _childNotifier.value = MatchScreen();// n
          } else if (index == 2) {
            _childNotifier.value = RankScreen();
          }

        },
      ))
          : null,
    );
  }
}
