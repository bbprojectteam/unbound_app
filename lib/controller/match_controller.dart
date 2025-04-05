import 'dart:convert';

import 'package:badboys/model/match/match_info_model.dart';
import 'package:badboys/model/match/match_member_model.dart';
import 'package:badboys/model/match/match_model.dart';
import 'package:badboys/model/member/member_model.dart';
import 'package:badboys/utils/helpers.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class MatchController extends GetxController {

  MatchModel matchModel = MatchModel();
  List<MatchInfoModel> standByMatchModelList = <MatchInfoModel>[];
  List<MatchInfoModel> joinMatchModelList = <MatchInfoModel>[];

  // var matchUpdateModel = MatchInfoModel();

  var isLoading = false.obs;  // 로딩 상태를 추적하는 변수
  var isMatch = false.obs;
  var isMatching = false.obs;
  var isApiCalled = false.obs;


  void clear() {
    matchModel = MatchModel(); // 상태 초기화
  }



  Future<void> fnMatchStart() async {

    int regionId = await Helpers.getRegionId();

    try {
      // POST 요청 보내기
      http.Response response = await Helpers.apiCall(
          '/service/match/queue/start',
          method: "POST",
          headers: {
            'Content-Type': 'application/json', // JSON 형식
          },
          body: {
            'limitRegionId' : regionId,
          }
      );


      if (response.statusCode == 200) {

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

  Future<void> fnMatchJoin(String chatRoomId) async {

    try {
      // POST 요청 보내기
      http.Response response = await Helpers.apiCall(
        '/service/chatRoom/${chatRoomId}/join',
        method: "POST",
        headers: {
          'Content-Type': 'application/json', // JSON 형식
        },
      );

      if (response.statusCode == 200) {

      } else {
        // 오류 처리
        throw Exception('fnMatchExit Failed');
      }

    } catch (error) {
      // 오류 처리
      print('fnMatchExit Error: $error');

    } finally {
      isLoading.value = false;
    }

  }



  Future<void> fnGameStart(Map<String,dynamic> arguments) async {


    try {
      // POST 요청 보내기
      http.Response response = await Helpers.apiCall(
        '/service/match/game/start',
        method: "POST",
        headers: {
          'Content-Type': 'application/json', // JSON 형식
        },
        body: {
          "regionId": arguments['regionId'],
          "ateamIdList": arguments['aTeamIdList'] ,
          "bteamIdList": arguments['bTeamIdList'] ,
        }
      );

      if (response.statusCode == 200) {

      } else {
        // 오류 처리
        throw Exception('fnGameStart Failed');
      }

    } catch (error) {
      // 오류 처리
      print('fnGameStart Error: $error');

    } finally {
      isLoading.value = false;
    }

  }
  Future<void> fnGameEnd() async {


    try {
      // POST 요청 보내기
      http.Response response = await Helpers.apiCall(
          '/service/match/game/end',
          method: "POST",
          headers: {
            'Content-Type': 'application/json', // JSON 형식
          },
          body: {
            "matchInfoId": 4,
            "winnerTeamId": 8,
            "ateamResult": {
              "teamId": 7,
              "score": 53
            },
            "bteamResult": {
              "teamId": 8,
              "score": 12
            }
          }
      );

      if (response.statusCode == 200) {

      } else {
        // 오류 처리
        throw Exception('fnGameEnd Failed');
      }

    } catch (error) {
      // 오류 처리
      print('fnGameEnd Error: $error');

    } finally {
      isLoading.value = false;
    }

  }

  Future<void> fnMatchExit(String chatRoomId) async {

    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool("isMatching", false);

    try {
      // POST 요청 보내기
      http.Response response = await Helpers.apiCall(
          '/service/chatRoom/${chatRoomId}/exit',
          method: "POST",
          headers: {
            'Content-Type': 'application/json', // JSON 형식
          },
      );

      if (response.statusCode == 200) {

      } else {
        // 오류 처리
        throw Exception('fnMatchExit Failed');
      }

    } catch (error) {
      // 오류 처리
      print('fnMatchExit Error: $error');

    } finally {
      isLoading.value = false;
    }

  }


  Future<void> fnGetStandByLockerRoomList() async {

    int regionId = await Helpers.getRegionId();

    try {
      // POST 요청 보내기
      http.Response response = await Helpers.apiCall(
        '/service/chatRoom/list/unJoined/${regionId}',
        method: "GET",
        headers: {
          'Content-Type': 'application/json', // JSON 형식
        },
      );

      if (response.statusCode == 200) {
        final decodedBody = utf8.decode(response.bodyBytes);
        var jsonResponse = jsonDecode(decodedBody);

        print(jsonResponse);
        standByMatchModelList = [];

        for(var item in jsonResponse['chatRoomList']){

          if(item['matchDt'] != null) {
            String dateString = item['matchDt'];
            DateTime date = DateTime.parse(dateString);

            item['matchDt'] =
            "${date.month.toString().padLeft(2, '0')}/${date.day.toString()
                .padLeft(2, '0')}";
          }

          standByMatchModelList.add(MatchInfoModel.fromJson(item));





        }


        update();

      } else {
        // 오류 처리
        throw Exception('fnGetStandByLockerRoomList Failed');
      }

    } catch (error) {
      // 오류 처리
      print('fnGetStandByLockerRoomList Error: $error');

    } finally {
      isLoading.value = false;
    }

  }


  Future<void> fnGetJoinLockerRoomList() async {

    try {
      // POST 요청 보내기
      http.Response response = await Helpers.apiCall(
        '/service/chatRoom/list/joined',
        method: "GET",
        headers: {
          'Content-Type': 'application/json', // JSON 형식
        },
      );

      if (response.statusCode == 200) {
        final decodedBody = utf8.decode(response.bodyBytes);
        var jsonResponse = jsonDecode(decodedBody);

        joinMatchModelList = [];

        for(var item in jsonResponse['chatRoomList']){
          joinMatchModelList.add(MatchInfoModel.fromJson(item));
        }

        update();

      } else {
        // 오류 처리
        throw Exception('fnGetStandByLockerRoomList Failed');
      }

    } catch (error) {
      // 오류 처리
      print('fnGetStandByLockerRoomList Error: $error');

    } finally {
      isLoading.value = false;
    }

  }



  Future<void> fnMatchRoomInfoUpdate(Map<String, String> requestMap) async {
    try {

      // POST 요청 보내기
      http.Response response = await Helpers.apiCall(
          '/service/chatRoom/${requestMap['chatRoomId']}/update',
          method: "POST",
          headers: {
            'Content-Type': 'application/json', // JSON 형식
          },
          body: {
            'name' : requestMap['matchName'],
            'matchDt' : requestMap['matchDt'],
            'location' : '대전테스트',
            'description' : requestMap['matchDescription']
          }
      );


      if (response.statusCode == 200) {

      } else {
        // 오류 처리
        throw Exception('fnMatchRoomInfoUpdate Failed');
      }

    } catch (error) {
      // 오류 처리
      print('fnMatchRoomInfoUpdate Error: $error');

    } finally {
      isLoading.value = false;
    }

  }

  Future<void> fnMatchInfo(String matchInfoId ) async {

    try {

      http.Response response = await Helpers.apiCall(
          '/service/chatRoom/${matchInfoId}/info',
          method: "GET",
          headers: {
            'Content-Type': 'application/json', // JSON 형식
          },
      );

      if (response.statusCode == 200) {
        final decodedBody = utf8.decode(response.bodyBytes);
        var jsonResponse = jsonDecode(decodedBody);

        clear();

        matchModel.matchInfoModel = MatchInfoModel.fromJson(jsonResponse['chatRoomInfo']);

        for (var item in jsonResponse['memberList']) {
          matchModel.matchMemberModel.add(MatchMemberModel.fromJson(item));
        }

        update();

      } else {
        // 오류 처리
        throw Exception('fnMatchInfo Failed');
      }

    } catch (error) {
      // 오류 처리
      print('fnMatchInfo Error: $error');

    } finally {
      isLoading.value = false;
    }

  }





}