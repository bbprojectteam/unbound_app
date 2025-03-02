import 'package:badboys/screen/comn/custom_appbar_screen.dart';
import 'package:badboys/screen/comn/splash_screen.dart';
import 'package:badboys/screen/game/count_down_screen.dart';
import 'package:badboys/screen/game/playing_screen.dart';
import 'package:badboys/screen/home/home_screen.dart';
import 'package:badboys/screen/info/member_page_screen.dart';
import 'package:badboys/screen/lockerRoom/locker_room_screen.dart';
import 'package:badboys/screen/rank/rank_screen.dart';
import 'package:badboys/screen/register/login.dart';
import 'package:badboys/screen/register/profile_setting_screen.dart';
import 'package:badboys/subScreen/comn/custom_bottom_navigatoion_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:go_router/go_router.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AppScreen extends StatefulWidget {
  final Widget child;

  AppScreen({required this.child});

  @override
  _AppScreenState createState() => _AppScreenState();
}

class _AppScreenState extends State<AppScreen> {
  int _currentIndex = 0;

  PageController _pageController = PageController();
  int _currentPage = 0;

  final ValueNotifier<Widget> _childNotifier = ValueNotifier<Widget>(Container());

  @override
  void initState() {
    _childNotifier.value = widget.child; // 초기 child 설정
    _pageController.addListener(() {
      int newPage = _pageController.page!.round();
      if (newPage != _currentPage) {
        _currentPage = newPage;
        setState(() {});
      }
    });

    super.initState();
  }

  @override
  void didUpdateWidget(covariant AppScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.child != widget.child) {
      _childNotifier.value = widget.child;
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

          ValueListenableBuilder<Widget>(
            valueListenable: _childNotifier,
            builder: (context, child, childWidget) {
              return child;
            },
          ),

        ],
      ),
      bottomNavigationBar: showBottomNav
          ? CustomBottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          _currentIndex = index;
          if (index == 0) {
            Get.toNamed('/'); // HomeScreen
          } else if (index == 1) {
            Get.toNamed('/rank'); // PlayingScreen
          } else if (index == 2) {
            Get.toNamed('/match'); // PlayingScreen
          } else if (index == 3) {
            Get.toNamed('/rank'); // RankScreen
          } else if (index == 4) {
            Get.toNamed('/rank'); // CountDownScreen
          }


        },
      )
          : null,
    );
  }
}
