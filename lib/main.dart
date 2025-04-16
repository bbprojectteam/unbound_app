import 'package:badboys/controller/auth_controller.dart';
import 'package:badboys/controller/chat_controller.dart';
import 'package:badboys/controller/comment_controller.dart';
import 'package:badboys/controller/match_controller.dart';
import 'package:badboys/controller/member_controller.dart';
import 'package:badboys/fcm/fcm_notifications.dart';
import 'package:badboys/firebase/firebase_options.dart';
import 'package:badboys/router/app_router.dart';
import 'package:badboys/screen/appScreen/splash/splash_screen.dart';
import 'package:badboys/screen/appScreen/game/count_down_screen.dart';
import 'package:badboys/screen/appScreen/game/playing_screen.dart';
import 'package:badboys/screen/appScreen/home/home_screen.dart';
import 'package:badboys/screen/appScreen/info/member_page_screen.dart';
import 'package:badboys/screen/appScreen/inquiry/inquiry_screen.dart';
import 'package:badboys/screen/appScreen/lockerRoom/locker_room_screen.dart';
import 'package:badboys/screen/appScreen/match/match_screen.dart';
import 'package:badboys/screen/appScreen/notification/notification_screen.dart';
import 'package:badboys/screen/appScreen/playHistory/play_history_screen.dart';
import 'package:badboys/screen/appScreen/rank/rank_screen.dart';
import 'package:badboys/screen/appScreen/login/login_screen.dart';
import 'package:badboys/screen/appScreen/register/profile_setting_screen.dart';
import 'package:badboys/screen/appScreen/report/report_screen.dart';
import 'package:badboys/utils/helpers.dart';
import 'package:badboys/utils/permissions.dart';
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
              Get.put(ChatController());
              Get.put(CommentController());
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


