import 'dart:async'; // Timer 사용을 위해 추가
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CountDownScreen extends StatefulWidget {
  const CountDownScreen({super.key});

  @override
  State<CountDownScreen> createState() => _CountDownScreenState();
}

class _CountDownScreenState extends State<CountDownScreen> {
  int _count = 5; // 카운트다운을 5부터 시작
  String? _countText; // 카운트다운 텍스트를 null로 초기화
  Timer? _timer; // Timer를 사용해서 카운트 다운

  @override
  void initState() {
    super.initState();
    _countText = _count.toString(); // 첫 번째 카운트 텍스트 초기화

    // 카운트다운 시작
    _startCountdown();
  }

  // 카운트다운을 처리하는 함수
  void _startCountdown() {
    // 1초마다 카운트 감소
    _timer = Timer.periodic(Duration(milliseconds: 1300), (timer) {
      if (_count > 1) {
        setState(() {
          _count--;
          _countText = _count.toString();
        });
      } else if (_count == 1) {
        setState(() {
          _countText = _count.toString(); // 1초 남았을 때 텍스트 변경
        });
        _timer?.cancel(); // 타이머 종료
        // 경기 시작 화면으로 이동
        Future.delayed(Duration(milliseconds: 1300), () {
          Get.toNamed('/playingScreen');
        });
      }
    });
  }

  @override
  void dispose() {
    // 화면을 벗어날 때 타이머 종료
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: 100.w,
        height: 100.h,
        color: Colors.black,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // 카운트다운 숫자 텍스트
            AnimatedSwitcher(
              duration: Duration(milliseconds: 1300), // 애니메이션 지속 시간
              transitionBuilder: (Widget child, Animation<double> animation) {
                // 애니메이션 효과 정의 (fade와 scale을 합친 효과)
                return ScaleTransition(
                  scale: animation,
                  child: FadeTransition(
                    opacity: animation,
                    child: child,
                  ),
                );
              },
              child: Text(
                _countText ?? '', // null일 경우 빈 문자열로 처리
                key: ValueKey<int>(_count), // 카운트가 변경될 때마다 키를 변경해서 애니메이션을 트리거
                style: TextStyle(
                  fontSize: 100, // 숫자 크기
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                    fontFamily: 'EHSMB'
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
