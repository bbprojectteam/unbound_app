import 'package:badboys/screen/comn/custom_appbar_screen.dart';
import 'package:badboys/subScreen/rank/rank_item.dart';
import 'package:flutter/material.dart';

class RankScreen extends StatefulWidget {
  const RankScreen({
    super.key,
  });

  @override
  State<RankScreen> createState() => _RankScreenState();
}

class _RankScreenState extends State<RankScreen> with TickerProviderStateMixin {

  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double maxWidth = MediaQuery.of(context).size.width;
    double maxHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Scaffold(
        body: Container(
          color: Colors.black,
          child: Column(
            children: [
              CustomAppbarScreen(
                isNotification: true,
                isListMenu: false,
              ),



              // 나머지 콘텐츠는 Expanded로 감싸서 스크롤 가능하게 설정
              Expanded(
                child: SingleChildScrollView(
                  // 아래 부분만 스크롤이 가능하도록
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [

                      Stack(
                        children: [
                          Container(
                            // color: Colors.black,
                            width: maxWidth,
                            height: maxHeight * 0.2,
                          ),

                          Positioned(
                            top: 0,
                            left: 0,
                            right: 0,
                            bottom: 0,
                            child: Container(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text('대전 탄방동',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w800,
                                      fontSize: 23,
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      ClipOval(
                                        child: Image.asset(
                                          'assets/images/intro.png',
                                          width: 50,
                                          height: 50,
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                      SizedBox(width: 5,),
                                      Row(
                                        children: [
                                          Text('개인전',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w900,
                                              fontSize: 18,
                                            ),
                                          ),
                                          SizedBox(width: 5,),
                                          Text('5',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w900,
                                              fontSize: 25,
                                            ),
                                          ),
                                          Text('위',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w900,
                                              fontSize: 16,
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                  SizedBox(height: 5,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [

                                      Container(
                                        padding: EdgeInsets.only(
                                            left: 10, right: 10, top: 5, bottom: 5),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(50),
                                          border: Border.all(color: Colors.white, width: 2),
                                        ),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Text(
                                              '지역',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 13,
                                              ),
                                            ),
                                            Icon(
                                              Icons.arrow_drop_down_sharp,
                                              color: Colors.white,
                                              size: 15,
                                            ),
                                          ],
                                        ),

                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Container(
                                        padding: EdgeInsets.only(
                                            left: 10, right: 10, top: 5, bottom: 5),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(50),
                                          border: Border.all(color: Colors.white, width: 2),
                                        ),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Text(
                                              '동네',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 13,
                                              ),
                                            ),
                                            Icon(
                                              Icons.arrow_drop_down_sharp,
                                              color: Colors.white,
                                              size: 15,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),

                                ],
                              ),
                            ),
                          ),


                          Positioned.fill(
                            child: Opacity(
                              opacity: 0.3, // 이미지의 투명도를 30%로 설정
                              child: Image.asset(
                                'assets/images/rank_bg.jpg',
                                fit: BoxFit.fill,
                                // color와 colorBlendMode를 사용하지 않아도 되며, opacity로 투명도를 제어합니다.
                              ),
                            ),
                          ),



                        ],
                      ),






                      Container(
                        padding: EdgeInsets.only(left: 8,right: 8),
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: Colors.grey,
                              width: 1,
                            ),
                          ),
                        ),
                        width: maxWidth,
                        height: maxHeight * 0.05,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,

                          children: [
                            Flexible(
                              flex: 5,
                              fit: FlexFit.tight,
                              child: Container(
                                child: TabBar(
                                  tabAlignment: TabAlignment.start,
                                  isScrollable: true,
                                  controller: _tabController,
                                  indicator: BoxDecoration(),  // 밑줄 제거
                                  labelStyle: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w900,
                                  ),
                                  unselectedLabelStyle: TextStyle(
                                    fontSize: 15,
                                    color: Colors.grey.withOpacity(0.7),  // 선택되지 않은 탭의 텍스트 색
                                  ),
                                  indicatorColor: Colors.white,  // 선택된 탭 밑줄 색
                                  tabs: [
                                    Center(child: Text('2025', style: TextStyle(color: Colors.white),)),
                                    Center(child: Text('2024', style: TextStyle(color: Colors.white),)),
                                  ],
                                )
                              ),
                            ),




                            Flexible(
                                flex: 1,
                                child: Container(
                                  color: Colors.black,
                                  child: Center(
                                    child: Text( '경기 수',
                                      style: TextStyle(color: Colors.grey.withOpacity(0.7),fontWeight: FontWeight.w900),
                                    ),
                                  ),
                                ),
                            ),
                            Flexible(
                              flex: 1,
                              child: Container(
                                color: Colors.black,
                                child: Center(
                                  child: Text( '승률',
                                    style: TextStyle(color: Colors.grey.withOpacity(0.7),fontWeight: FontWeight.w900),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      Container(
                        height: maxHeight * 2,
                        child: TabBarView(
                          controller: _tabController,
                          children: [
                            Column(
                              children: [
                                for (int i = 0; i < 30; i++) ...[
                                  RankItem(testRankIdx: i),
                                ],
                              ],
                            ),

                            Column(
                              children: [
                                for (int i = 0; i < 30; i++) ...[
                                  RankItem(testRankIdx: i),
                                ],
                              ],
                            ),


                        ],
                        ),
                      ),
                      // 여러개의 RankItem을 보여주는 부분

                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
