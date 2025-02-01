import 'package:badboys/subScreen/lockerRoom/chat/chat_item.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ChatList extends StatefulWidget {
  const ChatList({super.key});

  @override
  State<ChatList> createState() => _ChatListState();
}

class _ChatListState extends State<ChatList> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [

          Container(
            width: 100.w,
            height: 72.h,
            decoration: BoxDecoration(

              color: Colors.white,
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  for(int i = 0 ; i< 20; i++)...[
                    if(i == 3)...[
                      Container(
                        padding: EdgeInsets.all(15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Container(
                                height: 1,  // 선의 두께
                                color: Colors.black.withOpacity(0.5),  // 선의 색
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10),  // 텍스트 양 옆의 여백
                              child: Text('6월 12일'),
                            ),
                            Expanded(
                              child: Container(
                                height: 1,  // 선의 두께
                                color: Colors.black.withOpacity(0.5),  // 선의 색
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],

                    if(i != 3)
                      ChatItem(isMyChat: i % 2 == 0 ? true : false )
                  ]
                ],
              ),
            ),
          ),

          Container(
            width: 100.w,  // maxWidth는 부모 위젯에서 제공된 최대 너비
            height: 8.h,  // maxHeight * 0.1은 컨테이너의 높이 비율
            color: Colors.white,  // 배경색
            child: Row(
              children: [
                // 텍스트 입력 필드
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: '메시지를 입력하세요',  // 기본 텍스트
                      hintStyle: TextStyle(color: Colors.grey),
                      prefixIcon: Icon(Icons.add, color: Colors.grey),  // 왼쪽에 플러스 아이콘 추가
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),  // 둥근 모서리
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      filled: true,
                      fillColor: Colors.grey[200],  // 입력 필드 배경 색
                    ),
                  ),
                ),
                SizedBox(width: 10),  // 입력 필드와 전송 버튼 사이 간격
                // 전송 버튼
                IconButton(
                  icon: Icon(Icons.send),
                  onPressed: () {
                    // 전송 버튼 클릭 시 동작 (예: 메시지 전송 처리)
                    print('메시지 전송');
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
