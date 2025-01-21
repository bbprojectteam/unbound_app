import 'package:badboys/firebase/firebase_options.dart';
import 'package:badboys/router/app_router.dart';
import 'package:badboys/screen/chat/chat_list_screen.dart';
import 'package:badboys/screen/comn/custom_bottom_nav_screen.dart';
import 'package:badboys/screen/gameStart/count_down_screen.dart';
import 'package:badboys/screen/gameStart/playing_screen.dart';
import 'package:badboys/screen/home/home_screen.dart';
import 'package:badboys/screen/info/mercenary_info_screen.dart';
import 'package:badboys/screen/lockerRoom/locker_room_screen.dart';
import 'package:badboys/screen/rank/rank_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions,  // FirebaseOptions 설정
  );

  runApp(MyApp());
}

// _navScreen = <Widget>[
//   HomeScreen(fnRouter: fnRouter,),
//   ChatListScreen(fnRouter: fnRouter,),
//   RankScreen(fnRouter: fnRouter,),
//   MercenaryInfoScreen(),
//   LockerRoomScreen(fnRouter: fnRouter,),
//   PlayingScreen(fnRouter: fnRouter,),
//   CountDownScreen(fnRouter: fnRouter,),
// ];




class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(  // 화면 크기 자동 조정
      builder: (context, orientation, screenType) {
        return MaterialApp.router(
          routerConfig: router,
          title: 'go_router',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
            useMaterial3: true,
          ),
        );
      },
    );
  }
}
