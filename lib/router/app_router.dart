import 'package:badboys/controller/global_controller.dart';
import 'package:badboys/screen/appScreen/setting/setting_screen.dart';
import 'package:badboys/screen/appScreen/splash/splash_screen.dart';
import 'package:badboys/screen/appScreen/game/count_down_screen.dart';
import 'package:badboys/screen/appScreen/game/playing_screen.dart';
import 'package:badboys/screen/appScreen/home/home_screen.dart';
import 'package:badboys/screen/appScreen/match/match_screen.dart';
import 'package:badboys/screen/appScreen/rank/rank_screen.dart';
import 'package:badboys/screen/appScreen/login/login_screen.dart';
import 'package:badboys/screen/modal/member/profile_setting_modal.dart';
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
  Rx<Widget> _childNotifier = Rx<Widget>(Container());  // child 화면을 Rx로 관리
  late GlobalController globalController;

  @override
  void initState() {
    super.initState();
    _childNotifier.value = widget.child;
    globalController = Get.find<GlobalController>();
  }


  @override
  Widget build(BuildContext context) {

    bool showBottomNav = !(
        widget.child is SplashScreen ||
            widget.child is LoginScreen ||
            widget.child is ProfileSettingModal ||
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
        currentIndex: globalController.bottomNavigatorIndex.value,
        onTap: (index) {
          // 상태 변경 (Rx)
          globalController.bottomNavigatorIndex.value = index;

          // 페이지 전환
          if (index == 0) {
            Get.offNamed('/');
          } else if (index == 1) {
            Get.offNamed('/match');
          } else if (index == 2) {
            Get.offNamed('/setting');
          }

          globalController.update();

        },
      ))
          : null,
    );
  }
}
