import 'package:badboys/screen/comn/custom_appbar_screen.dart';
import 'package:badboys/subScreen/report/report_drop_down_item.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ReportScreen extends StatefulWidget {
  const ReportScreen({super.key});

  @override
  State<ReportScreen> createState() => _ReportScreenState();
}

class _ReportScreenState extends State<ReportScreen> {
  late String? _selectedReason = null; // 선택한 신고 사유를 저장할 변수
  late String? _selectedMember = null; // 선택한 신고 멤버를 저장할 변수
  TextEditingController _reportController = TextEditingController(); // 신고 사유를 적는 텍스트 필드 컨트롤러

  late final List<String> _reportReasons = [
    '욕설 및 비하',
    '불법적인 콘텐츠',
    '스팸',
    '기타',
  ]; // 신고 사유 목록

  final List<String> _reportMembers = [
    '김원웅',
    '김원웅1',
    '김원웅2',
    '김원웅3',
    '김원웅4',
  ]; // 신고 사유 목록

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // 배경색을 검은색으로 설정
      body: Container(
        width: 100.w,
        height: 100.h,
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 40),
              CustomAppbarScreen(isNotification: true, ),

              SizedBox(height: 20),
              // 신고할 유저 선택 DropdownButton

              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  children: [
                    ReportDropDownItem(
                        selectedDropDownMenuItem: _selectedReason,
                        dropDownMenuInitTitle: "신고 사유를 선택하세요.",
                        dropDownMenuList: _reportReasons,
                        callBack: (selectedItem){
                          _selectedReason = selectedItem;
                          setState(() {});
                        },
                    ),
                    SizedBox(height: 20),

                    // 신고 사유 선택 DropdownButton
                    ReportDropDownItem(
                        selectedDropDownMenuItem: _selectedMember,
                        dropDownMenuInitTitle: "신고 할 유저를 선택해주세요.",
                        dropDownMenuList: _reportMembers,
                        callBack: (selectedItem){
                          _selectedMember = selectedItem;
                          setState(() {});

                        },
                    ),
                    SizedBox(height: 20),

                    // 신고 사유 입력 TextField
                    TextField(
                      controller: _reportController,
                      style: TextStyle(color: Colors.white), // 입력 텍스트를 흰색으로 설정
                      decoration: InputDecoration(
                        // labelText: '신고 사유 상세 내용',
                        labelStyle: TextStyle(color: Colors.white),
                        // 레이블 텍스트 흰색
                        border: OutlineInputBorder(),
                        hintText: '신고 사유를 구체적으로 작성해주세요.',
                        hintStyle: TextStyle(color: Colors.white), // 힌트 텍스트 흰색
                      ),
                      maxLines: 4,
                    ),
                    SizedBox(height: 20),
                    // 신고 버튼
                    ElevatedButton(
                      onPressed: () {
                        if (_selectedReason != null &&
                            _reportController.text.isNotEmpty) {
                          // 신고 처리 로직 추가
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('신고가 접수되었습니다.')),
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('신고 사유와 상세 내용을 입력해주세요.')),
                          );
                        }
                      },
                      child:
                          Text('신고하기', style: TextStyle(color: Colors.black,fontFamily: 'EHSMB')),
                      // 버튼 텍스트 흰색
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white, // 버튼 배경색을 파란색으로 설정
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
