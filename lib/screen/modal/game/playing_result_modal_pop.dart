import 'package:badboys/screen/subScreen/comn/appbar/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:flutter/cupertino.dart'; // CupertinoPicker 사용을 위한 임포트

class PlayingResultModalPop extends StatefulWidget {
  const PlayingResultModalPop({super.key});

  @override
  State<PlayingResultModalPop> createState() => _PlayingResultModalPopState();
}

class _PlayingResultModalPopState extends State<PlayingResultModalPop> {
  int _aTeamScore = 0; // A팀 점수
  int _bTeamScore = 0; // B팀 점수

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.w,
      height: 90.h,
      color: Colors.black,
      padding: EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CustomAppbar(isNotification: false, ),
          SizedBox(height: 40,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [


                  Row(
                    children: [
                      ClipOval(
                        child: Image.asset(
                          'assets/images/intro.png',
                          width: 40,
                          height: 40,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '오민규',
                            style: TextStyle(
                              color: Colors.white,
                                fontFamily: 'EHSMB'

                            ),
                          ),
                          Row(
                            children: [
                              Text(
                                '2104',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                    fontFamily: 'EHSMB'
                                ),
                              ),
                              SizedBox(width: 3,),
                              Text(
                                '+25',
                                style: TextStyle(
                                  fontSize: 13.5,
                                  color: Colors.red,
                                    fontFamily: 'EHSMB'
                                ),
                              ),
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                  Row(
                    children: [
                      ClipOval(
                        child: Image.asset(
                          'assets/images/intro.png',
                          width: 40,
                          height: 40,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '오민규',
                            style: TextStyle(
                              color: Colors.white,
                                fontFamily: 'EHSMB'

                            ),
                          ),
                          Row(
                            children: [
                              Text(
                                '2104',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                    fontFamily: 'EHSMB'
                                ),
                              ),
                              SizedBox(width: 3,),
                              Text(
                                '+25',
                                style: TextStyle(
                                  fontSize: 13.5,
                                  color: Colors.red,
                                    fontFamily: 'EHSMB'
                                ),
                              ),
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                  Row(
                    children: [
                      ClipOval(
                        child: Image.asset(
                          'assets/images/intro.png',
                          width: 40,
                          height: 40,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '오민규',
                            style: TextStyle(
                              color: Colors.white,
                                fontFamily: 'EHSMB'

                            ),
                          ),
                          Row(
                            children: [
                              Text(
                                '2104',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                    fontFamily: 'EHSMB'
                                ),
                              ),
                              SizedBox(width: 3,),
                              Text(
                                '+25',
                                style: TextStyle(
                                  fontSize: 13.5,
                                  color: Colors.red,
                                    fontFamily: 'EHSMB'
                                ),
                              ),
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              ),
              Column(
                children: [
                  Row(
                    children: [
                      ClipOval(
                        child: Image.asset(
                          'assets/images/intro.png',
                          width: 40,
                          height: 40,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '오민규',
                            style: TextStyle(
                              color: Colors.white,
                                fontFamily: 'EHSMB'
                            ),
                          ),
                          Row(
                            children: [
                              Text(
                                '2104',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                    fontFamily: 'EHSMB'
                                ),
                              ),
                              SizedBox(width: 3,),
                              Text(
                                '-25',
                                style: TextStyle(
                                  fontSize: 13.5,
                                  color: Colors.blue,
                                    fontFamily: 'EHSMB'
                                ),
                              ),
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                  Row(
                    children: [
                      ClipOval(
                        child: Image.asset(
                          'assets/images/intro.png',
                          width: 40,
                          height: 40,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '오민규',
                            style: TextStyle(
                              color: Colors.white,
                                fontFamily: 'EHSMB'
                            ),
                          ),
                          Row(
                            children: [
                              Text(
                                '2104',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                    fontFamily: 'EHSMB'
                                ),
                              ),
                              SizedBox(width: 3,),
                              Text(
                                '-25',
                                style: TextStyle(
                                  fontSize: 13.5,
                                  color: Colors.blue,
                                    fontFamily: 'EHSMB'
                                ),
                              ),
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                  Row(
                    children: [
                      ClipOval(
                        child: Image.asset(
                          'assets/images/intro.png',
                          width: 40,
                          height: 40,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '오민규',
                            style: TextStyle(
                              color: Colors.white,
                                fontFamily: 'EHSMB'

                            ),
                          ),
                          Row(
                            children: [
                              Text(
                                '2104',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                    fontFamily: 'EHSMB'
                                ),
                              ),
                              SizedBox(width: 3,),
                              Text(
                                '-25',
                                style: TextStyle(
                                  fontSize: 13.5,
                                  color: Colors.blue,
                                    fontFamily: 'EHSMB'
                                ),
                              ),
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ],
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: CupertinoPicker(
                  itemExtent: 30.0,
                  onSelectedItemChanged: (index) {
                    setState(() {
                      _aTeamScore = index; // 위에서 아래로 스크롤하면 점수가 올라가도록 처리
                    });
                  },
                  children: List<Widget>.generate(
                    30,
                    (index) => Center(
                      child: Text(
                        '$index', // 위에서 아래로 스크롤하면 점수가 올라가도록 표시
                        style: TextStyle(fontSize: 18, color: Colors.white,fontFamily: 'EHSMB'),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 5.w),
              Expanded(
                child: CupertinoPicker(
                  itemExtent: 30.0,
                  onSelectedItemChanged: (index) {
                    setState(() {
                      _bTeamScore = index;
                    });
                  },
                  children: List<Widget>.generate(
                    30,
                    (index) => Center(
                      child: Text(
                        '$index',
                        style: TextStyle(fontSize: 18, color: Colors.white,fontFamily: 'EHSMB'),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),

          SizedBox(height: 30,),
          GestureDetector(
            onTap: () {
              Get.toNamed('/');
            },
            child: Container(
              width: 70.w,
              height: 5.h,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(50)
              ),
              child: Center(
                child: Text(
                  '입력',
                  style: TextStyle(
                      color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                      fontFamily: 'EHSMB'
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
