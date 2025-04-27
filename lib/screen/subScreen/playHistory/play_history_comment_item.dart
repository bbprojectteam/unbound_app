import 'package:badboys/model/match/match_history_comment_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class PlayHistoryCommentItem extends StatefulWidget {
  const PlayHistoryCommentItem({
    super.key,
    required this.choiceCommentCallBack,
    required this.matchHistoryCommentModel,
    required this.deleteCommentCallBack,
  });

  final Function choiceCommentCallBack;
  final MatchHistoryCommentModel matchHistoryCommentModel;
  final Function deleteCommentCallBack;
  @override
  State<PlayHistoryCommentItem> createState() => _PlayHistoryCommentItemState();
}

class _PlayHistoryCommentItemState extends State<PlayHistoryCommentItem> {


  String? formatToDateOnly(String? dateTimeString) {
    if (dateTimeString == null) return null;

    // 문자열을 DateTime 객체로 변환
    DateTime dateTime = DateTime.parse(dateTimeString);

    // 원하는 형식으로 포맷 (yyyy-MM-dd)
    return DateFormat('yyyy-MM-dd').format(dateTime);
  }


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.choiceCommentCallBack(widget.matchHistoryCommentModel.username,widget.matchHistoryCommentModel.commentId,1);
      },
      child: Container(
        color: Colors.black,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(
              onTap : () {
                Get.toNamed(
                    '/memberPageScreen',
                    arguments: {'tab' : 0, 'memberId' : widget.matchHistoryCommentModel.userId}
                );
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

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap:(){
                          Get.toNamed(
                              '/memberPageScreen',
                              arguments: {'tab' : 0, 'memberId' : widget.matchHistoryCommentModel.userId}
                          );
                        },
                        child: Text(
                          widget.matchHistoryCommentModel.username ?? '',
                          style: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.w700,
                              fontFamily: 'EHSMB'
                          ),
                        ),
                      ),

                      GestureDetector(
                        onTap: (){
                          widget.deleteCommentCallBack(widget.matchHistoryCommentModel);
                        },
                        child: Text(
                          '삭제',
                          style: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.w700,
                              fontSize: 12,
                              fontFamily: 'EHSMB'
                          ),
                        ),
                      ),


                    ],
                  ),


                  SizedBox(height: 3),

                  if (widget.matchHistoryCommentModel.depth! > 0)...[
                    Wrap(
                      spacing: 6,
                      children: [
                        Text(
                          widget.matchHistoryCommentModel.content.toString().split(' ')[0] ?? '',
                          style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.w700,
                            fontFamily: 'EHSMB',
                          ),
                        ),
                        Text(
                          widget.matchHistoryCommentModel.content.toString().split(' ')[1] ?? '',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontFamily: 'EHSMB',
                          ),
                        ),
                      ],
                    ),
                  ],

                  if (widget.matchHistoryCommentModel.depth == 0)...[
                    Wrap(
                      spacing: 6,
                      children: [
                        Text(
                          widget.matchHistoryCommentModel.content ?? '',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                              fontFamily: 'EHSMB'

                          ),
                        ),
                      ],
                    ),
                  ],

                  SizedBox(height: 3),
                  Row(
                    children: [
                      Text(
                        formatToDateOnly(widget.matchHistoryCommentModel.updatedAt) ?? '',
                        style: TextStyle(
                            fontSize: 13,
                            color: Colors.grey),
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
