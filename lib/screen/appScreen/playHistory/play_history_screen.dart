
import 'package:badboys/controller/comment_controller.dart';
import 'package:badboys/controller/match_controller.dart';
import 'package:badboys/model/match/match_history_comment_model.dart';
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
  late MatchController matchController;
  late CommentController commentController;
  late TextEditingController textEditingController;
  late int memberNickNmLength;
  int depth = 0;
  int? parentId = null;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    matchController = Get.find<MatchController>();
    commentController = Get.put(CommentController());
    textEditingController = TextEditingController();

    commentController.fnSelectComment(matchHistoryInfoModel.matchInfoId!);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    textEditingController.dispose();
    Get.delete<CommentController>();
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {

    return Container(
      height: 100.h,
      color: Colors.black,
      child: Stack(
        children: [
          SingleChildScrollView(
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
                                        color: matchController.selectMatchResultColor(matchHistoryInfoModel.teamList[i].result!),
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


              GetBuilder<CommentController>(
                init: commentController,
                builder: (commentControllerContext) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children:[
                        for(int i = 0 ; i < commentController.matchHistoryCommentModel.length; i++)...[
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              PlayHistoryCommentItem(
                                  matchHistoryCommentModel: commentController.matchHistoryCommentModel[i],
                                  choiceCommentCallBack: (String selectUserName, int selectParentId, int selectDepth) {
                                    textEditingController.text = "@$selectUserName ";
                                    parentId = selectParentId;
                                    depth = selectDepth;
                                    memberNickNmLength = textEditingController.text.length;
                                  },
                                  deleteCommentCallBack:(MatchHistoryCommentModel matchHistoryCommentModel){

                                    Map<String, dynamic> commentData = {
                                      'commentId': matchHistoryCommentModel.commentId,
                                      'matchInfoId': matchHistoryInfoModel.matchInfoId,
                                      'depth': matchHistoryCommentModel.depth,
                                      'content': '삭제된 댓글입니다',
                                    };
                                    commentController.fnInsertComment(matchHistoryInfoModel.matchInfoId!,commentData);
                                  }
                              ),

                              for(int j = 0; j < commentController.matchHistoryCommentModel[i].childList.length; j++)
                                Padding(
                                  padding: const EdgeInsets.only(left : 30.0),
                                  child: PlayHistoryCommentItem(
                                      matchHistoryCommentModel: commentController.matchHistoryCommentModel[i].childList[j],
                                      choiceCommentCallBack: (String selectUserName, int selectParentId, int selectDepth) {
                                        textEditingController.text = "@$selectUserName ";
                                        parentId = selectParentId;
                                        depth = selectDepth;
                                        memberNickNmLength = textEditingController.text.length;
                                      },
                                      deleteCommentCallBack:(MatchHistoryCommentModel matchHistoryCommentModel){

                                        Map<String, dynamic> commentData = {
                                          'commentId': matchHistoryCommentModel.commentId,
                                          'matchInfoId': matchHistoryInfoModel.matchInfoId,
                                          'depth': matchHistoryCommentModel.depth,
                                          'content': '삭제된 댓글입니다',
                                        };

                                        commentController.fnInsertComment(matchHistoryInfoModel.matchInfoId!,commentData);

                                      }

                                  ),
                                ),
                            ],
                          ),
                        ]

                      ],
                    ),
                  );
                },
              ),


                SizedBox(height: 60),
                  
                  
                  
              ],
            ),
          ),
      
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              color: Colors.black,
              padding: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 95.w,
                    height: 5.h,
                    child: TextField(
                      controller: textEditingController,
                      onChanged: (value) {
                        print('입력된 값: $value');

                        if (memberNickNmLength != 0 && value.length < memberNickNmLength) {
                          textEditingController.text = '';
                          parentId = null;
                          memberNickNmLength = 0;
                          depth = 0;
                        }

                      },
                      decoration: InputDecoration(
                        hintText: '댓글을 남겨보세요',
                        hintStyle: TextStyle(color: Colors.grey),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                        filled: true,
                        fillColor: Colors.grey[200],
                        suffixIcon: IconButton(
                          icon: Icon(Icons.send, color: Colors.grey),
                          onPressed: () {
                            if (textEditingController.text == '') {
                              return;
                            }

                            Map<String, dynamic> commentData = {
                              'commentId': null,
                              'matchInfoId': matchHistoryInfoModel.matchInfoId,
                              'parentId': parentId,
                              'depth': depth,
                              'content': textEditingController.text,
                            };

                            commentController.fnInsertComment(matchHistoryInfoModel.matchInfoId!,commentData);

                            textEditingController.text = '';
                            depth = 0;
                            parentId = null;

                          },
                        ),
                      ),
                    ),





                  ),


                ],
              ),
            ),
          ),
      
      
        ],
      ),
    );
  }
}
