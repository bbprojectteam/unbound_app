import 'package:badboys/screen/chat/chat_item.dart';
import 'package:badboys/screen/comn/custom_appbar_screen.dart';
import 'package:badboys/subScreen/home/match_list_item.dart';
import 'package:flutter/material.dart';

class LockerRoomScreen extends StatefulWidget {
  const LockerRoomScreen({
    super.key,
  });


  @override
  State<LockerRoomScreen> createState() => _LockerRoomScreenState();
}

class _LockerRoomScreenState extends State<LockerRoomScreen> with TickerProviderStateMixin {

  late TabController _tabController;
  late PageController _pageController;


  @override
  void initState() {
    super.initState();
    // TabController 초기화 (탭의 개수는 2로 설정)
    _tabController = TabController(length: 2, vsync: this);
    _pageController = PageController();
  }

  @override
  void dispose() {
    _tabController.dispose();
    _pageController.dispose();
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    double maxWidth = MediaQuery.of(context).size.width;
    double maxHeight = MediaQuery.of(context).size.height;


    return Container(
      width: maxWidth,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CustomAppbarScreen(
            isNotification : false,
            isListMenu : true,
          ),

          TabBar(
            tabAlignment : TabAlignment.start,
            isScrollable : true,
            controller: _tabController,
            indicatorSize: TabBarIndicatorSize.label, // 탭에 맞는 indicator 크기
            tabs: [
              Tab(child: Text('정보',style: TextStyle(color: Colors.deepPurple,fontSize: 15,fontWeight: FontWeight.w800),),),
              Tab(child: Text('대기실',style: TextStyle(color: Colors.deepPurple,fontSize: 15,fontWeight: FontWeight.w800),),),
            ],
          ),

          // TabBarView를 사용하여 탭에 따라 다른 내용을 표시
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [

                // 첫 번째 탭 (새로운 사람들)
                SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [


                      Container(
                        width: maxWidth * 0.9,
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
                              width: maxWidth,
                              height: maxHeight * 0.23,
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
                                          width: maxWidth,
                                          height: maxHeight * 0.23, // 명시적으로 크기 설정
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
                                          width: maxWidth,
                                          height: maxHeight * 0.23, // 명시적으로 크기 설정
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
                              padding: EdgeInsets.all(15),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('1월 9일 목요일 12:00',style: TextStyle(fontWeight: FontWeight.w800,letterSpacing: -0.3),),
                                  Text('대전 서구 아크 실내 농구장',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600,letterSpacing: -0.3),),

                                  Row(
                                    children: [
                                      Text('서울 특별시 도봉구 도봉로 100라길 69-6 4층',style: TextStyle(fontWeight: FontWeight.w600,letterSpacing: -0.3),),
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
                                  Row(
                                    children: [
                                      Icon(Icons.heart_broken,color: Colors.red,),
                                      SizedBox(width: 5,),
                                      Text('5',style: TextStyle(fontWeight: FontWeight.w500),)
                                    ],
                                  ),


                                ],
                              ),
                            ),

                            Container(
                              padding: EdgeInsets.all(15),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('현재 참여자',style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600),),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Icon(Icons.account_circle_sharp,color: Colors.black,size: 40,),
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
                                              border: Border.all(width: 1,color: Colors.deepPurple),
                                              color: Colors.deepPurple
                                          ),
                                          child: Text('참여하기',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w900,fontSize: 15,letterSpacing: -0.3),),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              width: maxWidth * 0.9,
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
                                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                                    ),
                                  ),
                               

                                  Wrap(
                                    spacing: 10.0, // 아이템 간의 가로 간격
                                    runSpacing: 10.0, // 줄 간격
                                    alignment: WrapAlignment.start, // Wrap의 정렬 설정
                                    children: [
                                      Container(
                                        width: maxWidth * 0.47,
                                        padding: EdgeInsets.only(left: 10),
                                        child: Row(
                                          children: [
                                            Icon(Icons.copyright_outlined, size: 40, color: Colors.grey),
                                            SizedBox(width: 10),
                                            Text('남녀 모두', style: TextStyle(color: Colors.grey)),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        width: maxWidth * 0.47,
                                        padding: EdgeInsets.only(left: 10),
                                        child: Row(
                                          children: [
                                            Icon(Icons.copyright_outlined, size: 40, color: Colors.grey),
                                            SizedBox(width: 10),
                                            Text('3 vs 3', style: TextStyle(color: Colors.grey)),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        width: maxWidth * 0.47,
                                        padding: EdgeInsets.only(left: 10),
                                        child: Row(
                                          children: [
                                            Icon(Icons.copyright_outlined, size: 40, color: Colors.grey),
                                            SizedBox(width: 10),
                                            Text('6명', style: TextStyle(color: Colors.grey)),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        width: maxWidth * 0.47,
                                        padding: EdgeInsets.only(left: 10),
                                        child: Row(
                                          children: [
                                            Icon(Icons.copyright_outlined, size: 40, color: Colors.grey),
                                            SizedBox(width: 10),
                                            Text('자유복장', style: TextStyle(color: Colors.grey)),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        width: maxWidth * 0.47,
                                        padding: EdgeInsets.only(left: 10),
                                        child: Row(
                                          children: [
                                            Icon(Icons.copyright_outlined, size: 40, color: Colors.grey),
                                            SizedBox(width: 10),
                                            Text('초보 환영', style: TextStyle(color: Colors.grey)),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),

                            SizedBox(height: 10,),
                            Container(
                              width: maxWidth * 0.9,
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
                                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                                    ),
                                  ),


                                  Wrap(
                                    spacing: 10.0, // 아이템 간의 가로 간격
                                    runSpacing: 10.0, // 줄 간격
                                    alignment: WrapAlignment.start, // Wrap의 정렬 설정
                                    children: [
                                      Container(
                                        width: maxWidth * 0.47,
                                        padding: EdgeInsets.only(left: 10),
                                        child: Row(
                                          children: [
                                            Icon(Icons.copyright_outlined, size: 40, color: Colors.grey),
                                            SizedBox(width: 10),
                                            Text('30x12m', style: TextStyle(color: Colors.grey)),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        width: maxWidth * 0.47,
                                        padding: EdgeInsets.only(left: 10),
                                        child: Row(
                                          children: [
                                            Icon(Icons.copyright_outlined, size: 40, color: Colors.grey),
                                            SizedBox(width: 10),
                                            Text('주차장', style: TextStyle(color: Colors.grey)),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        width: maxWidth * 0.47,
                                        padding: EdgeInsets.only(left: 10),
                                        child: Row(
                                          children: [
                                            Icon(Icons.copyright_outlined, size: 40, color: Colors.grey),
                                            SizedBox(width: 10),
                                            Text('편의점', style: TextStyle(color: Colors.grey)),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        width: maxWidth * 0.47,
                                        padding: EdgeInsets.only(left: 10),
                                        child: Row(
                                          children: [
                                            Icon(Icons.copyright_outlined, size: 40, color: Colors.grey),
                                            SizedBox(width: 10),
                                            Text('농구공', style: TextStyle(color: Colors.grey)),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        width: maxWidth * 0.47,
                                        padding: EdgeInsets.only(left: 10),
                                        child: Row(
                                          children: [
                                            Icon(Icons.copyright_outlined, size: 40, color: Colors.grey),
                                            SizedBox(width: 10),
                                            Text('화장실', style: TextStyle(color: Colors.grey)),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        width: maxWidth * 0.47,
                                        padding: EdgeInsets.only(left: 10),
                                        child: Row(
                                          children: [
                                            Icon(Icons.copyright_outlined, size: 40, color: Colors.grey),
                                            SizedBox(width: 10),
                                            Text('하이요', style: TextStyle(color: Colors.grey)),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),


                                ],
                              ),
                            ),



                            SizedBox(height: 10,),
                            Container(
                              width: maxWidth * 0.9,
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
                                  Text('■ 냉방시설 구비'),
                                  SizedBox(height: 8,),
                                  Text("■ 흡연: 건물 전체 금연 구역\n*건물 밖으로 나가셔서 오른쪽으로 조금 걸어가시면 흡연 구역 위치\n *1층 출입구 앞 흡연 불가\n*건물 내 흡연 적발 시 과태료 10만원 부과 및 강제 퇴실 조치"),
                                  SizedBox(height: 8,),
                                  Text('■ 찾아가는 길: 테니스 장 건물 4층(다이소 창동3호점 뒷 건물)'),
                                  SizedBox(height: 8,),
                                  Text('■ 주차: 다이소 창동 3점 주차장 이용, 지하 주차장 이용 불가\n- 구장에 비치된 태블릿으로 차량번호 등록 (2시간 500원 / 3시간 1,000원)'),
                                  SizedBox(height: 8,),
                                  Text('■ 대여/판매\n- 풋살화 대여: 3,000원 / 230~285 사이즈 보유\n- 물: 500원 / 음료 1,500원'),

                                ],
                              ),
                            ),
                            
                            
                            
                            
                            
                          ],
                        ),
                      ),



                    ],
                  ),
                ),



                // 두 번째 탭
                SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Container(
                            width: maxWidth,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [

                                Row(
                                  children: [
                                    for(int i = 0; i <3; i++)...[
                                      GestureDetector(
                                        onTap: ()=>{
                                          /// 해당 사용자 정보창으로 이동
                                        },
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: [
                                            Text('',
                                              style: TextStyle(
                                                  fontSize: 13,
                                                  fontWeight: FontWeight.w700
                                              ),
                                            ),
                                            Icon(Icons.account_circle_sharp,
                                              size: 50,
                                            ),
                                            Text('오민규',
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w700
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ]

                                  ],
                                ),


                                Row(
                                  children: [
                                    for(int i = 0; i <3; i++)...[
                                      GestureDetector(
                                        onTap: ()=>{

                                        },
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: [
                                            if(i == 1)
                                              Image.asset(
                                                'assets/images/crown.png',
                                                width: 25,
                                                height: 25,
                                              ),

                                            if(i != 1)
                                              SizedBox(height: 25,),


                                            Icon(Icons.account_circle_sharp,
                                              size: 50,
                                            ),
                                            Text('오민규',
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w700
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ]
                                  ],
                                ),

                              ],
                            ),
                          ),
                        ),
                      ),

                      Container(
                        width: maxWidth,
                        height: maxHeight * 0.60,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey, // 그림자의 색상 (투명도 조절 가능)
                              offset: Offset(0, 4), // 상단에 그림자가 나타나도록 (X, Y 좌표)
                              blurRadius: 10, // 흐림 정도 (큰 값일수록 흐려짐)
                              spreadRadius: 5, // 그림자가 퍼지는 정도 (0이면 그림자가 퍼지지 않음)
                            ),
                          ],
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30), // 왼쪽 상단 모서리 둥글게
                            topRight: Radius.circular(30), // 오른쪽 상단 모서리 둥글게
                          ),
                          color: Colors.white,
                        ),
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              for(int i = 0 ; i< 20; i++)...[
                                if(i == 3)...[
                                  Container(
                                    padding: EdgeInsets.all(15),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Expanded(
                                          child: Container(
                                            height: 1,  // 선의 두께
                                            color: Colors.black.withOpacity(0.5),  // 선의 색
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.symmetric(horizontal: 10),  // 텍스트 양 옆의 여백
                                          child: Text('6월 12일'),
                                        ),
                                        Expanded(
                                          child: Container(
                                            height: 1,  // 선의 두께
                                            color: Colors.black.withOpacity(0.5),  // 선의 색
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),


                                ],


                                if(i != 3)
                                  ChatItem(isMyChat: i % 2 == 0 ? true : false )
                              ]
                            ],
                          ),
                        ),
                      ),

                      Container(
                        width: maxWidth,  // maxWidth는 부모 위젯에서 제공된 최대 너비
                        height: maxHeight * 0.1,  // maxHeight * 0.1은 컨테이너의 높이 비율
                        color: Colors.white,  // 배경색
                        padding: EdgeInsets.symmetric(horizontal: 10),  // 좌우 여백
                        child: Row(
                          children: [
                            // 텍스트 입력 필드
                            Expanded(
                              child: TextField(
                                decoration: InputDecoration(
                                  hintText: '메시지를 입력하세요',  // 기본 텍스트
                                  hintStyle: TextStyle(color: Colors.grey),
                                  prefixIcon: Icon(Icons.add, color: Colors.grey),  // 왼쪽에 플러스 아이콘 추가
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),  // 둥근 모서리
                                    borderSide: BorderSide(color: Colors.grey),
                                  ),
                                  filled: true,
                                  fillColor: Colors.grey[200],  // 입력 필드 배경 색
                                ),
                              ),
                            ),
                            SizedBox(width: 10),  // 입력 필드와 전송 버튼 사이 간격
                            // 전송 버튼
                            IconButton(
                              icon: Icon(Icons.send),
                              onPressed: () {
                                // 전송 버튼 클릭 시 동작 (예: 메시지 전송 처리)
                                print('메시지 전송');
                              },
                            ),
                          ],
                        ),
                      ),
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
