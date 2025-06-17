import 'dart:ffi';

import 'package:badboys/controller/auth_controller.dart';
import 'package:badboys/controller/member_controller.dart';
import 'package:badboys/model/member/user_info.dart';
import 'package:badboys/screen/subScreen/comn/cachedNetworkImage/custom_cached_network_image.dart';
import 'package:badboys/screen/subScreen/comn/button/select_match_info_btn.dart';

import 'package:badboys/screen/modal/member/profile_setting_text_field_item.dart';
import 'package:badboys/utils/helpers.dart';
import 'package:file_picker/file_picker.dart';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:image_picker/image_picker.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ProfileSettingModal extends StatefulWidget {
  const ProfileSettingModal({
    super.key,
    required this.userInfo,
  });

  final UserInfo? userInfo;

  @override
  State<ProfileSettingModal> createState() => _ProfileSettingModalState();
}

class _ProfileSettingModalState extends State<ProfileSettingModal> {
  late MemberController memberController;

  late int? selectedGender = 0;
  Uint8List? _imageBytes = null;
  late FilePickerResult filePickerResult;
  late UserInfo? userInfoTemp;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    memberController = Get.find<MemberController>();
    selectedGender = widget.userInfo?.gender == 'M' ? 0 : 1;
    memberController.nickNmTextEdController.text = widget.userInfo?.username ?? '';
    memberController.introductionTextEdController.text = widget.userInfo?.introduction ?? '';
    memberController.birthTextEdController.text = widget.userInfo?.birth ?? '';

  }

  @override
  void dispose() {
    // TODO: implement dispose
    memberController.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    Future<void> _pickImage() async {
      try {
        final ImagePicker picker = ImagePicker();

        final XFile? image = await picker.pickImage(source: ImageSource.gallery);

        if (image != null) {
          print("이미지 선택됨: ${image.path}");

          Uint8List? croppedImage = await Helpers.cropImage(image.path);

          if (croppedImage != null) {
            filePickerResult = await Helpers.convertUint8ListToFilePickerResult(
              croppedImage,
              croppedImage.lengthInBytes,
            );

            _imageBytes = croppedImage;
            setState(() {});
          } else {
            print("이미지를 자르는 중 문제가 발생했습니다.");
          }
        } else {
          print("이미지가 선택되지 않았습니다.");
        }
      } catch (e) {
        print("이미지 선택 또는 처리 중 오류 발생: $e");
      }
    }



    return Scaffold(
        body: Obx(() {
            return Container(
              width: 100.w,
              height: 100.h,
              decoration: BoxDecoration(
               color: Colors.black,
              ),

              child: Stack(
                children: [

                  Image.asset(
                    'assets/images/rank_bg.jpg',
                    width: 100.w,
                    height: 35.h,
                    fit: BoxFit.cover,
                  ),

                  Positioned(
                      top: 5.h,
                      left: 10,
                      right: 10,
                      child: Text(
                        'Unbound',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w900,
                            fontSize: 20,
                            fontFamily: 'EHSMB'
                        ),
                      ),
                  ),

                  Positioned(
                    top: 10.h,
                    left: 10,
                    right: 10,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [

                        if (widget.userInfo != null && _imageBytes == null)
                          GestureDetector(
                            onTap: (){
                              _pickImage();

                            },
                            child: ClipOval(
                              child: CustomCachedNetworkImage(
                                  imagePath: widget.userInfo?.profileImage,
                                  imageWidth: 30.w,
                                  imageHeight: 15.h
                              ),
                            ),
                          ),

                        if (widget.userInfo == null || _imageBytes != null)
                          Container(
                          width: 25.w,
                          height: 20.h,
                          child: GestureDetector(
                            onTap: (){
                              _pickImage();
                            },
                            child: _imageBytes != null // 선택된 이미지가 있을 경우
                                ? ClipOval(
                                  child: Image.memory(
                                    _imageBytes!, // 선택된 이미지 표시
                                    width: 30.w,
                                    height: 15.h,
                                  ),
                                )
                                : Icon(
                                  Icons.account_circle_sharp,
                                  color: Colors.grey,
                                  size: 30.w,
                                ),
                              ),
                            ),

                        SizedBox(height: 70,),

                        Container(
                          width: 100.w,
                          child: Column(
                            children: [

                              ProfileSettingTextFieldItem(labelText: "닉네임",textLength : 8, textEditingController: memberController.nickNmTextEdController,maxLines: 1,),
                              ProfileSettingTextFieldItem(labelText: "생년월일",textLength : 8,textEditingController: memberController.birthTextEdController,maxLines: 1,),
                              ProfileSettingTextFieldItem(labelText: "소개",textLength : 200,textEditingController: memberController.introductionTextEdController,maxLines: 4,),


                              SizedBox(height: 10,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Center(
                                    child: SelectMatchInfoBtn(
                                      title: memberController.reginonNm.value,
                                      listId: 1,
                                      callBack : (int? id, String? text) {
                                        memberController.reginonNm.value = text ?? "지역 선택";
                                        memberController.isReginonSelected.value = true;
                                      },isSelected : memberController.isReginonSelected.value,
                                      containerWidth: 45.w,

                                    ),
                                  ),
                                  SizedBox(height: 20,),
                                  Center(
                                    child: SelectMatchInfoBtn(
                                      title: memberController.villageNm.value,
                                      listId: 2,
                                      callBack : (int? id, String? text){
                                        memberController.villageNm.value = text ?? "동네 선택";
                                        memberController.isVillageSelected.value = true;
                                      },isSelected : memberController.isVillageSelected.value
                                      ,containerWidth: 45.w,
                                    ),
                                  ),
                                ],
                              ),



                              SizedBox(height: 20,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [

                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        selectedGender = 0; // 남자를 선택
                                      });
                                    },
                                    child: Container(
                                      width: 45.w,
                                      height: 5.h,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          width: 1.5,
                                          color: selectedGender == 0 ? Colors.orange : Colors.grey,
                                        ),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Center(
                                        child: Text(
                                          '남성',
                                          style: TextStyle(
                                            fontSize: 18,
                                            color: selectedGender == 0 ? Colors.white : Colors.grey,
                                            fontWeight: selectedGender == 0 ? FontWeight.w900 : FontWeight.w700,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),


                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        selectedGender = 1; // 여자를 선택
                                      });
                                    },
                                    child: Container(
                                      width: 45.w,
                                      height: 5.h,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          width: 1.5,
                                          color: selectedGender == 1 ? Colors.orange : Colors.grey,
                                        ),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Center(
                                        child: Text(
                                          '여성',
                                          style: TextStyle(
                                            fontSize: 18,
                                            color: selectedGender == 1 ? Colors.white : Colors.grey,
                                            fontWeight: selectedGender == 0 ? FontWeight.w900 : FontWeight.w700,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 20,),
                            ],
                          ),
                        ),

                        GestureDetector(
                          onTap: () async {
                            String memberNickName = memberController.nickNmTextEdController.text;
                            String memberBirth = memberController.birthTextEdController.text;
                            String introduction = memberController.introductionTextEdController.text;
                            String memberGender = selectedGender == 0? "M" : "F";

                            Map<String, String> requestMap = {
                              'memberNickName' : memberNickName,
                              'memberBirth': memberBirth,
                              'memberIntroduction': introduction,
                              'memberGender': memberGender,
                            };

                            bool isUpdate = await memberController.fnSetMemberInfo(requestMap);
                            if (_imageBytes != null && isUpdate){
                              isUpdate = await memberController.fnSetMemberProfileImg(filePickerResult,_imageBytes!);
                            }

                            if(isUpdate) {
                              await memberController.fnGetProfileInfo();
                              Get.back();
                            } else {
                              print('경고 토스트 생성할 곳');
                            }
                          },
                          child: Container(
                            width: 100.w,
                            height: 50,
                            decoration: BoxDecoration(
                              border: Border.all(width: 1.5,color: Colors.grey),
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                              child: Text(
                                '완료',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                    letterSpacing: 0.5),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            );
          }
        ),
      );
  }
}
