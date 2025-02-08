import 'package:badboys/controller/auth_controller.dart';
import 'package:badboys/controller/member_controller.dart';
import 'package:badboys/firebase/firebase_options.dart';
import 'package:badboys/router/app_router.dart';
import 'package:badboys/screen/comn/custom_appbar_screen.dart';
import 'package:badboys/screen/comn/splash_screen.dart';
import 'package:badboys/screen/game/count_down_screen.dart';
import 'package:badboys/screen/inquiry/inquiry_screen.dart';
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
              GetPage(name: '/profileSettingScreen',
                  page: () => AppScreen(child: ProfileSettingScreen())),
              GetPage(name: '/rank',
                  page: () => AppScreen(child: RankScreen())),
              GetPage(name: '/memberPageScreen',
                  page: () => AppScreen(child: MemberPageScreen())),
              GetPage(name: '/lockerRoomScreen',
                  page: () => AppScreen(child: LockerRoomScreen())),
              GetPage(name: '/playingScreen',
                  page: () => AppScreen(child: PlayingScreen())),
              GetPage(name: '/countDownScreen',
                  page: () => AppScreen(child: CountDownScreen())),
              GetPage(name: '/playInfo',
                  page: () => AppScreen(child: PlayInfoScreen())),
              GetPage(name: '/report',
                  page: () => AppScreen(child: ReportScreen())),
              GetPage(name: '/notification',
                  page: () => AppScreen(child: NotificationScreen())),
              GetPage(name: '/inquiry',
                  page: () => AppScreen(child: InquiryScreen())),


            ],
          );
        }
    );
  }
}


