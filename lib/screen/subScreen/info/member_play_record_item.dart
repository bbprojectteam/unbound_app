import 'package:badboys/controller/match_controller.dart';
import 'package:badboys/model/match/match_history_info_model.dart';
import 'package:badboys/model/match/member_match_history_model.dart';
import 'package:badboys/screen/subScreen/comn/custom_cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class MemberPlayRecordItem extends StatefulWidget {
  const MemberPlayRecordItem({
    super.key,
    required this.isWin,
    required this.matchHistoryInfoModel,
  });

  final bool isWin;
  final MatchHistoryInfoModel matchHistoryInfoModel;

  @override
  State<MemberPlayRecordItem> createState() => _MemberPlayRecordItemState();
}

class _MemberPlayRecordItemState extends State<MemberPlayRecordItem> {
  late MatchController matchController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    matchController = Get.find<MatchController>();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {


    return Column(
      children: [
        Container(
          width: 95.w,
          height: 23.h,
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Colors.black,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    widget.isWin ? "+26" : "-13",
                    style: TextStyle(
                      color: widget.isWin ? Colors.red : Colors.blueAccent,
                      fontSize: 25,
                      fontFamily: 'EHSMB',
                    ),
                  ),
                  SizedBox(width: 10,),

                  Container(
                    width: 55.w,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [

                        Text( widget.matchHistoryInfoModel.matchName ?? "NULL",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                            fontFamily: 'EHSMB',
                          ),
                        ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [

                        for(int i = 0; i < widget.matchHistoryInfoModel.teamList.length; i++)...[
                          Column(
                            children: [
                              Text('${widget.matchHistoryInfoModel.teamList[i].result}',
                                style: TextStyle(
                                    color: matchController.selectMatchResultColor(widget.matchHistoryInfoModel.teamList[i].result!),
                                    fontWeight: FontWeight.w700,
                                    fontSize: 15,
                                    fontFamily: 'EHSMB'
                                ),
                              ),
                              SizedBox(height: 10,),
                              Container(
                                width: 20.w,
                                child: Wrap(
                                  alignment: WrapAlignment.center,
                                  spacing: 4,       // 아이콘 사이 간격
                                  runSpacing: 4,    // 줄바꿈 시 줄 간격
                                  children: List.generate(widget.matchHistoryInfoModel.teamList[i].userList.length, (j) {
                                    return  ClipOval(
                                      child: CustomCachedNetworkImage(
                                          imagePath: widget.matchHistoryInfoModel.teamList[i].userList[j].profileImage,
                                          imageWidth: 8.w,
                                          imageHeight: null
                                      ),
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
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 13,
                                    fontFamily: 'EHSMB'
                                ),
                              ),
                            ),
                          ],

                          ],
                        ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("경기 시작 : ",
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w700,
                                  fontFamily: 'EHSMB'
                              ),
                            ),
                            Text(DateFormat('yy-MM-dd HH:mm').format(DateTime.parse(widget.matchHistoryInfoModel.startAt.toString())),
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
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("경기 종료 : ",
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w700,
                                  fontFamily: 'EHSMB'
                              ),
                            ),
                            Text(DateFormat('yy-MM-dd HH:mm').format(DateTime.parse(widget.matchHistoryInfoModel.endAt.toString())),
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
                ],
              ),


              GestureDetector(
                onTap: () {
                Get.toNamed('/playInfo', arguments: widget.matchHistoryInfoModel);

                },
                child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(width: 1,color: Colors.orange),
                      color: Colors.orange
                  ),
                  child: Text('상세보기',
                    style: TextStyle(color: Colors.white,
                        fontWeight: FontWeight.w800,
                        fontSize: 15,

                      fontFamily: 'EHSMB',
                    ),),
                ),
              ),

            ],
          ),
        ),
        Container(
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                width: 1.5, // 선의 두께
                color: Colors.orange, // 선의 색상
              ),
            ),
          ),
        ),
        SizedBox(height: 10,),
      ],
    );
  }
}
