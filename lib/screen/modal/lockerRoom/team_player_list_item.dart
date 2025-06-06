
import 'package:badboys/controller/match_controller.dart';
import 'package:badboys/model/member/user_info.dart';
import 'package:badboys/screen/subScreen/comn/cachedNetworkImage/custom_cached_network_image.dart';
import 'package:badboys/utils/helpers.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class TeamPlayerListItem extends StatefulWidget {
  const TeamPlayerListItem({
    super.key,
    required this.matchMemberModel,
    required this.isOwnerAuth,
  });

  final UserInfo matchMemberModel;
  final bool? isOwnerAuth;

  @override
  State<TeamPlayerListItem> createState() => _TeamPlayerListItemState();
}

class _TeamPlayerListItemState extends State<TeamPlayerListItem> {

  late MatchController matchController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    matchController = Get.find<MatchController>();
  }

  @override
  Widget build(BuildContext context) {

    return Container(
      padding: EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              ClipOval(
                child: CustomCachedNetworkImage(
                    imagePath: widget.matchMemberModel.profileImage.toString(),
                    imageWidth: 10.w,
                    imageHeight: null
                ),
              ),

              SizedBox(width: 10,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.matchMemberModel.username.toString(),
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w700
                        ,fontFamily: 'EHSMB'
                    ),
                  ),
                  Text('${widget.matchMemberModel.mmr} pts',
                    style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'EHSMB'
                    ),
                  ),
                ],
              ),
            ],
          ),

          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GestureDetector(
                onTap: () {
                  Get.toNamed(
                      '/memberPageScreen',
                      arguments: {'tab' : 0, 'memberId' : widget.matchMemberModel.userId }
                  );
                },
                child: Center(
                  child: Text(
                    '상세보기',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'EHSMB'
                    ),
                  ),
                ),
              ),

              if (widget.matchMemberModel.role == "MEMBER" && widget.isOwnerAuth!)...[
                SizedBox(height: 7,),
                GestureDetector(
                  onTap: () async {
                    await matchController.fnMatchOwnerChange(widget.matchMemberModel.userId);
                  },
                  child: Center(
                    child: Text(
                      '방장위임',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                          fontFamily: 'EHSMB'
                      ),
                    ),
                  ),
                ),
              ],

            ],
          )
        ],
      ),
    );
  }
}
