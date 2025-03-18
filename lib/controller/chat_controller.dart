import 'dart:convert';

import 'package:badboys/utils/helpers.dart';
import 'package:get/get.dart';
import 'package:stomp_dart_client/stomp.dart';
import 'package:stomp_dart_client/stomp_config.dart';
import 'package:stomp_dart_client/stomp_frame.dart';
import 'package:http/http.dart' as http;

class ChatController extends GetxController{
  late StompClient stompClient;
  var isLoading = false.obs;  // 로딩 상태를 추적하는 변수

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
        print(jsonResponse);


      } else {
        // 오류 처리
        throw Exception('fnMatchStart Failed');
      }

    } catch (error) {
      // 오류 처리
      print('fnMatchStart Error: $error');

    } finally {
      isLoading.value = false;
    }

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


  // stomp 구독
  void onConnect(StompFrame frame) {
    print('STOMP connected!');

    // 메시지를 받을 Topic 구독
    stompClient.subscribe(
      destination: '/topic',  // 메시지를 받을 경로
      callback: (frame) {
        if (frame.binaryBody != null) {
          // 바이너리 데이터를 utf8로 디코딩하여 문자열로 변환
          String decodedMessage = utf8.decode(frame.binaryBody!);
          print('Decoded message: $decodedMessage');

          // 디코딩된 문자열을 JSON 객체로 변환
          try {
            String jsonMessage = jsonDecode(decodedMessage);



            print('Decoded JSON: $jsonMessage');
          } catch (e) {
            print('Error decoding JSON: $e');
          }
        } else {
          print('No binary body received');
        }
      },
    );
  }

  // 메시지 전송
  void sendMessage(String chatRoomId,String message) {
    var body = jsonEncode({
      'chatRoomId': chatRoomId,
      'senderId' : 8,
      'message': message,
    });

    stompClient.send(
      destination: '/app/chat.send',
      body: body,
    );
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
