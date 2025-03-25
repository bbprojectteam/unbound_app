
import 'package:badboys/screen/subScreen/report/report_drop_down_item.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class InquiryWrtScreen extends StatefulWidget {
  const InquiryWrtScreen({super.key});

  @override
  State<InquiryWrtScreen> createState() => _InquiryWrtScreenState();
}

class _InquiryWrtScreenState extends State<InquiryWrtScreen> {
  late String? _selectedReason = null;
  TextEditingController _inquiryController = TextEditingController(); // 신고 사유를 적는 텍스트 필드 컨트롤러

  late final List<String> _inquiryReasons = [
    '문의 사유1',
    '문의 사유2',
    '문의 사유3',
    '문의 사유4',
  ]; // 문의 사유 목록

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.w,
      height: 100.h,
      color: Colors.black,
      child: Column(
        children: [
          SizedBox(height: 40,),
          // CustomAppbar(isNotification: true, ),

          Padding(
            padding: const EdgeInsets.only(left: 10,right: 10),
            child: Column(
              children: [
                ReportDropDownItem(
                  selectedDropDownMenuItem: _selectedReason ,
                  dropDownMenuInitTitle: '문의 사유를 선택하세요.',
                  dropDownMenuList: _inquiryReasons,
                  callBack: (selectedItem){
                    _selectedReason = selectedItem;
                    setState(() {});
                  },
                ),

                SizedBox(height: 20),

                // 신고 사유 입력 TextField
                TextField(
                  controller: _inquiryController,
                  style: TextStyle(color: Colors.white), // 입력 텍스트를 흰색으로 설정
                  decoration: InputDecoration(
                    labelStyle: TextStyle(color: Colors.white),
                    border: OutlineInputBorder(),
                    hintText: '문의 할 내용을 입력해주세요.',
                    hintStyle: TextStyle(color: Colors.white), // 힌트 텍스트 흰색
                  ),
                  maxLines: 4,
                ),
                SizedBox(height: 20),
                // 신고 버튼
                ElevatedButton(
                  onPressed: () {
                    if (_selectedReason != null &&
                        _inquiryController.text.isNotEmpty) {
                      // 신고 처리 로직 추가
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('문의가 접수되었습니다.')),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('문의 내용을 입력해주세요.')),
                      );
                    }
                  },
                  child: Text('완료', style: TextStyle(color: Colors.black)),
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
    );
  }
}
