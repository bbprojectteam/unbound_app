import 'package:badboys/screen/comn/custom_appbar_screen.dart';
import 'package:badboys/screen/court/court_screen.dart';
import 'package:badboys/screen/home/match_list_item.dart';
import 'package:badboys/screen/info/mercenary_info_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>  with TickerProviderStateMixin{
  int matchIndex = 0;

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

    return Scaffold(
      body: Container(
        width: maxWidth,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CustomAppbarScreen(
                isNotification: true,
                isListMenu: false,
              ),

              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    for (int i = 0; i < 10; i++)...[
                      Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          color: i == 2 ? Colors.deepPurple : null,
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '3',
                              style: TextStyle(
                                color: i == 2 ? Colors.white : i==3 ?  Colors.blue : i == 4 ? Colors.red : null,
                                fontWeight: FontWeight.w800,

                              ),
                            ),
                            Text(
                              '금',
                              style: TextStyle(
                                color: i == 2 ? Colors.white : i==3 ?  Colors.blue : i == 4 ? Colors.red : null,
                                fontWeight: FontWeight.w800,

                              ),
                            ),
                          ],
                        ),
                      ),

                      SizedBox(
                        width: 10,
                      ),
                    ],

                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 5,bottom: 3),
                width: maxWidth,
                height: 0.8,
                color: Colors.black.withOpacity(0.3),
              ),

              Container(
                width: maxWidth,
                padding: EdgeInsets.all(10),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [

                      Container(
                          padding: EdgeInsets.only(left: 10,right: 10,top: 5,bottom: 5),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            border: Border.all(color: Colors.deepPurple, width: 1),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                '지역',
                                style: TextStyle(
                                  color: Colors.deepPurple,
                                  fontSize: 13,
                                ),
                              ),
                                Icon(
                                  Icons.arrow_drop_down_sharp,
                                  color: Colors.deepPurple,
                                  size: 15,
                                ),
                            ],
                          ),
                        ),

                      SizedBox(width: 5,),
                      Container(
                        padding: EdgeInsets.only(left: 10,right: 10,top: 5,bottom: 5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          border: Border.all(color: Colors.deepPurple, width: 1),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              '동네',
                              style: TextStyle(
                                color: Colors.deepPurple,
                                fontSize: 13,
                              ),
                            ),
                            Icon(
                              Icons.arrow_drop_down_sharp,
                              color: Colors.deepPurple,
                              size: 15,
                            ),
                          ],
                        ),
                      ),

                      SizedBox(width: 5,),
                      Container(
                        padding: EdgeInsets.only(left: 10,right: 10,top: 5,bottom: 5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          border: Border.all(color: Colors.deepPurple, width: 1),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              '마감 가리기',
                              style: TextStyle(
                                color: Colors.deepPurple,
                                fontSize: 13,
                              ),
                            ),

                          ],
                        ),
                      ),

                      SizedBox(width: 5,),
                      Container(
                        padding: EdgeInsets.only(left: 10,right: 10,top: 5,bottom: 5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          border: Border.all(color: Colors.deepPurple, width: 1),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              '성별',
                              style: TextStyle(
                                color: Colors.deepPurple,
                                fontSize: 13,
                              ),
                            ),
                            Icon(
                              Icons.arrow_drop_down_sharp,
                              color: Colors.deepPurple,
                              size: 15,
                            ),
                          ],
                        ),
                      ),

                      SizedBox(width: 5,),
                      Container(
                        padding: EdgeInsets.only(left: 10,right: 10,top: 5,bottom: 5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          border: Border.all(color: Colors.deepPurple, width: 1),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              '레벨',
                              style: TextStyle(
                                color: Colors.deepPurple,
                                fontSize: 13,
                              ),
                            ),
                            Icon(
                              Icons.arrow_drop_down_sharp,
                              color: Colors.deepPurple,
                              size: 15,
                            ),
                          ],
                        ),
                      ),

                      SizedBox(width: 5,),
                      Container(
                        padding: EdgeInsets.only(left: 10,right: 10,top: 5,bottom: 5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          border: Border.all(color: Colors.deepPurple, width: 1),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              '스꺼러스꺼러',
                              style: TextStyle(
                                color: Colors.deepPurple,
                                fontSize: 13,
                              ),
                            ),
                            Icon(
                              Icons.arrow_drop_down_sharp,
                              color: Colors.deepPurple,
                              size: 15,
                            ),
                          ],
                        ),
                      ),

                      ],


                  ),
                ),
              ),



              Container(
                height: maxHeight,
                child: Stack(
                  children: [
                    ///매칭 버튼
                    Container(
                      width: maxWidth, // 화면 너비에 맞게
                      height: 330,
                      decoration: BoxDecoration(
                        color: Colors.white,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            width: 210,
                            height: 210,
                            // padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.deepPurple, width: 5),
                              // 테두리 색상과 두께 설정
                              borderRadius:
                                  BorderRadius.circular(300), // 동그란 모서리 설정
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "25-01-23",
                                      style: TextStyle(
                                        color: Colors.deepPurple,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w800
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'MMR',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w800,
                                        fontSize: 20,
                                        color: Colors.deepPurple,
                                      ),
                                    ),
                                    SizedBox(width: 5,),
                                    Text(
                                      '2142',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w800,
                                        fontSize: 18,
                                        color: Colors.deepPurple,
                                      ),
                                    ),
                                  ],
                                ),

                                SizedBox(
                                  height: 10,
                                ),
                                ElevatedButton(
                                  style: ButtonStyle(
                                    backgroundColor:
                                        WidgetStateProperty.all(Colors.deepPurple),
                                    shadowColor: WidgetStateProperty.all(
                                        Colors.transparent),
                                    shape: WidgetStateProperty.all(
                                      RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(50),
                                      ),
                                    ),
                                  ),
                                  onPressed: () => {
                                    if (matchIndex == 0)
                                      {
                                        setState(() {
                                          matchIndex = 1;
                                        })
                                      }
                                    else if (matchIndex == 1)
                                      {
                                        /*4*/
                                      }
                                  },
                                  child: Container(
                                    padding: EdgeInsets.all(10),
                                    child: Text(
                                      matchIndex == 0 ? '매칭하기' : '라커룸 이동',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),



                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              GestureDetector(
                                onTap:(){
                                  /*3*/
                                },
                                child: Container(
                                  padding: EdgeInsets.only(top: 10,bottom: 10,left: 25,right: 25),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(width: 1,color: Colors.deepPurple),
                                      color: Colors.deepPurple
                                  ),
                                  child: Text('내 정보',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w900,fontSize: 13,letterSpacing: -0.3),),
                                ),
                              ),

                              Column(
                                children: [
                                  Container(
                                    padding: EdgeInsets.only(top: 10,bottom: 10,left: 25,right: 25),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(width: 1,color: Colors.deepPurple),
                                        color: Colors.deepPurple
                                    ),
                                    child: Text('랭킹',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w900,fontSize: 13,letterSpacing: -0.3),),
                                  ),
                                ],
                              ),

                              Column(
                                children: [
                                  Container(
                                    padding: EdgeInsets.only(top: 10,bottom: 10,left: 25,right: 25),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(width: 1,color: Colors.deepPurple),
                                        color: Colors.deepPurple
                                    ),
                                    child: Text('경기기록',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w900,fontSize: 13,letterSpacing: -0.3),),
                                  ),
                                ],
                              ),

                              Column(
                                children: [
                                  Container(
                                    padding: EdgeInsets.only(top: 10,bottom: 10,left: 25,right: 25),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(width: 1,color: Colors.deepPurple),
                                        color: Colors.deepPurple
                                    ),
                                    child: Text('친구목록',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w900,fontSize: 13,letterSpacing: -0.3),),
                                  ),
                                ],
                              ),

                            ],
                          ),
                        ],
                      ),
                    ),




                    Positioned(
                      top: 330, // 이 값을 조정하여 Stack 영역 밖으로 배치
                      left: 10,
                      right: 10,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(15),
                            topRight: Radius.circular(15),
                          ),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.3),
                              spreadRadius: 5,
                              blurRadius: 9,
                              offset: Offset(0, -4),
                            ),
                          ],
                        ),

                        width: maxWidth, // 화면 크기에 맞는 너비 설정
                        height: maxHeight,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // TabBar 생성
                            TabBar(
                              tabAlignment : TabAlignment.start,
                              isScrollable : true,
                              controller: _tabController,
                              indicatorSize: TabBarIndicatorSize.label, // 탭에 맞는 indicator 크기
                              tabs: [
                                Tab(child: Text('내 동네',style: TextStyle(color: Colors.deepPurple,fontSize: 15,fontWeight: FontWeight.w800),),),
                                Tab(child: Text('매치 찾기',style: TextStyle(color: Colors.deepPurple,fontSize: 15,fontWeight: FontWeight.w800),),),
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

                                        Text('최근 매치',
                                          style: TextStyle(fontWeight: FontWeight.w700,fontSize: 17),
                                        ),

                                        Container(
                                          width: maxWidth,
                                          height : maxHeight * 0.15,
                                          child: PageView(
                                            controller: _pageController,  // Use the PageController
                                            scrollDirection: Axis.horizontal,
                                            children: [
                                              for(int i = 0; i<3; i++)...[
                                                Container(
                                                decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(10),
                                                  border: Border.all(width: 4, color: Colors.orange.withOpacity(0.5)),
                                                ),
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                  children: [
                                                    // First Team Column
                                                    Column(
                                                      children: [
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
                                                              Column(
                                                                children: [
                                                                  Text(
                                                                    '오민규',
                                                                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 14),
                                                                  ),
                                                                  Text(
                                                                    '2121점',
                                                                    style: TextStyle(color : Colors.grey, fontWeight: FontWeight.w600, fontSize: 13),
                                                                  ),
                                                                ],
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      ],
                                                    ),
                                                    // 'vs' Text
                                                    Text(
                                                      'vs',
                                                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                                                    ),
                                                    // Second Team Column
                                                    Column(
                                                      children: [
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
                                                              Column(
                                                                children: [
                                                                  Text(
                                                                    '오민규',
                                                                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 14),
                                                                  ),
                                                                  Text(
                                                                    '2121점',
                                                                    style: TextStyle(color : Colors.grey, fontWeight: FontWeight.w600, fontSize: 13),
                                                                  ),
                                                                ],
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              ]
                                              // Add more pages as needed
                                            ],
                                          ),
                                        ),


                                        SizedBox(height: 5,),
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



                                        SingleChildScrollView(
                                          scrollDirection: Axis.horizontal,
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              for(int i = 0; i <5; i++)
                                                Container(
                                                  padding: EdgeInsets.all(15),
                                                  child: Column(
                                                    crossAxisAlignment: CrossAxisAlignment.center,
                                                    children: [
                                                      Stack(
                                                        children: [
                                                          ClipRRect(
                                                            borderRadius: BorderRadius.circular(5),
                                                            child: Image.asset(
                                                              'assets/images/intro.png',
                                                              width: maxWidth * 0.3,
                                                              height: maxHeight * 0.1,
                                                              fit: BoxFit.cover,
                                                            ),
                                                          ),
                                                          Positioned(
                                                            left: 0,
                                                            bottom: 0,
                                                            child:  Column(
                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                              children: [
                                                              ],
                                                            ),
                                                          )
                                                        ],
                                                      ),



                                                    ],
                                                  ),
                                                ),



                                            ],
                                          ),
                                        ),
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


                                        SingleChildScrollView(
                                          scrollDirection: Axis.horizontal,
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Container(
                                                padding: EdgeInsets.all(15),
                                                child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    ClipRRect(
                                                      borderRadius: BorderRadius.circular(10),
                                                      child: Image.asset(
                                                        'assets/images/testCourt.png',
                                                        width: maxWidth * 0.95,
                                                        height: maxHeight * 0.15,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                    SizedBox(height: 3,),
                                                    Text('대전 서구 계룡로 실외 농구장',style: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.w800),),
                                                  ],
                                                ),
                                              ),



                                            ],
                                          ),
                                        ),





                                      ],
                                    ),
                                  ),
                              
                                  // 두 번째 탭 (주변의 코트)
                                  SingleChildScrollView(

                                    child: Column(
                                      children: [
                                        for (int i = 0; i < 5; i++)
                                          MatchListItem()
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

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
