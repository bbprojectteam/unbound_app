import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class PlayHistoryResultItem extends StatefulWidget {
  const PlayHistoryResultItem({
    super.key,
    required this.pageCnt,
  });

  final int? pageCnt;

  @override
  State<PlayHistoryResultItem> createState() => _PlayHistoryResultItemState();
}

class _PlayHistoryResultItemState extends State<PlayHistoryResultItem> {
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.w,
      height: 23.h,
      child: PageView(
        controller: _pageController,
        scrollDirection: Axis.horizontal,
        children: [
          for (int i = 0; i < widget.pageCnt!; i++) ...[
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  // First Team Column
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
          ]
          // Add more pages as needed
        ],
      ),
    );
  }
}
