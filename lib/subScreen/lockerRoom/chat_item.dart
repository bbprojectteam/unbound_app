import 'package:flutter/material.dart';

class ChatItem extends StatefulWidget {
  const ChatItem({
    super.key,
    required this.isMyChat,

  });

  final bool isMyChat;


  @override
  State<ChatItem> createState() => _ChatItemState();
}

class _ChatItemState extends State<ChatItem> {
  @override
  Widget build(BuildContext context) {
    return  Align(
      alignment: widget.isMyChat ? Alignment.centerLeft : Alignment.centerRight , // 왼쪽에 붙도록 설정
      child: Container(
        padding: EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: widget.isMyChat ? MainAxisAlignment.start : MainAxisAlignment.end,
          children: [

            if( widget.isMyChat)...[
              ClipOval(
                child: Image.asset(
                  'assets/images/intro.png',
                  width: 45,
                  height: 45,
                  fit: BoxFit.fill,
                ),
              ),
              SizedBox(width: 5,),
            ],

            Container(

              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: widget.isMyChat ? CrossAxisAlignment.start : CrossAxisAlignment.end,
                children: [

                  Text(
                    widget.isMyChat ? '오민규' :'나',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w600
                    ),
                  ),

                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.grey.withOpacity(0.35)
                        ),
                        child: Text(
                          '스꺼러갱입장',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 15,
                          ),
                        ),
                      ),
                      SizedBox(width: 5,),
                      Text('06:12'),
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
