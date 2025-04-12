
import 'package:badboys/model/match/match_history_info_model.dart';
import 'package:badboys/screen/subScreen/comn/appbar/custom_appbar.dart';
import 'package:badboys/screen/subScreen/comn/custom_cached_network_image.dart';
import 'package:badboys/screen/subScreen/playHistory/play_history_comment_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class PlayInfoScreen extends StatefulWidget {
  const PlayInfoScreen({super.key});

  @override
  State<PlayInfoScreen> createState() => _PlayInfoScreenState();
}

class _PlayInfoScreenState extends State<PlayInfoScreen> {

  final MatchHistoryInfoModel matchHistoryInfoModel = Get.arguments;

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
            CustomAppbar(isNotification: true, ),

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
                            child: Text('2 / 3',style: TextStyle(fontFamily: 'EHSMB'),),
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
                            child: Text('1 / 3',style: TextStyle(fontFamily: 'EHSMB'),),
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
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('대전 서구 아크 실내 농구장',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600,letterSpacing: -0.3,color: Colors.white,fontFamily: 'EHSMB'),),

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

                  SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text("경기 시작 : ",
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 13,
                            fontWeight: FontWeight.w700,
                            fontFamily: 'EHSMB'
                        ),
                      ),
                      Text(DateFormat('yy-MM-dd HH:mm').format(DateTime.parse(matchHistoryInfoModel.startAt.toString())),
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 13,
                            fontWeight: FontWeight.w700,
                            fontFamily: 'EHSMB'
                        ),
                      ),

                    ],
                  ),


                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text("경기 종료 : ",
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 13,
                            fontWeight: FontWeight.w700,
                            fontFamily: 'EHSMB'
                        ),
                      ),
                      Text(DateFormat('yy-MM-dd HH:mm').format(DateTime.parse(matchHistoryInfoModel.endAt.toString())),
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 13,
                            fontWeight: FontWeight.w700,
                            fontFamily: 'EHSMB'
                        ),
                      ),
                    ],
                  ),


                ],
              ),
            ),

            /// 경기 정보
            Container(
              width: 100.w,
              height: 32.h,
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.black,
              ),
              child: Container(
                width: 100.w,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [


                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [

                        for(int i = 0; i < matchHistoryInfoModel.teamList.length; i++)...[
                          Column(
                            children: [
                              Text('${matchHistoryInfoModel.teamList[i].result}',
                                style: TextStyle(
                                    color: matchHistoryInfoModel.teamList[i].result == 'WIN' ? Colors.red : Colors.blue,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 15,
                                    fontFamily: 'EHSMB'
                                ),
                              ),
                              SizedBox(height: 10,),
                              Container(
                                width: 40.w,
                                child: Wrap(
                                  alignment: WrapAlignment.center,
                                  spacing: 15,       // 아이콘 사이 간격
                                  runSpacing: 4,    // 줄바꿈 시 줄 간격
                                  children: List.generate(matchHistoryInfoModel.teamList[i].userList.length, (j) {
                                    return Column(
                                      children: [
                                        GestureDetector(
                                          onTap: (){
                                            Get.toNamed(
                                                '/memberPageScreen',
                                                arguments: {'tab' : 0, 'memberId' : matchHistoryInfoModel.teamList[i].userList[j].userId }
                                            );
                                          },
                                          child: ClipOval(
                                            child: CustomCachedNetworkImage(
                                                imagePath: matchHistoryInfoModel.teamList[i].userList[j].profileImage,
                                                imageWidth: 15.w,
                                                imageHeight: null
                                            ),
                                          ),
                                        ),

                                        Container(
                                          width: 18.w,
                                          child: Text("${matchHistoryInfoModel.teamList[i].userList[j].username}",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w700,
                                                fontSize: 12,
                                                fontFamily: 'EHSMB'
                                            ),
                                            textAlign: TextAlign.center,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                        Container(
                                          width: 18.w,
                                          child: Text("${matchHistoryInfoModel.teamList[i].userList[j].mmr} Pts",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w700,
                                                fontSize: 12,
                                                fontFamily: 'EHSMB'
                                            ),
                                            textAlign: TextAlign.center,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),



                                      ],
                                    );
                                  }),
                                ),
                              )
                            ],
                          ),

                          if(i == 0)
                            Center(
                              child: Text("vs",
                                style: TextStyle(
                                    color: Colors.orange,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 15,
                                    fontFamily: 'EHSMB'
                                ),
                              ),
                            ),
                        ],

                      ],
                    ),




                  ],
                ),
              ),
            ),

            SizedBox(height: 15,),


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
                    PlayHistoryCommentItem(),
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
