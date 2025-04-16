import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class PlayHistoryCommentItem extends StatefulWidget {
  const PlayHistoryCommentItem({
    super.key,
    required this.choiceCommentCallBack,
  });

  final Function choiceCommentCallBack;


  @override
  State<PlayHistoryCommentItem> createState() => _PlayHistoryCommentItemState();
}

class _PlayHistoryCommentItemState extends State<PlayHistoryCommentItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print("답글 쓰기");
        widget.choiceCommentCallBack();
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

                  GestureDetector(
                    onTap:(){

                    },
                    child: Text(
                      "오민규",
                      style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.w700,
                          fontFamily: 'EHSMB'
                      ),
                    ),
                  ),


                  SizedBox(height: 3),
                  Text(
                    "재미있었어요",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'EHSMB'

                    ),
                  ),
                  SizedBox(height: 3),
                  Row(
                    children: [
                      Text(
                        "2024-12-03",
                        style: TextStyle(
                            fontSize: 13,
                            color: Colors.grey),
                      ),

                    ],
                  ),
                ],
              ),
            ),
            // Column(
            //   crossAxisAlignment:
            //   CrossAxisAlignment.center,
            //   children: [
            //     GestureDetector(
            //       onTap: () {
            //         print("댓글 좋아요");
            //
            //       },
            //       child: Icon(Icons.heart_broken,color: Colors.red,),
            //     ),
            //     Text(
            //       "23",
            //       style: TextStyle(
            //           color: Colors.white),
            //     ),
            //   ],
            // ),
          ],
        ),
      ),
    );
  }
}
