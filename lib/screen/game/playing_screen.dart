import 'package:badboys/screen/comn/custom_appbar_screen.dart';
import 'package:badboys/modal/playing_result_modal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:async';

import 'package:responsive_sizer/responsive_sizer.dart'; // 타이머를 사용하기 위한 패키지

class PlayingScreen extends StatefulWidget {
  const PlayingScreen({
    super.key,
  });


  @override
  State<PlayingScreen> createState() => _PlayingScreenState();
}

class _PlayingScreenState extends State<PlayingScreen> {
  late Timer _timer; // 타이머 객체
  int _milliseconds = 0; // 밀리세컨드
  int _seconds = 0; // 초
  int _minutes = 0; // 분
  bool _isRunning = false; // 타이머가 실행 중인지 여부 (초기 값은 false)

  // 화면이 처음 로드될 때 타이머를 시작
  @override
  void initState() {
    super.initState();
    // 타이머는 initState에서 바로 시작하지 않도록 변경
    // 버튼이 눌리면 시작하도록 로직을 변경
    _startTimer();
  }

  // 타이머 시작 함수
  void _startTimer() {
    if (_isRunning) return; // 이미 실행 중이라면 실행하지 않음

    setState(() {
      _isRunning = true; // 타이머가 실행 중임을 설정
    });

    _timer = Timer.periodic(Duration(milliseconds: 10), (timer) {
      setState(() {
        _milliseconds++; // 10ms마다 밀리세컨드 증가
        if (_milliseconds >= 100) {
          _milliseconds = 0;
          _seconds++; // 100ms가 지나면 초를 증가
        }
        if (_seconds >= 60) {
          _seconds = 0;
          _minutes++; // 60초가 지나면 분을 증가
        }
      });
    });
  }

  // 타이머 멈추기 함수
  void _stopTimer() {
    if (!_isRunning) return; // 이미 멈춘 상태면 아무 작업도 하지 않음

    setState(() {
      _isRunning = false; // 타이머를 멈추는 상태로 설정
    });

    _timer.cancel(); // 타이머 취소
  }

  // 타이머 초기화 함수
  void _resetTimer() {
    if (_isRunning) {
      _stopTimer(); // 타이머가 실행 중이면 멈추고
    }
    setState(() {
      _milliseconds = 0; // 밀리세컨드 초기화
      _seconds = 0; // 초 초기화
      _minutes = 0; // 분 초기화
    });
  }

  // 시간을 'mm:ss:SS' 형식으로 변환하는 함수
  String _formatTime(int minutes, int seconds, int milliseconds) {
    return "${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}:${milliseconds.toString().padLeft(2, '0')}";
  }

  @override
  void dispose() {
    if (_isRunning) {
      _timer.cancel(); // 페이지가 닫힐 때 타이머를 취소
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double maxWidth = MediaQuery.of(context).size.width;
    double maxHeight = MediaQuery.of(context).size.height;

    return Container(
      color: Colors.black,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 40,),
          CustomAppbarScreen(
            isNotification: true,
            isListMenu: false,
          ),



          // 경기 이름 텍스트

          SizedBox(height: 5),


          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  for (int i = 0; i < 3; i++)
                    ClipOval(
                      child: Image.asset(
                        'assets/images/intro.png',
                        width: 40,
                        height: 40,
                        fit: BoxFit.fill,
                      ),
                    ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'vs',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                    fontWeight: FontWeight.w600
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  for (int i = 0; i < 3; i++)
                    ClipOval(
                      child: Image.asset(
                        'assets/images/intro.png',
                        width: 40,
                        height: 40,
                        fit: BoxFit.fill,
                      ),
                    ),
                ],
              ),

            ],
          ),



          // _minutes, _seconds, _milliseconds



          SizedBox(height: 25),
          // 타이머 화면
          Container(
            width: maxWidth,
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [

                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width : maxWidth * 0.28,
                        height: maxHeight * 0.065,
                        decoration: BoxDecoration(
                          color: Color(0xff333333),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Text('00',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 27,
                              fontWeight: FontWeight.w700
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 10,),
                      Text('시',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.w500
                        ),
                      ),

                    ],
                  ),

                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width : maxWidth * 0.28,
                        height: maxHeight * 0.065,
                        decoration: BoxDecoration(
                          color: Color(0xff333333),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Text(
                            '$_minutes',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 27,
                                fontWeight: FontWeight.w700
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 10,),
                      Text('분',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.w500
                        ),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width : maxWidth * 0.28,
                        height: maxHeight * 0.065,
                        decoration: BoxDecoration(
                          color: Color(0xff333333),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Text('$_seconds',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 27,
                                fontWeight: FontWeight.w700
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 10,),
                      Text('초',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.w500
                        ),
                      ),
                    ],
                  ),



                ],
              ),
            ),
          ),
          SizedBox(height: 15),
          Column(
            children: [
              Text(
                '대전 탄방동 스꺼러 경기장',
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600,color: Colors.white),
              ),
              Text(
                '25-01-01 14:30',
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500,color: Colors.white),
              ),
            ],
          ),

          Container(
            width: maxWidth,
            height: maxHeight * 0.39,
            padding: EdgeInsets.all(15),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  for (int i = 0; i < 5; i++)
                    Padding(
                      padding: EdgeInsets.only(top: 15),
                      child: Row(
                        children: [
                          Container(
                            width: 12.w,
                            height: 5.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Color(0xff333333)
                            ),
                              child: Center(
                                child: SvgPicture.asset(
                                  'assets/images/stop.svg',
                                  color: Colors.white70,
                                ),
                              ),
                          ),
                          SizedBox(width: 15,),

                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '01:14:00',
                                style: TextStyle(
                                    fontWeight: FontWeight.w600, fontSize: 16,color: Colors.white),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                '경기가 중지되었습니다',
                                style: TextStyle(
                                    fontWeight: FontWeight.w600, fontSize: 14,color: Colors.grey),
                              ),

                            ],
                          ),
                        ],
                      ),
                    ),
                ],
              ),
            ),
          ),

          SizedBox(height: 30),





          // 버튼들
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              // 경기 중단 / 재시작 버튼
              GestureDetector(
                onTap: () {
                  if (_isRunning) {
                    _stopTimer(); // 타이머 멈추기
                  } else {
                    _startTimer(); // 타이머 재시작
                  }
                },
                child: Container(
                  width: maxWidth * 0.55,
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      border: Border.all(width: 1, color: Colors.white),
                      color: Colors.white),
                  child: Center(
                    child: Text(
                      _isRunning ? "경기 중단" : "경기 재시작",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w900,
                          fontSize: 16,
                          letterSpacing: -0.3),
                    ),
                  ),
                ),
              ),

              // 경기 종료 버튼
              GestureDetector(
                onTap: () async {
                  ///경기 결과 팝업 생성
                  dynamic result = await showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        contentPadding: EdgeInsets.zero,
                        content: PlayingResultModal(),
                      );
                    },
                  );


                },
                child: Container(
                  width: maxWidth * 0.35,
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      border: Border.all(width: 1, color: Colors.white),
                      color: Colors.white),
                  child: Center(
                    child: Text(
                      '종료',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w900,
                          fontSize: 16,
                          letterSpacing: -0.3),
                    ),
                  ),
                ),
              ),


            ],
          ),
        ],
      ),
    );
  }
}
