import 'package:badboys/model/chat/chat_model.dart';
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


    // print(widget.chatModel.toJson());

    return  Align(
      alignment: !widget.chatModel.isMyChat! ? Alignment.centerLeft : Alignment.centerRight , // 왼쪽에 붙도록 설정
      child: Container(
        padding: EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: !widget.chatModel.isMyChat! ? MainAxisAlignment.start : MainAxisAlignment.end,
          children: [
            if(!widget.chatModel.isMyChat!)...[
              ClipOval(
                child: CachedNetworkImage(
                  imageUrl: widget.chatModel.profileImage.toString(),
                  // 이미지 URL
                  placeholder: (context, url) {
                    return CircularProgressIndicator(); // 로딩 중에 표시할 위젯
                  },
                  errorWidget: (context, url, error) {
                    // print('이미지 로딩 실패: ');
                    return Icon(Icons.account_circle_sharp); // 로딩 실패 시 표시할 위젯
                  },
                  fadeInDuration: Duration(milliseconds: 500),
                  // 이미지가 로드될 때 페이드 인 효과
                  fadeOutDuration: Duration(milliseconds: 500),
                  // 이미지가 사라질 때 페이드 아웃 효과
                  width: 12.w,
                  // height: 4.h,
                  fit: BoxFit.cover,
                  // 이미지가 위젯 크기에 맞게 자르거나 확대하는 방식
                  imageBuilder: (context, imageProvider) {
                    return ClipOval(child: Image(image: imageProvider)); // 이미지가 로드되면 표시
                  },
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
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w600
                      ),
                    ),
                  ],

                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [

                      if(widget.chatModel.isMyChat!)...[
                        Text(widget.chatModel.unreadMemberCnt.toString(),
                          style: TextStyle(
                              color: Colors.red,
                              fontWeight: FontWeight.w700
                          ),
                        ),
                        SizedBox(width: 5,),
                        Text(widget.chatModel.createdAt.toString(),
                          style: TextStyle(
                              fontWeight: FontWeight.w600
                          ),
                        ),
                        SizedBox(width: 5,),
                      ],

                      Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.grey.withOpacity(0.35)
                        ),
                        child: Text(
                          widget.chatModel.message.toString(),
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 15,
                          ),
                        ),
                      ),
                      SizedBox(width: 5,),
                      if(!widget.chatModel.isMyChat!)...[
                        Text(widget.chatModel.createdAt.toString(),
                          style: TextStyle(
                              fontWeight: FontWeight.w600
                          ),
                        ),
                        SizedBox(width: 5,),
                        Text(widget.chatModel.unreadMemberCnt.toString(),
                          style: TextStyle(
                              color: Colors.red,
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
    );
  }
}
