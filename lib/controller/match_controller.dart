import 'dart:convert';

import 'package:badboys/model/match/match_info_model.dart';

import 'package:badboys/model/match/match_model.dart';
import 'package:badboys/model/member/user_info.dart';
import 'package:badboys/utils/helpers.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class MatchController extends GetxController {

  MatchModel matchModel = MatchModel();
  List<MatchInfoModel> standByMatchModelList = <MatchInfoModel>[];
  List<MatchInfoModel> joinMatchModelList = <MatchInfoModel>[];

  var isLoading = false.obs;  // 로딩 상태를 추적하는 변수
  var isApiCalled = false.obs;

  void clear() {
    isApiCalled = false.obs;
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


  Future<void> fnMatchStop() async {

    try {
      // POST 요청 보내기
      http.Response response = await Helpers.apiCall(
          '/service/match/queue/cancle',
          method: "POST",
          headers: {
            'Content-Type': 'application/json', // JSON 형식
          },

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




  Color selectMatchResultColor(String matchResult){

    if(matchResult == "WIN"){
      return Colors.red;
    } else if(matchResult == "LOSE"){
      return Colors.blue;
    } else{
      return Colors.green;
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

        UserInfo memberModel = await Helpers.getMember();

        matchModel.matchMemberModel.add(memberModel);

        matchModel.isJoinLockerRoom = true;

        Fluttertoast.showToast(
          msg: "참여 되었습니다.",
          toastLength: Toast.LENGTH_SHORT, // 토스트의 길이 (짧거나 길게 설정)
          gravity: ToastGravity.BOTTOM,  // 토스트 위치 (BOTTOM, CENTER, TOP)
          timeInSecForIosWeb: 1,         // iOS/Web에서의 지속 시간 설정
          backgroundColor: Colors.black, // 배경색
          textColor: Colors.white,       // 텍스트 색
          fontSize: 16.0,                // 폰트 크기
        );

        update();
      } else {
        // 오류 처리
        throw Exception('fnMatchJoin Failed');
      }

    } catch (error) {
      // 오류 처리
      print('fnMatchJoin Error: $error');

    } finally {
      isLoading.value = false;
    }

  }



  Future<void> fnGameStart() async {

    List<int> aTeamList = [];
    List<int> bTeamList = [];

    for (var item in matchModel.matchMemberModel.sublist(0,3)) {
      aTeamList.add(item.userId!);
    }

    for (var item in matchModel.matchMemberModel.sublist(3,6)) {
      bTeamList.add(item.userId!);
    }

    try {
      // POST 요청 보내기
      http.Response response = await Helpers.apiCall(
        '/service/match/game/start',
        method: "POST",
        headers: {
          'Content-Type': 'application/json', // JSON 형식
        },
        body: {
          "chatRoomId" : matchModel.matchInfoModel?.chatRoomId,
          "regionId": matchModel.matchInfoModel!.regionId,
          "matchName" : matchModel.matchInfoModel?.name,
          "ateamIdList": aTeamList,
          "bteamIdList": bTeamList,
        }
      );

      if (response.statusCode == 200) {
        final decodedBody = utf8.decode(response.bodyBytes);
        var jsonResponse = jsonDecode(decodedBody);

        matchModel.matchInfoModel!.matchInfoId = jsonResponse['matchInfoId'];
        matchModel.aTeamId = jsonResponse['ateamId'].toString();
        matchModel.bTeamId = jsonResponse['bteamId'].toString();

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

      String aTeamResult = "";
      String bTeamResult = "";

      if (int.parse(matchModel.aTeamValue!) > int.parse(matchModel.bTeamValue!)) {
        aTeamResult = "WIN";
        bTeamResult = "LOSE";
      } else if (int.parse(matchModel.aTeamValue!) < int.parse(matchModel.bTeamValue!)) {
        aTeamResult = "LOSE";
        bTeamResult = "WIN";
      } else {
        aTeamResult = "DRAW";
        bTeamResult = "DRAW";
      }


      // POST 요청 보내기
      http.Response response = await Helpers.apiCall(
          '/service/match/game/end',
          method: "POST",
          headers: {
            'Content-Type': 'application/json', // JSON 형식
          },
          body: {
            "matchInfoId": matchModel.matchInfoModel!.matchInfoId,
            "ateamResult": {
              "teamId": matchModel.aTeamId,
              "score": matchModel.aTeamValue,
              "result" : aTeamResult,
            },
            "bteamResult": {
              "teamId": matchModel.bTeamId,
              "score": matchModel.bTeamValue,
              "result" : bTeamResult,
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
        matchModel.isJoinLockerRoom = false;
        int loginMemberId = await Helpers.getMemberId();
        int index = matchModel.matchMemberModel.indexWhere((item) => item.userId == loginMemberId);
        matchModel.matchMemberModel.removeAt(index);

        update();
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

        standByMatchModelList = [];

        for (var item in jsonResponse['chatRoomList']) {

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

    isLoading.value = true;

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

          if(item['matchDt'] != null) {
            String dateString = item['matchDt'];
            DateTime date = DateTime.parse(dateString);

            item['matchDt'] =
            "${date.month.toString().padLeft(2, '0')}/${date.day.toString()
                .padLeft(2, '0')}";
          }
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

  Future<void> fnMatchRoomInfoUpdate(Map<String, dynamic> requestMap) async {
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
            'location' : requestMap['location'],
            'description' : requestMap['matchDescription'],
            'threeOnThreeYn' : requestMap['threeOnThreeYn'],
            'ballYn' : requestMap['ballYn'],
            'backBoardYn' : requestMap['backBoardYn'],
            'threePointLimitYn' : requestMap['threePointLimitYn'],
            'refereeYn' : requestMap['refereeYn'],
            'halfCourtYn' : requestMap['halfCourtYn'],
            'latitude' : requestMap['latitude'],
            'longitude' : requestMap['longitude'],
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

  Future<void> fnMatchOwnerChange(int? userId) async {
    try {

      // POST 요청 보내기
      // http.Response response = await Helpers.apiCall(
      //     '/service/chatRoom/${requestMap['chatRoomId']}/update',
      //     method: "POST",
      //     headers: {
      //       'Content-Type': 'application/json', // JSON 형식
      //     },
      //     body: {
      //       'userId' : userId,
      //     }
      // );

      // if (response.statusCode == 200) {
      //
      // } else {
      //   // 오류 처리
      //   throw Exception('fnMatchOwnerChange Failed');
      // }

    } catch (error) {
      // 오류 처리
      print('fnMatchOwnerChange Error: $error');

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

        int loginMemberId = await Helpers.getMemberId();

        clear();

        matchModel.matchInfoModel = MatchInfoModel.fromJson(jsonResponse['chatRoomInfo']);

        for (var item in jsonResponse['memberList']) {
          matchModel.matchMemberModel.add(UserInfo.fromJson(item));

          if (item['userId'] == loginMemberId) {
            matchModel.isJoinLockerRoom = true;
          }
        }

        matchModel.matchInfoModel?.chatRoomId = int.parse(matchInfoId);

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