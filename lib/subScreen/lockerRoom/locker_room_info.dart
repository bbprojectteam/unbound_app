import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class LockerRoomInfo extends StatefulWidget {
  const LockerRoomInfo({super.key});

  @override
  State<LockerRoomInfo> createState() => _LockerRoomInfoState();
}

class _LockerRoomInfoState extends State<LockerRoomInfo> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [


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


          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

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
                      SizedBox(height: 5,),
                      Row(
                        children: [
                          Icon(Icons.heart_broken,color: Colors.red,),
                          SizedBox(width: 5,),
                          Text('5',style: TextStyle(fontWeight: FontWeight.w500,color: Colors.white),)
                        ],
                      ),


                    ],
                  ),
                ),

                Container(
                  padding: EdgeInsets.all(5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('현재 참여자',style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600,color: Colors.white),),
                      SizedBox(height: 5,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.account_circle_sharp,color: Colors.white,size: 40,),
                              Icon(Icons.account_circle_sharp,color: Colors.red,size: 40),
                              Icon(Icons.account_circle_sharp,color: Colors.blue,size: 40),
                              Icon(Icons.account_circle_sharp,color: Colors.purpleAccent,size: 40),
                              Icon(Icons.account_circle_sharp,color: Colors.green,size: 40),
                            ],
                          ),
                          GestureDetector(
                            onTap: ()=>{

                            },
                            child: Container(
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(width: 1,color: Colors.white),
                                  color: Colors.white
                              ),
                              child: Text('참여하기',style: TextStyle(color: Colors.black,fontWeight: FontWeight.w900,fontSize: 15,letterSpacing: -0.3),),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 15,),
                Container(
                  width: 100.w,
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: Colors.grey.withOpacity(0.8),
                        width: 1,
                      ),
                    ),
                  ),
                ),


                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.all(15),
                        child: Text(
                          '매치포인트',
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700,color: Colors.white),
                        ),
                      ),


                      Wrap(
                        spacing: 10.0, // 아이템 간의 가로 간격
                        runSpacing: 10.0, // 줄 간격
                        alignment: WrapAlignment.start, // Wrap의 정렬 설정
                        children: [
                          Container(
                            width: 47.w,
                            padding: EdgeInsets.only(left: 10),
                            child: Row(
                              children: [
                                Icon(Icons.copyright_outlined, size: 40, color: Colors.white),
                                SizedBox(width: 10),
                                Text('남녀 모두', style: TextStyle(color: Colors.white)),
                              ],
                            ),
                          ),
                          Container(
                            width: 47.w,
                            padding: EdgeInsets.only(left: 10),
                            child: Row(
                              children: [
                                Icon(Icons.copyright_outlined, size: 40, color: Colors.white),
                                SizedBox(width: 10),
                                Text('3 vs 3', style: TextStyle(color: Colors.white)),
                              ],
                            ),
                          ),
                          Container(
                            width: 47.w,
                            padding: EdgeInsets.only(left: 10),
                            child: Row(
                              children: [
                                Icon(Icons.copyright_outlined, size: 40, color: Colors.white),
                                SizedBox(width: 10),
                                Text('6명', style: TextStyle(color: Colors.white)),
                              ],
                            ),
                          ),
                          Container(
                            width: 47.w,
                            padding: EdgeInsets.only(left: 10),
                            child: Row(
                              children: [
                                Icon(Icons.copyright_outlined, size: 40, color: Colors.white),
                                SizedBox(width: 10),
                                Text('자유복장', style: TextStyle(color: Colors.white)),
                              ],
                            ),
                          ),
                          Container(
                            width: 47.w,
                            padding: EdgeInsets.only(left: 10),
                            child: Row(
                              children: [
                                Icon(Icons.copyright_outlined, size: 40, color: Colors.white),
                                SizedBox(width: 10),
                                Text('초보 환영', style: TextStyle(color: Colors.white)),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 15,),
                Container(
                  width: 100.w,
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: Colors.grey.withOpacity(0.8),
                        width: 1,
                      ),
                    ),
                  ),
                ),

                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.all(15),
                        child: Text(
                          '농구장 정보',
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700,color: Colors.white),
                        ),
                      ),


                      Wrap(
                        spacing: 10.0, // 아이템 간의 가로 간격
                        runSpacing: 10.0, // 줄 간격
                        alignment: WrapAlignment.start, // Wrap의 정렬 설정
                        children: [
                          Container(
                            width: 47.w,
                            padding: EdgeInsets.only(left: 10),
                            child: Row(
                              children: [
                                Icon(Icons.copyright_outlined, size: 40, color: Colors.white),
                                SizedBox(width: 10),
                                Text('30x12m', style: TextStyle(color: Colors.white)),
                              ],
                            ),
                          ),
                          Container(
                            width: 47.w,
                            padding: EdgeInsets.only(left: 10),
                            child: Row(
                              children: [
                                Icon(Icons.copyright_outlined, size: 40, color: Colors.white),
                                SizedBox(width: 10),
                                Text('주차장', style: TextStyle(color: Colors.white)),
                              ],
                            ),
                          ),
                          Container(
                            width: 47.w,
                            padding: EdgeInsets.only(left: 10),
                            child: Row(
                              children: [
                                Icon(Icons.copyright_outlined, size: 40, color: Colors.white),
                                SizedBox(width: 10),
                                Text('편의점', style: TextStyle(color: Colors.white)),
                              ],
                            ),
                          ),
                          Container(
                            width: 47.w,
                            padding: EdgeInsets.only(left: 10),
                            child: Row(
                              children: [
                                Icon(Icons.copyright_outlined, size: 40, color: Colors.white),
                                SizedBox(width: 10),
                                Text('농구공', style: TextStyle(color: Colors.white)),
                              ],
                            ),
                          ),
                          Container(
                            width: 47.w,
                            padding: EdgeInsets.only(left: 10),
                            child: Row(
                              children: [
                                Icon(Icons.copyright_outlined, size: 40, color: Colors.white),
                                SizedBox(width: 10),
                                Text('화장실', style: TextStyle(color: Colors.white)),
                              ],
                            ),
                          ),
                          Container(
                            width: 47.w,
                            padding: EdgeInsets.only(left: 10),
                            child: Row(
                              children: [
                                Icon(Icons.copyright_outlined, size: 40, color: Colors.white),
                                SizedBox(width: 10),
                                Text('하이요', style: TextStyle(color: Colors.white)),
                              ],
                            ),
                          ),
                        ],
                      ),


                    ],
                  ),
                ),



                SizedBox(height: 15,),
                Container(
                  width: 100.w,
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: Colors.grey.withOpacity(0.8),
                        width: 1,
                      ),
                    ),
                  ),
                ),

                Container(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('■ 냉방시설 구비', style: TextStyle(color: Colors.white),),
                      SizedBox(height: 8,),
                      Text("■ 흡연: 건물 전체 금연 구역\n*건물 밖으로 나가셔서 오른쪽으로 조금 걸어가시면 흡연 구역 위치\n *1층 출입구 앞 흡연 불가\n*건물 내 흡연 적발 시 과태료 10만원 부과 및 강제 퇴실 조치",style: TextStyle(color: Colors.white),),
                      SizedBox(height: 8,),
                      Text('■ 찾아가는 길: 테니스 장 건물 4층(다이소 창동3호점 뒷 건물)',style: TextStyle(color: Colors.white),),
                      SizedBox(height: 8,),
                      Text('■ 주차: 다이소 창동 3점 주차장 이용, 지하 주차장 이용 불가\n- 구장에 비치된 태블릿으로 차량번호 등록 (2시간 500원 / 3시간 1,000원)',style: TextStyle(color: Colors.white),),
                      SizedBox(height: 8,),
                      Text('■ 대여/판매\n- 풋살화 대여: 3,000원 / 230~285 사이즈 보유\n- 물: 500원 / 음료 1,500원',style: TextStyle(color: Colors.white),),

                    ],
                  ),
                ),





              ],
            ),
          ),



        ],
      ),
    );
  }
}
