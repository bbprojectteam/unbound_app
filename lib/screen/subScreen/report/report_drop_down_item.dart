import 'package:flutter/material.dart';

class ReportDropDownItem extends StatefulWidget {
  const ReportDropDownItem({
    super.key,
    required this.dropDownMenuInitTitle,
    required this.dropDownMenuList,
    required this.selectedDropDownMenuItem,
    required this.callBack
  });

  final String? dropDownMenuInitTitle;
  final List<String> dropDownMenuList;
  final String? selectedDropDownMenuItem;
  final Function callBack;

  @override
  State<ReportDropDownItem> createState() => _ReportDropDownItemState();
}

class _ReportDropDownItemState extends State<ReportDropDownItem> {
  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: widget.selectedDropDownMenuItem,
      hint: Text(
        widget.dropDownMenuInitTitle!,
        style: TextStyle(color: Colors.white), // 흰색 텍스트
      ),
      isExpanded: true,
      dropdownColor: Colors.black, // 드롭다운 배경색을 검은색으로 설정
      items: widget.dropDownMenuList.map((String member) {
        return DropdownMenuItem<String>(
          value: member,
          child: Text(
            member,
            style: TextStyle(color: Colors.white), // 흰색 텍스트
          ),
        );
      }).toList(),
      onChanged: (newValue) {
        widget.callBack(newValue);
      },
    );
  }
}
