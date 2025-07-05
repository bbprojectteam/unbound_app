import 'dart:ffi';
import 'dart:typed_data';

import 'package:badboys/controller/chat_controller.dart';
import 'package:badboys/controller/match_controller.dart';
import 'package:badboys/router/app_bottom_modal_router.dart';
import 'package:badboys/screen/subScreen/lockerRoom/chat/chat_item.dart';
import 'package:badboys/utils/helpers.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:image_picker/image_picker.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ChatList extends StatefulWidget {
  const ChatList({
    super.key,
    required this.chatRoomId
  });

  final String chatRoomId;

  @override
  State<ChatList> createState() => _ChatListState();
}

class _ChatListState extends State<ChatList> {
  final TextEditingController textController = TextEditingController();
  late ChatController chatController;
  late MatchController matchController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Get.lazyPut<ChatController>(() => ChatController());
    chatController = Get.find<ChatController>();
    matchController = Get.find<MatchController>();

    if (!chatController.isApiCalled.value) {  // 아직 호출되지 않았다면
      chatController.isApiCalled.value = true;
      chatController.fnChatList(widget.chatRoomId);

      /* 채팅 시 유저 정보 위함 */
      chatController.matchMemberModel = matchController.matchModel.matchMemberModel;
    }

    chatController.fnConnectToStompServer(widget.chatRoomId);
    chatController.setScrollControllerListener(widget.chatRoomId);

    // 컨트롤러에 마지막 postion저장하고 거기로 이동
    chatController.scrollToJump();
  }


  @override
  Widget build(BuildContext context) {

    return SingleChildScrollView(

      child: Obx((){
        var chatModelList = chatController.chatModelList;

        return Column(
          children: [
            Container(
              width: 100.w,
              height: 72.h,
              decoration: BoxDecoration(
                color: Colors.black26,
              ),
              child: Stack(
                children: [
                  if(chatController.isLoading.value)...[
                    Positioned(
                      top: 10,
                      left: 10,
                      right: 10,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: const Center(
                          child: CircularProgressIndicator(
                            color: Colors.orange,),
                        ),
                      ),
                    ),
                  ],

                  ListView.builder(
                      reverse: false,  // 리스트의 항목을 역순으로 표시
                      controller: chatController.scrollController,
                      itemCount: chatModelList.length,
                      padding: chatController.isLoading.value ? null : EdgeInsets.zero,
                      itemBuilder: (context, index) {
                        // 각 메시지를 ListView에 표시
                        return ChatItem(chatModel: chatModelList[index],);
                      }
                  ),
                ],
              ),
            ),

            Container(
              width: 100.w,  // maxWidth는 부모 위젯에서 제공된 최대 너비
              height: 8.h,  // maxHeight * 0.1은 컨테이너의 높이 비율
              color: Colors.black12,  // 배경색
              child: Row(
                children: [
                  // 텍스트 입력 필드
                  Expanded(
                    child: TextField(
                      controller: textController,
                      decoration: InputDecoration(
                        hintText: '메시지를 입력하세요',  // 기본 텍스트
                        hintStyle: TextStyle(color: Colors.grey),
                        prefixIcon: GestureDetector(
                          onTap: () async {


                            await AppBottomModalRouter.fnModalRouter(context,8, callBack: (imageFile) async {
                              String? imagePath = await chatController.sendImageMessage(widget.chatRoomId, imageFile);

                              if (imagePath != null) {
                                chatController.sendMessage(widget.chatRoomId, imagePath);
                              } else {
                                Helpers.customFlutterToast("잠시 후 다시 시도해주세요.");
                              }
                            });

                          },
                          child: Icon(
                              Icons.add,
                              color: Colors.grey
                          ),
                        ),  // 왼쪽에 플러스 아이콘 추가
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
                    onPressed: () async {

                      await chatController.sendMessage(widget.chatRoomId,textController.text);
                      textController.text = "";
                    },
                  ),
                ],
              ),
            ),
          ],
        );
      }
      ),
    );
  }
}
