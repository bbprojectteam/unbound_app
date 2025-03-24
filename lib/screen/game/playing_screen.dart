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
      color: Colors.black87,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 40,
          ),

          Container(
            child: Center(
              child: Text(
                '00 : 00',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 80,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Digital7',
                ),
              ),
            ),
          ),


          Container(
            padding: EdgeInsets.only(left: 25, right: 25),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Stack(
                      children: [
                        // 테두리 텍스트
                        Text(
                          'HOME',
                          style: TextStyle(
                            color: Colors.white,
                            // 테두리 색상
                            fontSize: 65,
                            // fontWeight: FontWeight.w600,
                            fontFamily: 'backToSchool',
                            shadows: [
                              Shadow(
                                blurRadius: 3.0,
                                color: Colors.white, // 테두리 색상
                                offset: Offset(1.0, 1.0), // 테두리의 위치
                              ),
                            ],
                          ),
                        ),
                        // 실제 텍스트
                        Text(
                          'HOME',
                          style: TextStyle(
                            color: Colors.orange,
                            fontSize: 65,
                            // fontWeight: FontWeight.w600,
                            fontFamily: 'backToSchool',
                          ),
                        ),
                      ],
                    ),

                    Stack(
                      children: [
                        // 테두리 텍스트
                        Text(
                          'AWAY',
                          style: TextStyle(
                            color: Colors.white,
                            // 테두리 색상
                            fontSize: 60,
                            // fontWeight: FontWeight.w600,
                            fontFamily: 'backToSchool',

                          ),
                        ),
                        // 실제 텍스트
                        Text(
                          'AWAY',
                          style: TextStyle(
                            color: Colors.orange,
                            fontSize: 60,
                            // fontWeight: FontWeight.w600,
                            fontFamily: 'backToSchool',
                          ),
                        ),
                      ],
                    ),


                  ],
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    Stack(
                      children: [
                        Container(
                          width: 35.w,
                          height: 13.5.h,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Align(
                            alignment: Alignment.topCenter,  // Centers text both vertically and horizontally
                            child: Text(
                              '00',
                              style: TextStyle(
                                color: Colors.white10,
                                fontSize: 98, // Increased font size
                                fontFamily: 'EHSMB',
                                letterSpacing: 0,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),



                    Stack(
                      children: [
                        Container(
                          width: 35.w,
                          height: 13.5.h,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Align(
                            alignment: Alignment.topCenter,  // Centers text both vertically and horizontally
                            child: Text(
                              '00',
                              style: TextStyle(
                                color: Colors.white10,
                                fontSize: 98, // Increased font size
                                fontFamily: 'EHSMB',
                                letterSpacing: 0,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),


                  ],
                ),
              ],
            ),
          ),

          SizedBox(height: 30,),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 40.w,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      width: 10.w,
                        height: 5.h,
                        color: Colors.red,
                        child: Center(
                            child: Text("+ 1",
                              style: TextStyle(
                                color: Colors.black54,
                                fontSize: 25,
                                fontWeight: FontWeight.w700,
                                fontFamily: 'roboto',

                              ),
                            ),
                        ),
                    ),
                    Container(
                      width: 10.w,
                      height: 5.h,
                      color: Colors.red,
                      child: Center(
                        child: Text("+ 2",
                          style: TextStyle(
                            color: Colors.black54,
                            fontSize: 25,
                            fontWeight: FontWeight.w700,
                            fontFamily: 'roboto',

                          ),
                        ),
                      ),
                    ),

                    Container(
                      width: 10.w,
                      height: 5.h,
                      color: Colors.red,
                      child: Center(
                        child: Text("+ 3",
                          style: TextStyle(
                            color: Colors.black54,
                            fontSize: 25,
                            fontWeight: FontWeight.w700,
                            fontFamily: 'roboto',

                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              Container(
                width: 40.w,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      width: 10.w,
                      height: 5.h,
                      color: Colors.red,
                      child: Center(
                        child: Text("+ 1",
                          style: TextStyle(
                            color: Colors.black54,
                            fontSize: 25,
                            fontWeight: FontWeight.w700,
                            fontFamily: 'roboto',

                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: 10.w,
                      height: 5.h,
                      color: Colors.red,
                      child: Center(
                        child: Text("+ 2",
                          style: TextStyle(
                            color: Colors.black54,
                            fontSize: 25,
                            fontWeight: FontWeight.w700,
                            fontFamily: 'roboto',

                          ),
                        ),
                      ),
                    ),

                    Container(
                      width: 10.w,
                      height: 5.h,
                      color: Colors.red,
                      child: Center(
                        child: Text("+ 3",
                          style: TextStyle(
                            color: Colors.black54,
                            fontSize: 25,
                            fontWeight: FontWeight.w700,
                            fontFamily: 'roboto',

                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

            ],
          ),
          Image.asset(
            'assets/images/court2.jpg',
            width: 100.w,
            height: 40.h,
            fit: BoxFit.cover,
          ),


          SizedBox(height: 20,),
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
                      border: Border.all(width: 1, color: Colors.orange),
                      color: Colors.orange),
                  child: Center(
                    child: Text(
                      _isRunning ? "경기 중단" : "경기 재시작",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w900,
                          fontSize: 16,
                          letterSpacing: -0.3,
                          fontFamily: 'EHSMB'
                      ),

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
                      border: Border.all(width: 1, color: Colors.orange),
                      color: Colors.orange),
                  child: Center(
                    child: Text(
                      '종료',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w900,
                          fontSize: 16,
                          letterSpacing: -0.3,
                          fontFamily: 'EHSMB'
                      ),
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
