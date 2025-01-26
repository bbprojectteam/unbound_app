import 'package:badboys/screen/comn/custom_appbar_screen.dart';
import 'package:badboys/screen/comn/splash_screen.dart';
import 'package:badboys/screen/gameStart/count_down_screen.dart';
import 'package:badboys/screen/gameStart/playing_screen.dart';
import 'package:badboys/screen/home/home_screen.dart';
import 'package:badboys/screen/info/mercenary_info_screen.dart';
import 'package:badboys/screen/lockerRoom/locker_room_screen.dart';
import 'package:badboys/screen/rank/rank_screen.dart';
import 'package:badboys/screen/register/login.dart';
import 'package:badboys/subScreen/comn/custom_bottom_navigatoion_bar.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:responsive_sizer/responsive_sizer.dart';


final router = GoRouter(
  initialLocation: '/splash',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) {
        return AppScreen(child: HomeScreen());
      },
    ),
    GoRoute(
      path: '/splash',
      builder: (context, state) {
        return AppScreen(child: SplashScreen());
      },
    ),
    GoRoute(
      path: '/login',
      builder: (context, state) {
        return AppScreen(child: LoginScreen());
      },
    ),
    GoRoute(
      path: '/rank',
      builder: (context, state) {
        return AppScreen(child: RankScreen());
      },
    ),
    GoRoute(
      path: '/mercenaryInfoScreen',
      builder: (context, state) {
        return AppScreen(child: MercenaryInfoScreen());
      },
    ),
    GoRoute(
      path: '/lockerRoomScreen',
      builder: (context, state) {
        return AppScreen(child: LockerRoomScreen());
      },
    ),
    GoRoute(
      path: '/playingScreen',
      builder: (context, state) {
        return AppScreen(child: PlayingScreen());
      },
    ),
    GoRoute(
      path: '/countDownScreen',
      builder: (context, state) {
        return AppScreen(child: CountDownScreen());
      },
    ),

  ],
);


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

  final ValueNotifier<Widget> _childNotifier =
      ValueNotifier<Widget>(Container());

  @override
  void initState() {
    _childNotifier.value = widget.child; // 초기 child 설정
    _pageController.addListener(() {
      int newPage = _pageController.page!.round();
      if (newPage != _currentPage) {
        setState(() {
          _currentPage = newPage;
        });
      }
    });

    super.initState();
  }


  @override
  void didUpdateWidget(covariant AppScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    // child가 변경될 때만 값 업데이트
    if (oldWidget.child != widget.child) {
      _childNotifier.value = widget.child;
    }
  }


  @override
  Widget build(BuildContext context) {

    bool showBottomNav =
        !(widget.child is SplashScreen || widget.child is LoginScreen);

    return Scaffold(
      // appBar: CustomAppbarScreen(),

      body: Stack(
        children: [
          ValueListenableBuilder<Widget>(
            valueListenable: _childNotifier,
            builder: (context, child, childWidget) {
              return AnimatedSwitcher(
                duration: const Duration(milliseconds: 700), // 애니메이션 지속 시간
                child: child,
                transitionBuilder: (Widget child, Animation<double> animation) {
                  return FadeTransition(
                      opacity: animation, child: child); // 페이드 애니메이션
                },
              );
            },
          ),

        ],
      ),
      bottomNavigationBar: showBottomNav
          ? CustomBottomNavigationBar(
              currentIndex: _currentIndex,
              onTap: (index) {
                setState(() {
                  _currentIndex = index;
                  // 화면 전환
                  if (index == 0) {
                    context.replace('/');
                  } else if (index == 1) {
                    context.replace('/playingScreen');
                  } else if (index == 2) {
                    context.replace('/rank');
                  } else if (index == 3) {
                    context.replace('/countDownScreen');
                  }
                });
              },
            )
          : null,
    );
  }
}
