import 'dart:convert';

import 'package:badboys/controller/match_controller.dart';
import 'package:badboys/model/chat/chat_model.dart';

import 'package:badboys/model/member/user_info.dart';
import 'package:badboys/utils/helpers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stomp_dart_client/stomp.dart';
import 'package:stomp_dart_client/stomp_config.dart';
import 'package:stomp_dart_client/stomp_frame.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';


class ChatController extends GetxController{
  late StompClient stompClient;
  var chatModelList = <ChatModel>[].obs;
  List<UserInfo> matchMemberModel = [];
  ScrollController scrollController = ScrollController();
  double previousPosition = 0.0;
  var isApiCalled = false.obs;
  var isLoading = false.obs;  // 로딩 상태를 추적하는 변수

  void clear() {
    // scrollController.dispose();
    chatModelList.value = <ChatModel>[];
    isLoading = false.obs;
  }

  Future<void> fnChatListMore(String? chatRoomId) async {


    try {
      // POST 요청 보내기
      http.Response response = await Helpers.apiCall(
        '/service/chatRoom/${chatRoomId}/messages?lastMessageId=${chatModelList[0].messageId}',
        headers: {
          'Content-Type': 'application/json', // JSON 형식
        },
      );


      if (response.statusCode == 200) {
        final decodedBody = utf8.decode(response.bodyBytes);
        var jsonResponse = jsonDecode(decodedBody);
        int loginMemberId = await Helpers.getMemberId();
        int loadChatListCnt = jsonResponse['messageList'].length - 1;

        for (var jsonItem in jsonResponse['messageList']) {
          DateTime dateTime = DateTime.parse(jsonItem['createdAt']);
          jsonItem['createdAt'] =  _formatMessageTime(dateTime);
          jsonItem['isMyChat'] = jsonItem['senderId'] == loginMemberId;

          chatModelList.insert(0,ChatModel.fromJson(jsonItem));
        }

        scrollToLoadChat(!jsonResponse['messageList'].isEmpty,loadChatListCnt);

      } else {
        // 오류 처리
        throw Exception('fnChatListMore Failed');
      }

    } catch (error) {
      // 오류 처리
      print('fnChatListMore Error: $error');

    } finally {
      isLoading.value = false;
    }
  }

  Future<void> fnChatList(String? chatRoomId) async {

    try {
      http.Response response = await Helpers.apiCall(
          '/service/chatRoom/${chatRoomId}/messages',
          headers: {
            'Content-Type': 'application/json',
          },
      );

      if (response.statusCode == 200) {
        final decodedBody = utf8.decode(response.bodyBytes);
        var jsonResponse = jsonDecode(decodedBody);
        int loginMemberId = await Helpers.getMemberId();

        clear();

        for (var jsonItem in jsonResponse['messageList'].reversed) {

          DateTime dateTime = DateTime.parse(jsonItem['createdAt']);
          jsonItem['createdAt'] = _formatMessageTime(dateTime);
          jsonItem['isMyChat'] = jsonItem['senderId'] == loginMemberId;

          chatModelList.add(ChatModel.fromJson(jsonItem));
        }

        scrollToBottom();
      } else {
        throw Exception('fnChatList Failed');
      }

    } catch (error) {
      print('fnChatList Error: $error');
    } finally {
      isLoading.value = false;
    }

  }

  Future<void> loadMoreData(String? chatRoomId) async {
    if (isLoading.value) return; // 이미 로딩 중인 경우
    isLoading.value = true;
    await fnChatListMore(chatRoomId);
    isLoading.value = false;
  }

  void setScrollControllerListener(String? chatRoomId) async {
    scrollController.addListener(() async {

      previousPosition = scrollController.position.pixels;

      if (scrollController.position.atEdge && scrollController.position.pixels == 0) {
      // 최상단에 도달했을 때 데이터를 로드
        await loadMoreData(chatRoomId);
      }
    });
  }

  void scrollToBottom() {
    if (scrollController.hasClients) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
          scrollController.animateTo(
            chatModelList.length * 40.h,
            duration: Duration(milliseconds: 300), // 이동 시간을 설정
            curve: Curves.easeInOut, // 애니메이션의 곡선을 설정
          );
      });
    }
  }


  void scrollToJump() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (scrollController.hasClients) {
        scrollController.animateTo(
          previousPosition,
          duration: Duration(milliseconds: 300), // 이동 시간을 설정
          curve: Curves.easeInOut, // 애니메이션의 곡선을 설정
        );
      }
    });
  }

  void scrollToLoadChat(bool isScrollMove, int loadChatListCnt) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if(isScrollMove){
        scrollController.jumpTo(scrollController.position.pixels + (8.h * loadChatListCnt));
      } else {
        scrollController.jumpTo(0);
      }
    });
  }

  bool isAtBottom() {
    double threshold = 50.0; //허용 범위
    return scrollController.position.maxScrollExtent - scrollController.position.pixels <= threshold;
  }

  void fnConnectToStompServer() {
    // 로그: 연결 시도 전
    print("Attempting to connect to WebSocket server...");

    stompClient = StompClient(
      config: StompConfig(
        url: 'wss://moneygang.store/ws-chat/websocket', // WebSocket URL
        onConnect: (StompFrame frame) {
          print("Connected to WebSocket server! Frame: $frame");
          onConnect(frame);  // 기존 onConnect 함수 호출
        },
        onWebSocketError: (dynamic error) {
          print("WebSocket error: $error");
          onError(error);  // 기존 onError 함수 호출
        },
        onDisconnect: (StompFrame frame) {
          print("Disconnected from WebSocket server! Frame: $frame");
          onDisconnect(frame);  // 기존 onDisconnect 함수 호출
        },
        onStompError: (error) {
          print("STOMP error: $error");
        },
      ),
    );

    // 로그: 연결 활성화 직후
    print("Activating StompClient...");
    stompClient.activate();  // WebSocket 연결 활성화.
  }

  void onReceive (StompFrame frame) {
// 바이너리 데이터를 utf8로 디코딩하여 문자열로 변환
    String decodedMessage = utf8.decode(frame.binaryBody!);

    // 디코딩된 문자열을 JSON 객체로 변환
    try {
      Map<String, dynamic> jsonMessage = jsonDecode(decodedMessage);

      var matchedMember = matchMemberModel.firstWhere(
            (member) => member.userId == jsonMessage['senderId'],
      );

      DateTime dateTime = DateTime.now();
      ChatModel chatModel = ChatModel();
      chatModel.senderId = jsonMessage['senderId'];
      chatModel.message = jsonMessage['message'];
      chatModel.username = matchedMember.username;
      chatModel.profileImage = matchedMember.profileImage;
      chatModel.createdAt = _formatMessageTime(dateTime);
      chatModel.unreadMemberCnt = 5; //???
      chatModel.isMyChat = false;

      chatModelList.add(chatModel);

      ///현재 스크롤 위치 검사
      if (scrollController.hasClients) {
        if (isAtBottom()) {
          scrollToBottom();
        }
      }

      print('Decoded JSON: $jsonMessage');
    } catch (e) {
      print('Error decoding JSON: $e');
    }

  }
  // stomp 구독
  void onConnect(StompFrame frame) {
    print('STOMP connected!');

    // 메시지를 받을 Topic 구독
    stompClient.subscribe(
      destination: '/topic',  // 메시지를 받을 경로
      callback: (frame) {
        if (frame.binaryBody != null) {
          onReceive(frame);
        } else {
          print('No binary body received');
        }
      },
    );
  }

  String _formatMessageTime(DateTime dateTime) {
    return "${dateTime.hour.toString().padLeft(2, '0')}:${dateTime.minute.toString().padLeft(2, '0')}";
  }

  Future<void> _createNewSendMessage(String message) async {

    DateTime dateTime = DateTime.now();
    int loginMemberId = await Helpers.getMemberId();

    ChatModel chatModel = ChatModel();
    chatModel.senderId = loginMemberId;
    chatModel.message = message;
    chatModel.createdAt = _formatMessageTime(dateTime);
    chatModel.unreadMemberCnt = 5;
    chatModel.isMyChat = true;

    chatModelList.add(chatModel);
    if (chatModelList.length >= 10) {
      scrollToBottom();
    }
  }

  Future<String?> sendImageMessage(String chatRoomId, Uint8List? imageBytes) async {
    try {
      http.Response response = await Helpers.apiCall(
          '/service/chatRoom/${chatRoomId}/uploadImage',
          method: "POST",
          headers: {
            'Content-Type': 'application/json',
          },
          file: http.MultipartFile.fromBytes(
            'profileImageFile', // 서버에서 받을 필드 이름
            imageBytes!, // 선택한 파일의 바이트
            filename: "example.jpg", // 파일 이름
            contentType: MediaType('image', 'jpg'),
          )

      );

      if (response.statusCode == 200) {
        final decodedBody = utf8.decode(response.bodyBytes);

        var jsonResponse = jsonDecode(decodedBody);

        return jsonResponse['imageUrl'];
      } else {
        throw Exception('sendImageMessage Failed');
      }

    } catch (error) {
      print('sendImageMessage Error: $error');
      return null;
    }
  }

  // 메시지 전송
  Future<void> sendMessage(String chatRoomId,String message) async {

    int loginMemberId = await Helpers.getMemberId();

    var body = jsonEncode({
      'chatRoomId': chatRoomId,
      'senderId' : loginMemberId,
      'message': message,
    });

    try {
      stompClient.send(
        destination: '/app/chat.send',
        body: body,
      );
    } catch (e) {
      print('채팅 전송 오류 : ${e}');
    }


    await _createNewSendMessage(message);

  }

  // WebSocket 연결 오류 처리
  void onError(dynamic error) {
    print('Error occurred: $error');
  }

  // 연결 종료 처리
  void onDisconnect(StompFrame frame) {
    print('Disconnected from server');
  }

  // 연결 종료
  void disconnect() {
    stompClient.deactivate();
    print('Disconnected');
  }

}
