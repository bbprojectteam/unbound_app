import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SelectBottomModalList extends StatefulWidget {
  const SelectBottomModalList({
    super.key,
    required this.itemList,
    required this.selectItemIdx,
    required this.callBack,
  });

  final List<dynamic> itemList;
  final int? selectItemIdx;
  final Function(int) callBack;

  @override
  State<SelectBottomModalList> createState() => _SelectBottomModalListState();
}

class _SelectBottomModalListState extends State<SelectBottomModalList> {
  late int selectedItemIdx;
  late FixedExtentScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    // 초기 인덱스를 설정
    selectedItemIdx = widget.selectItemIdx ?? 0;
    _scrollController = FixedExtentScrollController(initialItem: selectedItemIdx);
  }

  @override
  void dispose() {
    _scrollController.dispose(); // 컨트롤러 리소스 해제
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPicker(
      itemExtent: 5.h,
      diameterRatio: 100.0,
      selectionOverlay: null, // 선택 오버레이 제거
      scrollController: _scrollController, // 스크롤 컨트롤러 추가
      onSelectedItemChanged: (int index) {
        setState(() {
          selectedItemIdx = index;
        });
        widget.callBack(index);
      },
      children: List.generate(widget.itemList.length, (index) {
        return Container(
          margin: EdgeInsets.symmetric(vertical: 5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(7),
            color: selectedItemIdx == index ? Color(0x33ffffff) : Colors.transparent,
          ),
          child: Center(
            child: Text(
              widget.itemList[index],
              style: TextStyle(
                fontSize: 19, // 텍스트 크기를 조금 더 크게
                fontWeight: FontWeight.w700,
                color: selectedItemIdx == index
                    ? Colors.white // 선택된 항목은 흰색 텍스트
                    : Colors.white, // 선택되지 않은 항목은 검정색 텍스트
              ),
            ),
          ),
        );
      }),
    );
  }
}
