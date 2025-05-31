import 'package:badboys/screen/subScreen/comn/custom_cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class MemberIconItem extends StatefulWidget {
  const MemberIconItem({
    super.key,
    required this.memberNickName,
    required this.memberProfileImage,
    required this.topHeight,
    required this.leftWidth,
  });

  final String memberNickName;
  final String memberProfileImage;
  final double topHeight;
  final double leftWidth;

  @override
  State<MemberIconItem> createState() => _MemberIconItemState();
}

class _MemberIconItemState extends State<MemberIconItem> {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: widget.topHeight,
      left: widget.leftWidth,
      child: Column(
        children: [
          ClipOval(
            child: CustomCachedNetworkImage(
                imagePath: widget.memberProfileImage,
                imageWidth: 14.w,
                imageHeight: null
            ),
          ),
          SizedBox(height: 3,),
          Text(
            widget.memberNickName,
            style: TextStyle(
                color: Colors.white,
                fontSize: 13.5,
                fontWeight: FontWeight.w700
            ),
          ),
        ],
      ),
    );
  }
}
