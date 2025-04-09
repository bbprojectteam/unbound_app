
import 'package:badboys/model/match/match_info_model.dart';

import 'package:badboys/model/member/member_model.dart';



class MatchModel {

  MatchInfoModel? matchInfoModel;

  List<MemberModel> matchMemberModel = [];

  bool? isJoinLockerRoom = false;

  String? aTeamId;
  String? aTeamValue = "00";

  String? bTeamId;
  String? bTeamValue = "00";

  String winTeam = "";

}