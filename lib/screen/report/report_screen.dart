import 'package:badboys/screen/comn/custom_appbar_screen.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ReportScreen extends StatefulWidget {
  const ReportScreen({super.key});

  @override
  State<ReportScreen> createState() => _ReportScreenState();
}

class _ReportScreenState extends State<ReportScreen> {
  String? _selectedReason; // 선택한 신고 사유를 저장할 변수
  String? _selectedMember; // 선택한 신고 사유를 저장할 변수
  TextEditingController _reportController = TextEditingController(); // 신고 사유를 적는 텍스트 필드 컨트롤러

  final List<String> _reportReasons = [
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
              CustomAppbarScreen(isNotification: true, isListMenu: false),

              SizedBox(height: 20),
              // 신고할 유저 선택 DropdownButton

              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  children: [
                    DropdownButton<String>(
                      value: _selectedMember,
                      hint: Text(
                        '신고 할 유저를 선택해주세요.',
                        style: TextStyle(color: Colors.white), // 흰색 텍스트
                      ),
                      isExpanded: true,
                      dropdownColor: Colors.black, // 드롭다운 배경색을 검은색으로 설정
                      items: _reportMembers.map((String member) {
                        return DropdownMenuItem<String>(
                          value: member,
                          child: Text(
                            member,
                            style: TextStyle(color: Colors.white), // 흰색 텍스트
                          ),
                        );
                      }).toList(),
                      onChanged: (newValue) {
                        setState(() {
                          _selectedMember = newValue;
                        });
                      },
                    ),
                    SizedBox(height: 20),
                    // 신고 사유 선택 DropdownButton
                    DropdownButton<String>(
                      value: _selectedReason,
                      hint: Text(
                        '신고 사유를 선택하세요',
                        style: TextStyle(color: Colors.white), // 흰색 텍스트
                      ),
                      isExpanded: true,
                      dropdownColor: Colors.black, // 드롭다운 배경색을 검은색으로 설정
                      items: _reportReasons.map((String reason) {
                        return DropdownMenuItem<String>(
                          value: reason,
                          child: Text(
                            reason,
                            style: TextStyle(color: Colors.white), // 흰색 텍스트
                          ),
                        );
                      }).toList(),
                      onChanged: (newValue) {
                        setState(() {
                          _selectedReason = newValue;
                        });
                      },
                    ),
                    SizedBox(height: 20),
                    // 신고 사유 입력 TextField
                    TextField(
                      controller: _reportController,
                      style: TextStyle(color: Colors.white), // 입력 텍스트를 흰색으로 설정
                      decoration: InputDecoration(
                        // labelText: '신고 사유 상세 내용',
                        labelStyle: TextStyle(color: Colors.white), // 레이블 텍스트 흰색
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
                        if (_selectedReason != null && _reportController.text.isNotEmpty) {
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
                      child: Text('신고하기', style: TextStyle(color: Colors.black)), // 버튼 텍스트 흰색
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
