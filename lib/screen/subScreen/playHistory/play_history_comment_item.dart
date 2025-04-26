import 'package:badboys/model/match/match_history_comment_model.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class PlayHistoryCommentItem extends StatefulWidget {
  const PlayHistoryCommentItem({
    super.key,
    required this.choiceCommentCallBack,
    required this.matchHistoryCommentModel,
  });

  final Function choiceCommentCallBack;
  final MatchHistoryCommentModel matchHistoryCommentModel;

  @override
  State<PlayHistoryCommentItem> createState() => _PlayHistoryCommentItemState();
}

class _PlayHistoryCommentItemState extends State<PlayHistoryCommentItem> {
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
                    children: [
                      GestureDetector(
                        onTap:(){

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
                    ],
                  ),


                  SizedBox(height: 3),

                  if (widget.matchHistoryCommentModel.depth! > 0)...[
                    Row(
                      children: [
                        Text(
                          widget.matchHistoryCommentModel.content.toString().split(' ')[0] ?? '',
                          style: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.w700,
                              fontFamily: 'EHSMB'

                          ),
                        ),
                        SizedBox(width: 6,),
                        Text(
                          widget.matchHistoryCommentModel.content.toString().split(' ')[1] ?? '',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                              fontFamily: 'EHSMB'

                          ),
                        ),
                      ],
                    ),
                  ],

                  if (widget.matchHistoryCommentModel.depth == 0)...[
                    Text(
                      widget.matchHistoryCommentModel.content ?? '',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontFamily: 'EHSMB'

                      ),
                    ),
                  ],

                  SizedBox(height: 3),
                  Row(
                    children: [
                      Text(
                        widget.matchHistoryCommentModel.updatedAt ?? '',
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
