
import 'package:badboys/model/match/match_info_model.dart';

import 'package:badboys/model/member/user_info.dart';



class MatchModel {

  MatchInfoModel? matchInfoModel;

  List<UserInfo> matchMemberModel = [];

  bool? isJoinLockerRoom = false;

  String? aTeamId;
  String? aTeamValue = "00";

  String? bTeamId;
  String? bTeamValue = "00";

  String winTeam = "";

}