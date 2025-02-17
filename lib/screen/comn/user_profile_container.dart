import 'package:badboys/controller/member_controller.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class UserProfileContainer extends StatefulWidget {
  const UserProfileContainer({super.key});

  @override
  State<UserProfileContainer> createState() => _UserProfileContainerState();
}

class _UserProfileContainerState extends State<UserProfileContainer> {
  late MemberController memberController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    memberController = Get.put(MemberController());
    memberController.fnGetMemberInfo();
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      child: Obx(() {

        if (memberController.isLoading.value) {
          return CircularProgressIndicator();
        }
        var model = memberController.model.value;

        // username이 변경될 때마다 UI 업데이트
        return Padding(
          padding: EdgeInsets.only(left: 5, right: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  if(model.profileImage != null)
                  CachedNetworkImage(
                    imageUrl: model.profileImage!,
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

                    SizedBox(width: 5,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(model.username ?? "null",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(model.regionNm ?? "null",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 13,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),

                ],
              ),

              Row(
                children: [
                  Image.asset(
                    'assets/images/color_world.png',
                    width: 5.w,
                    height: 2.h,
                    color: Colors.white,
                    fit: BoxFit.cover,
                  ),
                  SizedBox(width: 7,),
                  Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text( (model.mmr ?? '0').toString() + ' pts',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ]
                  ),
                ],
              ),
            ],
          ),
        );
      }),
    );
  }
}