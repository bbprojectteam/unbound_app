import 'package:badboys/screen/info/mercenary_record_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MercenaryInfoScreen extends StatefulWidget {
  const MercenaryInfoScreen({super.key});

  @override
  State<MercenaryInfoScreen> createState() => _MercenaryInfoScreenState();
}

class _MercenaryInfoScreenState extends State<MercenaryInfoScreen>  with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);  // 3 tabs in this case
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
      body: Container(
        color: Colors.black,
        width: maxWidth,
        height: maxHeight,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(left: 10, right: 10),
                color: Color(0xff000000),
                height: 80,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap : () {
                        print('123123');
                      },
                      child: Icon(
                        Icons.account_circle_sharp,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                    Container(
                      width: 200,
                      height: 30,
                      decoration: BoxDecoration(
                        color: Color(0xffffffff),
                        borderRadius: BorderRadius.circular(40),
                        border: Border.all(
                          color: Color(0xffffffff),
                          width: 2,
                        ),
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                          icon: Icon(Icons.search,color: Colors.black,),
                          border: InputBorder.none,
                          hintText: 'search',
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.all(3),
                          decoration: BoxDecoration(
                            color: Color(0xffffffff),
                            borderRadius: BorderRadius.circular(100),
                          ),
                          child: SvgPicture.asset(
                            'assets/images/chart.svg',
                            width: 27,
                            height: 27,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(width: 9),
                        Container(
                          padding: EdgeInsets.all(3),
                          decoration: BoxDecoration(
                            color: Color(0xffffffff),
                            borderRadius: BorderRadius.circular(100),
                          ),
                          child: Icon(
                            Icons.notifications,
                            color: Colors.black,
                            size: 25,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ClipOval(
                    child: Image.asset(
                      'assets/images/intro.png',
                      // width: 100, // 원래 크기 유지
                      height: 100, // 원래 크기 유지
                      fit: BoxFit.cover, // 이미지가 잘리거나 확대되면서 원형을 유지
                    ),
                  ),
                  SizedBox(height: 6,),
                  Text('스꺼러',style: TextStyle(fontSize: 19, color: Colors.white,fontWeight: FontWeight.w600),),
                  SizedBox(height: 6,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('20대',style: TextStyle(fontSize: 13, color: Colors.grey,fontWeight: FontWeight.w600),),
                      SizedBox(width: 5,),
                      Text('여자',style: TextStyle(fontSize: 13,color: Colors.grey,fontWeight: FontWeight.w600),),
                      SizedBox(width: 5,),
                      Text('서울 강서구',style: TextStyle(fontSize: 13,color: Colors.grey,fontWeight: FontWeight.w600),),
                    ],
                  ),
                ],
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Text('24회',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w700,fontSize: 17),),
                      SizedBox(width: 2,),
                      Text('참여',style: TextStyle(color: Colors.grey,fontWeight: FontWeight.w700,fontSize: 13),)
                    ],
                  ),
                  SizedBox(width: 15,),
                  Row(
                    children: [
                      Text('4.4점',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w700,fontSize: 17),),
                      SizedBox(width: 3,),
                      Text('매너점수',style: TextStyle(color: Colors.grey,fontWeight: FontWeight.w700,fontSize: 13),)
                    ],
                  ),
                ],
              ),
              SizedBox(height: 8,),
              Container(
                width: maxWidth * 0.8,
                height: 50,
                color: Color(0xffffffff),
                child: Center(
                  child: Text('용병 신청',
                    style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.w700),
                  ),
                ),
              ),


              SizedBox(height: 20),
              TabBar(
                controller: _tabController,
                labelColor: Colors.white,
                unselectedLabelColor: Colors.white,
                tabs: [
                  Tab(text: '소개'),
                  Tab(text: '참여기록'),
                ],
              ),

              // Tab view content
              Container(
                height: maxHeight * 0.5,
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    Container(
                      width : maxWidth,
                      height: 100,
                      padding: EdgeInsets.all(15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '안녕하세요.',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            '저는 길거리 농구 시작한지 10년차 입니다..',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            '같이 하실 분은 용병신청 해주세요.',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),

                          SizedBox(height: 5,),

                          Container(
                            width: maxWidth * 0.9,
                            height: 1,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ),

                    ///두번째 탭
                    Container(
                      child: SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              MercenaryRecordItem(),
                              SizedBox(height: 10,),
                              MercenaryRecordItem(),
                              SizedBox(height: 10,),
                              MercenaryRecordItem(),
                              SizedBox(height: 10,),
                              MercenaryRecordItem(),
                              SizedBox(height: 10,),
                              MercenaryRecordItem(),
                              SizedBox(height: 10,),
                            ],
                          ),
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

