import 'package:badboys/model/match/match_member_model.dart';
import 'package:badboys/screen/comn/custom_cached_network_image.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class TeamPlayerListItem extends StatefulWidget {
  const TeamPlayerListItem({
    super.key,
    required this.matchMemberModel,
  });

  final MatchMemberModel matchMemberModel;

  @override
  State<TeamPlayerListItem> createState() => _TeamPlayerListItemState();
}

class _TeamPlayerListItemState extends State<TeamPlayerListItem> {
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

          Center(
            child: Text(
              '상세보기',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'EHSMB'
              ),
            ),
          )
        ],
      ),
    );
  }
}
