import 'package:badboys/model/match/match_history_comment_model.dart';
import 'package:badboys/screen/subScreen/comn/custom_cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class PlayHistoryCommentItem extends StatefulWidget {
  const PlayHistoryCommentItem({
    super.key,
    required this.loginMemberId,
    required this.choiceCommentCallBack,
    required this.matchHistoryCommentModel,
    required this.deleteCommentCallBack,
  });

  final int? loginMemberId;
  final Function choiceCommentCallBack;
  final MatchHistoryCommentModel matchHistoryCommentModel;
  final Function deleteCommentCallBack;
  @override
  State<PlayHistoryCommentItem> createState() => _PlayHistoryCommentItemState();
}

class _PlayHistoryCommentItemState extends State<PlayHistoryCommentItem> {


  String? formatToDateOnly(String? dateTimeString) {
    if (dateTimeString == null) return null;

    DateTime dateTime = DateTime.parse(dateTimeString);

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
                child: CustomCachedNetworkImage(
                    imagePath: widget.matchHistoryCommentModel.profileImage,
                    imageWidth: 10.w,
                    imageHeight: 5.h
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

                      if (widget.matchHistoryCommentModel.userId == widget.loginMemberId && widget.matchHistoryCommentModel.useYn == "Y")
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
                          widget.matchHistoryCommentModel.useYn == "N" ? "삭제된 댓글입니다" : widget.matchHistoryCommentModel.content.toString().split(' ')[1] ?? '',
                          style: TextStyle(
                            color: widget.matchHistoryCommentModel.useYn == "N" ? Colors.grey : Colors.white,
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
                          widget.matchHistoryCommentModel.useYn == "N" ? "삭제된 댓글입니다" : widget.matchHistoryCommentModel.content ?? '',
                          style: TextStyle(
                              color: widget.matchHistoryCommentModel.useYn == "N" ? Colors.grey : Colors.white,
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
