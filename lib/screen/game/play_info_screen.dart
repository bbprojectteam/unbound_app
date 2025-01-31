import 'package:badboys/screen/comn/custom_appbar_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class PlayInfoScreen extends StatefulWidget {
  const PlayInfoScreen({super.key});

  @override
  State<PlayInfoScreen> createState() => _PlayInfoScreenState();
}

class _PlayInfoScreenState extends State<PlayInfoScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150.h,
      color: Colors.black,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height : 40),
            CustomAppbarScreen(isNotification: true, isListMenu: false),

            Container(
              width: 90.w,
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Colors.grey,
                    width: 1,
                  ),
                ),
              ),
            ),

            ///지도
            Container(
              width: 100.w,
              height: 23.h,
              child: PageView(
                controller: PageController(),
                scrollDirection: Axis.horizontal,
                children: [
                  Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(5),
                        child: Image.asset(
                          'assets/images/123.PNG',
                          width: 100.w,
                          height: 23.h, // 명시적으로 크기 설정
                          fit: BoxFit.cover,
                        ),
                      ),

                      Positioned(
                        right: 10,
                        bottom: 10,
                        child: Container(
                          width: 50,
                          height: 30,
                          decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(0.4),
                            borderRadius: BorderRadius.circular(100),
                          ),
                          child: Center(
                            child: Text('2 / 3'),
                          ),
                        ),
                      ),
                    ],
                  ),


                  Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(5),
                        child: Image.asset(
                          'assets/images/123.PNG',
                          width: 100.w,
                          height: 23.h, // 명시적으로 크기 설정
                          fit: BoxFit.cover,
                        ),
                      ),

                      Positioned(
                        right: 10,
                        bottom: 10,
                        child: Container(
                          width: 50,
                          height: 30,
                          decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(0.4),
                            borderRadius: BorderRadius.circular(100),
                          ),
                          child: Center(
                            child: Text('1 / 3'),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),


            //정보
            Container(
              padding: EdgeInsets.all(7),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('1월 9일 목요일 12:00',style: TextStyle(fontWeight: FontWeight.w800,letterSpacing: -0.3,color: Colors.white),),
                  Text('대전 서구 아크 실내 농구장',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600,letterSpacing: -0.3,color: Colors.white),),

                  Row(
                    children: [
                      Text('서울 특별시 도봉구 도봉로 100라길 69-6 4층',style: TextStyle(fontWeight: FontWeight.w600,letterSpacing: -0.3,color: Colors.grey),),
                      SizedBox(width: 3,),
                      Row(
                        children: [
                          Icon(Icons.copyright_outlined,size: 18,),
                        ],
                      ),
                      SizedBox(width: 3,),
                      Icon(Icons.map_outlined,size: 18),
                    ],
                  ),


                ],
              ),
            ),

            SizedBox(height: 15,),

            /// 경기 정보
            Container(
              width: 100.w,
              height: 23.h,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 10,bottom: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            'WIN',
                            style: TextStyle(color: Colors.white,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                          for (int i = 0; i < 3; i++) ...[
                            Row(
                              children: [
                                ClipOval(
                                  child: Image.asset(
                                    'assets/images/intro.png',
                                    width: 35,
                                    height: 35,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                SizedBox(width: 10,),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '오민규',
                                      style: TextStyle(
                                          fontWeight: FontWeight
                                              .w700,
                                          fontSize:
                                          16,
                                          color: Colors.white
                                      ),
                                    ),
                                    Text(
                                      '2121점',
                                      style: TextStyle(
                                        color: Colors
                                            .grey,
                                        fontWeight: FontWeight
                                            .w700,
                                        fontSize:
                                        15,),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ],
                      ),
                    ),
                    // 'vs' Text
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [

                        Text('10 : 3',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w700
                          ),
                        ),

                        Text('00:46분',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w700
                          ),
                        ),
                      ],
                    ),
                    // Second Team Column
                    Padding(
                      padding: const EdgeInsets.only(top: 10,bottom: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            'LOSE',
                            style: TextStyle(color: Colors.white,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                          for (int i = 0; i < 3; i++) ...[
                            Row(
                              children: [
                                ClipOval(
                                  child: Image.asset(
                                    'assets/images/intro.png',
                                    width: 35,
                                    height: 35,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                SizedBox(width: 10,),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '오민규',
                                      style: TextStyle(
                                          fontWeight: FontWeight
                                              .w700,
                                          fontSize:
                                          16,
                                          color: Colors.white
                                      ),
                                    ),
                                    Text(
                                      '2321점',
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontWeight: FontWeight.w700,
                                        fontSize:
                                        15,),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 15,),
            Container(
              width: 100.w,
              padding: EdgeInsets.only(bottom: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('뭐넣지',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w700
                    ),
                  ),

                  Text('뭐넣지',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w700
                    ),
                  )

                ],
              ),
            ),




            Padding(
              padding: const EdgeInsets.only(left: 10,bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                      '댓글',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),


            Container(
              color: Colors.black,  // 배경색
              padding: EdgeInsets.symmetric(horizontal: 10),  // 좌우 여백
              child: Column(
                children: [
                  for(int i = 0; i <5; i++)...[
                    GestureDetector(
                      onTap: () {
                        print("답글 쓰기");
                      },
                      child: Container(
                        color: Colors.black,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                GestureDetector(
                                  onTap : () {

                                  },
                                  child: ClipOval(
                                    child:  Image.asset(
                                      'assets/images/intro.png',
                                      width: 10.w,
                                      height: 5.h,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),

                                SizedBox(width: 5),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [

                                      GestureDetector(
                                        onTap:(){

                                        },
                                        child: Text(
                                          "오민규",
                                          style: TextStyle(
                                              color: Colors.grey),
                                        ),
                                      ),


                                      SizedBox(height: 3),
                                      Text(
                                        "재미있었어요",
                                        style: TextStyle(
                                            color: Colors.white),
                                      ),
                                      SizedBox(height: 3),
                                      Row(
                                        children: [
                                          Text(
                                            "2024-12-03",
                                            style: TextStyle(
                                                fontSize: 13,
                                                color: Colors.grey),
                                          ),
                                          SizedBox(width: 5),
                                          if (true)
                                            GestureDetector(
                                              onTap: () {

                                              },
                                              child: Text(
                                                "답글 보기",
                                                style: TextStyle(
                                                  fontSize: 13,
                                                  color: Colors.grey,
                                                  decoration:
                                                  TextDecoration
                                                      .underline,
                                                  // 밑줄 추가
                                                  decorationColor:
                                                  Colors.grey,
                                                ),
                                              ),
                                            ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Column(
                                  crossAxisAlignment:
                                  CrossAxisAlignment.center,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        print("댓글 좋아요");

                                      },
                                      child: Icon(Icons.heart_broken,color: Colors.red,),
                                    ),
                                    Text(
                                      "23",
                                      style: TextStyle(
                                          color: Colors.white),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 15),
                  ],

                  // 텍스트 입력 필드
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 80.w,
                        height: 5.h,
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: '댓글을 남겨보세요',  // 기본 텍스트
                            hintStyle: TextStyle(color: Colors.grey),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),  // 둥근 모서리
                              borderSide: BorderSide(color: Colors.grey),
                            ),
                            filled: true,
                            fillColor: Colors.grey[200],  // 입력 필드 배경 색
                          ),
                        ),
                      ),

                      IconButton(
                        icon: Icon(Icons.send,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          // 전송 버튼 클릭 시 동작 (예: 메시지 전송 처리)
                          print('메시지 전송');
                        },
                      ),
                    ],
                  ),


                ],
              ),
            ),




          ],
        ),
      ),
    );
  }
}
