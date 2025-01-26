import 'package:badboys/controller/auth_controller.dart';
import 'package:badboys/controller/member_controller.dart';
import 'package:badboys/firebase/firebase_options.dart';
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
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: "env/config.env");
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions,  // FirebaseOptions 설정
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(  // 화면 크기 자동 조정
        builder: (context, orientation, screenType) {
          return GetMaterialApp(
            title: 'Route Ex',
            initialRoute: '/splash', // 초기 경로
            initialBinding: BindingsBuilder(() {
              Get.put(MemberController());  // Put the controller globally
              Get.put(AuthController());  // Put the controller globally
            }),
            getPages: [
              GetPage(name: '/',
                  page: () => AppScreen(child: HomeScreen())),
              GetPage(name: '/splash',
                  page: () => AppScreen(child: SplashScreen())),
              GetPage(name: '/login',
                  page: () => AppScreen(child: LoginScreen())),
              GetPage(name: '/rank',
                  page: () => AppScreen(child: RankScreen())),
              GetPage(name: '/mercenaryInfoScreen',
                  page: () => AppScreen(child: MercenaryInfoScreen())),
              GetPage(name: '/lockerRoomScreen',
                  page: () => AppScreen(child: LockerRoomScreen())),
              GetPage(name: '/playingScreen',
                  page: () => AppScreen(child: PlayingScreen())),
              GetPage(name: '/countDownScreen',
                  page: () => AppScreen(child: CountDownScreen())),
            ],
          );
        }
    );
  }
}

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
    if (oldWidget.child != widget.child) {
      _childNotifier.value = widget.child;
    }
  }

  @override
  Widget build(BuildContext context) {
    bool showBottomNav =
    !(widget.child is SplashScreen || widget.child is LoginScreen);

    return Scaffold(
      body: Stack(
        children: [
          ValueListenableBuilder<Widget>(
            valueListenable: _childNotifier,
            builder: (context, child, childWidget) {
              return AnimatedSwitcher(
                duration: const Duration(milliseconds: 700),
                child: child,
                transitionBuilder: (Widget child, Animation<double> animation) {
                  return FadeTransition(opacity: animation, child: child);
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

            // GetX의 라우팅 사용하여 화면 전환
            if (index == 0) {
              Get.toNamed('/'); // HomeScreen
            } else if (index == 1) {
              Get.toNamed('/playingScreen'); // PlayingScreen
            } else if (index == 2) {
              Get.toNamed('/rank'); // RankScreen
            } else if (index == 3) {
              Get.toNamed('/countDownScreen'); // CountDownScreen
            }
          });
        },
      )
          : null,
    );
  }
}
