import 'package:badboys/controller/auth_controller.dart';
import 'package:badboys/controller/member_controller.dart';
import 'package:badboys/screen/comn/custom_appbar_screen.dart';
import 'package:badboys/subScreen/register/profile_setting_text_field.dart';
import 'package:badboys/utils/helpers.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ProfileSettingScreen extends StatefulWidget {
  const ProfileSettingScreen({super.key});

  @override
  State<ProfileSettingScreen> createState() => _ProfileSettingScreenState();
}

class _ProfileSettingScreenState extends State<ProfileSettingScreen> {
  final TextEditingController nickNmTextEdController = TextEditingController();
  final TextEditingController birthTextEdController = TextEditingController();
  late int? selectedGender = 0;
  Uint8List? _imageBytes = null;
  late FilePickerResult filePickerResult;

  @override
  Widget build(BuildContext context) {

    final MemberController memberController = Get.find<MemberController>();

    Future<void> _pickImage() async {

      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.image, // 이미지 파일만 선택
      );

      if (result != null && result.files.isNotEmpty) {
        _imageBytes = await Helpers.cropImage(result.files.first.path!);

        filePickerResult = await Helpers.convertUint8ListToFilePickerResult(
            _imageBytes!, result.files.first.size
        );

        setState(() {});

      }
    }


    return
      Scaffold(
        body: Container(
          width: 100.w,
          height: 100.h,
          decoration: BoxDecoration(
           color: Colors.black,
          ),

          child: Stack(
            children: [

              // Image.asset(
              //   'assets/images/intro.png',
              //   width: 100.w,
              //   height: 70.h,
              //   fit: BoxFit.cover,
              // ),

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
                        fontStyle: FontStyle.italic
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


                    Container(
                      width: 30.w,
                      // height: 30.h,
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
                            ): Icon(
                          Icons.account_circle_sharp,
                          color: Colors.white,
                          size: 30.w,
                        ),
                      ),
                    ),

                    SizedBox(height: 10,),


                    Container(
                      width: 100.w,
                      child: Column(
                        children: [
                          ProfileSettingTextField(labelText: "닉네임",textEditingController: nickNmTextEdController),
                          ProfileSettingTextField(labelText: "생년월일",textEditingController: birthTextEdController),

                          SizedBox(height: 20,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          // 남자 버튼
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedGender = 0; // 남자를 선택
                              });
                            },
                            child: Container(
                              width: 45.w,
                              height: 7.h,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  width: 1,
                                  color: selectedGender == 0 ? Colors.blue : Colors.white,
                                ),
                                borderRadius: BorderRadius.circular(10),
                                color: selectedGender == 0 ? Colors.blue.shade700 : Colors.transparent,
                              ),
                              child: Center(
                                child: Text(
                                  '남자',
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: selectedGender == 0 ? Colors.white : Colors.white70,
                                    fontWeight: selectedGender == 0 ? FontWeight.w900 : FontWeight.w700,
                                  ),
                                ),
                              ),
                            ),
                          ),

                          // 여자 버튼
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedGender = 1; // 여자를 선택
                              });
                            },
                            child: Container(
                              width: 45.w,
                              height: 7.h,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  width: 1,
                                  color: selectedGender == 1 ? Colors.pink : Colors.white,
                                ),
                                borderRadius: BorderRadius.circular(10),
                                color: selectedGender == 1 ? Colors.pink.shade700 : Colors.transparent,
                              ),
                              child: Center(
                                child: Text(
                                  '여자',
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: selectedGender == 1 ? Colors.white : Colors.white70,
                                    fontWeight: selectedGender == 0 ? FontWeight.w900 : FontWeight.w700,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),

                          SizedBox(height: 20,),
                          GestureDetector(
                            onTap: (){

                            },
                            child: Container(
                              width: 95.w,
                              height: 5.h,
                              decoration: BoxDecoration(
                                border: Border.all(width: 0.5,color: Colors.white),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Center(
                                child: Text(
                                    '지역 선택',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 17,
                                    fontWeight: FontWeight.w500
                                  ),
                                ),
                              ),
                            ),
                          ),


                          SizedBox(height: 20,),


                          Container(
                            width: 100.w,
                            child: ElevatedButton(
                                style: ButtonStyle(
                                  backgroundColor: WidgetStateProperty.all(Colors.transparent), // 버튼 배경을 투명으로 설정
                                  shadowColor: WidgetStateProperty.all(Colors.transparent), // 그림자 제거
                                  shape: WidgetStateProperty.all(RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8), // 둥근 모서리 설정
                                  )),
                                ),
                                onPressed: () async {


                                  String memberNickName = nickNmTextEdController.text;
                                  String memberBirth = birthTextEdController.text;
                                  String memberGender = selectedGender == 0? "M" : "F";

                                  bool isUpdate = await memberController.fnSetMemberInfo(memberNickName,memberBirth,memberGender);
                                  bool isInsert = await memberController.fnSetMemberProfileImg(filePickerResult,_imageBytes!);
                                  if(isUpdate && isInsert) {
                                    Get.toNamed('/');
                                  } else {
                                    print('토스트 생성할 곳');
                                  }

                                },
                                child: Container(
                                  width: 100.w,
                                  height: 50,
                                  decoration: BoxDecoration(
                                    border: Border.all(width: 3,color: Colors.black12),
                                    gradient: LinearGradient(
                                      colors: [Colors.black, Colors.grey], // 그라데이션 색상
                                      begin: Alignment.topLeft,  // 그라데이션 시작 방향
                                      end: Alignment.bottomRight, // 그라데이션 끝 방향
                                    ),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Center(
                                    child: Text(
                                      '저장',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w700,
                                          letterSpacing: 0.5),
                                    ),
                                  ),
                                )
                            ),
                          )
                        ],
                      ),
                    )

                  ],
                ),
              ),
            ],
          ),
        ),
      );
  }
}
