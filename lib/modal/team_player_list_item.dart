import 'package:badboys/model/match/match_member_model.dart';
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

              CachedNetworkImage(
                imageUrl: widget.matchMemberModel.profileImage.toString(),
                // 이미지 URL
                placeholder: (context, url) {
                  return CircularProgressIndicator(); // 로딩 중에 표시할 위젯
                },
                errorWidget: (context, url, error) {
                  // print('이미지 로딩 실패: ');
                  return Icon(Icons.account_circle_sharp); // 로딩 실패 시 표시할 위젯
                },
                fadeInDuration: Duration(milliseconds: 500),
                // 이미지가 로드될 때 페이드 인 효과
                fadeOutDuration: Duration(milliseconds: 500),
                // 이미지가 사라질 때 페이드 아웃 효과
                width: 10.w,
                // height: 4.h,
                fit: BoxFit.cover,
                // 이미지가 위젯 크기에 맞게 자르거나 확대하는 방식
                imageBuilder: (context, imageProvider) {
                  return ClipOval(child: Image(image: imageProvider)); // 이미지가 로드되면 표시
                },
              ),
              SizedBox(width: 10,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.matchMemberModel.username.toString(),
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w700
                    ),
                  ),
                  Text('2021 pts',
                    style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.w600
                    ),
                  ),
                ],
              ),
            ],
          ),

          Center(
            child: Text(
              '강퇴',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700
              ),
            ),
          )
        ],
      ),
    );
  }
}
