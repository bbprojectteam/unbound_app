import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  bool _isNavigating = false;

  @override
  void initState() {
    super.initState();
    _navigate();
  }

  Future<void> _navigate() async {
    // UserProv userProv = Provider.of<UserProv>(context, listen: false);
    // MemberModel model = userProv.model;

    /// 저장 되어있는 인증정보 가져오기
    // await userProv.loadMemberData();

    await Future.delayed(Duration(seconds: 3));

    GoRouter.of(context).push('/login');


    // if (_isNavigating)
    //   return; // 이미 탐색 중이면 종료
    //
    // setState(() {
    //   _isNavigating = true; // 탐색 중임을 표시
    // });
    //
    // if (model.memberAuthToken != null) {
    //   print('2');
    //   /// authtoken 유효성 검사 필요
    //   if (await userProv.checkAuthToken()) {
    //     print('3');
    //     await userProv.getMemberInfo();
    //
    //   } else {
    //     print('refresh토큰 생성');
    //     /// 리프레쉬 토큰을 전달해 새 authtoken 발행
    //     await userProv.fnSetAuthToken();
    //   }
    //   GoRouter.of(context).push('/');
    // } else {
    //   print('로그인창');
    //   GoRouter.of(context).push('/login');
    // }

  }

  @override
  void dispose() {
    // 필요시 정리 작업 수행
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 100.w,
          height: 100.h,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xff000000), // 상단의 연한 색
                Color(0xff000000),    // 하단의 어두운 색
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Stack(
            children: [
              Image.asset(
                'assets/images/intro.png',
                width: 100.w,
                height: 70.h,
                fit: BoxFit.cover,
              ),

              Positioned(
                bottom: 190,
                left: 10,
                right: 10,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text('Unbound',style: TextStyle(color: Colors.white,fontSize: 30,fontWeight: FontWeight.w900),),
                    SizedBox(height: 10,),
                    Text('listen to your favorite music for',style: TextStyle(color: Colors.grey,fontWeight: FontWeight.w700),),
                    Text('free, anywhere',style: TextStyle(color: Colors.grey,fontWeight: FontWeight.w700),),
                    SizedBox(height: 30,),

                  ],
                ),
              ),
            ],
          ),
        ),

      ),
    );
  }
}
