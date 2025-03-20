import 'dart:convert';

import 'package:badboys/model/chat/chat_model.dart';
import 'package:badboys/model/member/member_model.dart';
import 'package:badboys/utils/helpers.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stomp_dart_client/stomp.dart';
import 'package:stomp_dart_client/stomp_config.dart';
import 'package:stomp_dart_client/stomp_frame.dart';
import 'package:http/http.dart' as http;

class ChatController extends GetxController{
  late StompClient stompClient;
  var chatModelList = <ChatModel>[].obs;
  var isLoading = false.obs;  // 로딩 상태를 추적하는 변수
  ScrollController scrollController = ScrollController();
  double previousPosition = 0.0;

  void clear() {
    // scrollController.dispose();
    chatModelList.value = <ChatModel>[];
    isLoading = false.obs;
  }


  Future<void> fnChatListMore(String? chatRoomId) async {

    try {
      print(chatModelList[0].toJson());
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

        for (var jsonItem in jsonResponse['messageList']) {
          DateTime dateTime = DateTime.parse(jsonItem['createdAt']);
          jsonItem['createdAt'] =  _formatMessageTime(dateTime);
          jsonItem['isMyChat'] = jsonItem['senderId'] == loginMemberId;

          chatModelList.insert(0,ChatModel.fromJson(jsonItem));
        }

        scrollToLoadChat(!jsonResponse['messageList'].isEmpty);

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
      // POST 요청 보내기
      http.Response response = await Helpers.apiCall(
          '/service/chatRoom/${chatRoomId}/messages',
          headers: {
            'Content-Type': 'application/json', // JSON 형식
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
        // 오류 처리
        throw Exception('fnChatList Failed');
      }

    } catch (error) {
      // 오류 처리
      print('fnChatList Error: $error');

    } finally {
      isLoading.value = false;
    }

  }

  Future<void> loadMoreData(String? chatRoomId) async {
    if (isLoading.value) return; // 이미 로딩 중인 경우

    previousPosition = scrollController.position.maxScrollExtent - 15.h;
    isLoading.value = true;
    await fnChatListMore(chatRoomId);
    isLoading.value = false;
  }

  void setScrollControllerListener(String? chatRoomId) async {
    scrollController.addListener(() async {
      if (scrollController.position.atEdge && scrollController.position.pixels == 0) {
      // 최상단에 도달했을 때 데이터를 로드
        await loadMoreData(chatRoomId);
      }
    });
  }

  void scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (scrollController.hasClients) {
        scrollController.jumpTo(scrollController.position.maxScrollExtent);
      }
    });
  }



  void scrollToLoadChat(bool isScrollMove) {
    WidgetsBinding.instance.addPostFrameCallback((_) {

      if(isScrollMove){
        scrollController.jumpTo(previousPosition);
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
      DateTime dateTime = DateTime.now();

      ChatModel chatModel = ChatModel();
      chatModel.senderId = jsonMessage['senderId'];
      chatModel.message = jsonMessage['message'];
      chatModel.createdAt = _formatMessageTime(dateTime);
      chatModel.unreadMemberCnt = 5;
      chatModel.isMyChat = false;

      chatModelList.add(chatModel);

      ///현재 스크롤 위치 검사
      if (isAtBottom()) {
        scrollToBottom();
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

  void _createNewSendMessage(String message) async {

    DateTime dateTime = DateTime.now();
    int loginMemberId = await Helpers.getMemberId();

    ChatModel chatModel = ChatModel();
    chatModel.senderId = loginMemberId;
    chatModel.message = message;
    chatModel.createdAt = _formatMessageTime(dateTime);
    chatModel.unreadMemberCnt = 4;
    chatModel.isMyChat = true;

    chatModelList.add(chatModel);
  }

  // 메시지 전송
  Future<void> sendMessage(String chatRoomId,String message) async {

    var body = jsonEncode({
      'chatRoomId': chatRoomId,
      'senderId' : 8,
      'message': message,
    });

    stompClient.send(
      destination: '/app/chat.send',
      body: body,
    );

    _createNewSendMessage(message);

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
