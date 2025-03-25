import 'package:badboys/model/chat/chat_model.dart';
import 'package:badboys/screen/subScreen/comn/custom_cached_network_image.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ChatItem extends StatefulWidget {
  const ChatItem({
    super.key,
    required this.chatModel,
  });

  final ChatModel chatModel;

  @override
  State<ChatItem> createState() => _ChatItemState();
}

class _ChatItemState extends State<ChatItem> {


  @override
  Widget build(BuildContext context) {

    return SizedBox(
      height: 8.h,
      child: Align(
        alignment: !widget.chatModel.isMyChat! ? Alignment.centerLeft : Alignment.centerRight , // 왼쪽에 붙도록 설정
        child: Container(
          padding: EdgeInsets.only(left: 10,right: 10,bottom: 3),
          child: Row(
            mainAxisAlignment: !widget.chatModel.isMyChat! ? MainAxisAlignment.start : MainAxisAlignment.end,
            children: [
              if(!widget.chatModel.isMyChat!)...[
                ClipOval(
                  child: CustomCachedNetworkImage(
                        imagePath: widget.chatModel.profileImage.toString(),
                        imageWidth: 9.w,
                        imageHeight: null
                    ),

                ),
                SizedBox(width: 5,),
              ],

              Container(

                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: !widget.chatModel.isMyChat! ? CrossAxisAlignment.start : CrossAxisAlignment.end,
                  children: [

                    if(!widget.chatModel.isMyChat!)...[
                      Text(
                        widget.chatModel.username.toString(),
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w600
                        ),
                      ),
                      SizedBox(height: 5,),
                    ],

                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [

                        if(widget.chatModel.isMyChat!)...[
                          Text(widget.chatModel.unreadMemberCnt.toString(),
                            style: TextStyle(
                                color: Colors.orange,
                                fontWeight: FontWeight.w700
                            ),
                          ),
                          SizedBox(width: 5,),
                          Text(widget.chatModel.createdAt.toString(),
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                              color: Colors.grey,
                            ),
                          ),
                          SizedBox(width: 5,),
                        ],

                        Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.orange
                          ),
                          child: Text(
                            widget.chatModel.message.toString(),
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 15,
                            ),
                          ),
                        ),
                        SizedBox(width: 5,),
                        if(!widget.chatModel.isMyChat!)...[
                          Text(widget.chatModel.createdAt.toString(),
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                              color: Colors.grey
                            ),
                          ),
                          SizedBox(width: 5,),
                          Text(widget.chatModel.unreadMemberCnt.toString(),
                            style: TextStyle(
                                color: Colors.orange,
                                fontWeight: FontWeight.w700
                            ),
                          ),
                        ]

                      ],
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
