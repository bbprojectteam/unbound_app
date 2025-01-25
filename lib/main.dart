import 'package:badboys/firebase/firebase_options.dart';
import 'package:badboys/prov/auth_prov.dart';
import 'package:badboys/prov/member_prov.dart';
import 'package:badboys/router/app_router.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: "env/config.env");
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions,  // FirebaseOptions 설정
  );
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AuthProv()),
        ChangeNotifierProvider(create: (context) => MemberProv()),
      ],
      child: const MyApp(),
    ),
  );
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
