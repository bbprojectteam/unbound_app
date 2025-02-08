import 'package:badboys/model/member/member_model.dart';
import 'package:badboys/utils/helpers.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MemberController with ChangeNotifier{

  MemberModel model = MemberModel();


  void notify() {
    notifyListeners();
  }

  void clear() {
    model = MemberModel();
  }


  Future<void> getMemberInfo(String userEmail) async {

    print('getMemberInfo');

    // try {
    //   // POST 요청 보내기
    //   final response = await Helpers.apiCall(
    //       "getMemberInfo?memberEmail=$userEmail",
    //       headers: {
    //         'Content-Type': 'application/json', // JSON 형식
    //       },
    //
    //   );
    //
    //   if ((response != null)) {
    //     // 성공적으로 데이터를 가져옴
    //     model = MemberModel.fromJson(response['member']);
    //     await saveMemberData();
    //
    //   } else {
    //     // 오류 처리
    //     throw Exception('Failed to set playlist like');
    //   }
    // } catch (error) {
    //   // 오류 처리
    //   print('Error: $error');
    // }
  }



}