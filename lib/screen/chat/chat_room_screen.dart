import 'package:badboys/screen/chat/chat_item.dart';
import 'package:badboys/screen/comn/custom_appbar_screen.dart';
import 'package:flutter/material.dart';

class ChatRoomScreen extends StatefulWidget {
  const ChatRoomScreen({
    super.key,
  });


  @override
  State<ChatRoomScreen> createState() => _ChatRoomScreenState();
}

class _ChatRoomScreenState extends State<ChatRoomScreen> {
  @override
  Widget build(BuildContext context) {
    double maxWidth = MediaQuery.of(context).size.width;
    double maxHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        width: maxWidth,
        color: Colors.blueGrey,
        child: Column(
          children: [
            CustomAppbarScreen(
              isNotification : true,
              isListMenu : false,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.all(10),
                  width: maxWidth,
                  child: Column(
                    children: [
                      Center(
                        child: Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color:   Colors.black.withOpacity(0.2), // 하단은 어두운 색
                          ),
                          child: Text('2024-12-15',
                            style: TextStyle(color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w700
                            ),
                          ),
                        ),
                      ),
          
                      
                      for(int i = 0 ; i< 20; i++)...[
                        // ChatItem(isMyChat: i % 2 == 0 ? true : false )
                        
                      ]

                


                    ],
                  ),
                ),
              ),
            ),
            Container(
              width: maxWidth,  // maxWidth는 부모 위젯에서 제공된 최대 너비
              height: maxHeight * 0.1,  // maxHeight * 0.1은 컨테이너의 높이 비율
              color: Colors.white,  // 배경색
              padding: EdgeInsets.symmetric(horizontal: 10),  // 좌우 여백
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
      ),
    );
  }
}
