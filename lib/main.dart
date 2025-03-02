import 'package:badboys/controller/auth_controller.dart';
import 'package:badboys/controller/match_controller.dart';
import 'package:badboys/controller/member_controller.dart';
import 'package:badboys/fcm/fcm_notifications.dart';
import 'package:badboys/firebase/firebase_options.dart';
import 'package:badboys/router/app_router.dart';
import 'package:badboys/screen/comn/custom_appbar_screen.dart';
import 'package:badboys/screen/comn/splash_screen.dart';
import 'package:badboys/screen/game/count_down_screen.dart';
import 'package:badboys/screen/inquiry/inquiry_screen.dart';
import 'package:badboys/screen/match/match_screen.dart';
import 'package:badboys/screen/playHistory/play_history_screen.dart';
import 'package:badboys/screen/game/playing_screen.dart';
import 'package:badboys/screen/home/home_screen.dart';
import 'package:badboys/screen/info/member_page_screen.dart';
import 'package:badboys/screen/lockerRoom/locker_room_screen.dart';
import 'package:badboys/screen/notification/notification_screen.dart';
import 'package:badboys/screen/rank/rank_screen.dart';
import 'package:badboys/screen/register/login.dart';
import 'package:badboys/screen/register/profile_setting_screen.dart';
import 'package:badboys/screen/report/report_screen.dart';
import 'package:badboys/subScreen/comn/custom_bottom_navigatoion_bar.dart';
import 'package:badboys/utils/helpers.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'package:badboys/utils/permissions.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: "env/config.env");
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions,  // FirebaseOptions 설정
  );
  FcmNotifications.initializeNotification();
  await Helpers.fnSetRegionList();
  Permissions.requestNotificationPermission();  // 알림 권한 요청
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
              Get.put(MatchController());  // Put the controller globally
              Get.put(AuthController());  // Put the controller globally
            }),
            getPages: [
              GetPage(name: '/',
                  transition: Transition.fadeIn,
                  page: () => AppScreen(child: HomeScreen())),
              GetPage(name: '/splash',
                  transition: Transition.fadeIn,
                  page: () => AppScreen(child: SplashScreen())),
              GetPage(name: '/login',
                  transition: Transition.fadeIn,
                  page: () => AppScreen(child: LoginScreen())),
              GetPage(name: '/profileSettingScreen',
                  transition: Transition.fadeIn,
                  page: () => AppScreen(child: ProfileSettingScreen())),
              GetPage(name: '/match',
                  transition: Transition.fadeIn,
                  page: () => AppScreen(child: MatchScreen())),
              GetPage(name: '/rank',
                  transition: Transition.fadeIn,
                  page: () => AppScreen(child: RankScreen())),
              GetPage(name: '/memberPageScreen',
                  transition: Transition.fadeIn,
                  page: () => AppScreen(child: MemberPageScreen())),
              GetPage(name: '/lockerRoomScreen',
                  transition: Transition.fadeIn,
                  page: () => AppScreen(child: LockerRoomScreen())),
              GetPage(name: '/playingScreen',
                  transition: Transition.fadeIn,
                  page: () => AppScreen(child: PlayingScreen())),
              GetPage(name: '/countDownScreen',
                  transition: Transition.fadeIn,
                  page: () => AppScreen(child: CountDownScreen())),
              GetPage(name: '/playInfo',
                  transition: Transition.fadeIn,
                  page: () => AppScreen(child: PlayInfoScreen())),
              GetPage(name: '/report',
                  transition: Transition.fadeIn,
                  page: () => AppScreen(child: ReportScreen())),
              GetPage(name: '/notification',
                  transition: Transition.fadeIn,
                  page: () => AppScreen(child: NotificationScreen())),
              GetPage(name: '/inquiry',
                  transition: Transition.fadeIn,
                  page: () => AppScreen(child: InquiryScreen())),


            ],
          );
        }
    );
  }
}


