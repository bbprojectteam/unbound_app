import 'package:badboys/modal/select_bottom_modal_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SelectMatchInfoBtn extends StatefulWidget {
  const SelectMatchInfoBtn({
    super.key,
    required this.title,
    required this.listId,
    required this.callBack,
    required this.isSelected,
    required this.containerWidth,
  });

  final String? title;
  final int? listId;
  final Function callBack;
  final bool isSelected;
  final double containerWidth;

  @override
  State<SelectMatchInfoBtn> createState() => _SelectMatchInfoBtnState();
}

class _SelectMatchInfoBtnState extends State<SelectMatchInfoBtn> {
  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          context: context,
          builder: (BuildContext context) {

            if(widget.listId == 1) {
              List<String> selectItemList = [
                '서울특별시',
                '대전광역시',
                '양산시',
                '익산시',
                '부산광역시',
                '진주시',
                '인천광역시',
                '대구광역시',
                '광주광역시',
                '울산광역시',
                '천안시',
                '수원시',
                '성남시',
                '창원시',
                '포항시',
                '김해시',
                '안산시',
                '구미시',
                '전주시',
                '동탄시',
              ];

              return Container(
                height: 40.h,
                  child: SelectBottomModalScreen(selectItemIdx : 1, selectItemList : selectItemList, callBack : (int? id, String? text)=>{
                    widget.callBack(id,text),
                  }));

            } else if(widget.listId == 2) {
              List<String> selectItemList = [
                '강남구', '강동구', '강북구', '강서구', '관악구',
                '광진구', '구로구', '금천구', '노원구', '도봉구',
                '동대문구', '동작구', '마포구', '서대문구', '서초구',
                '성동구', '성북구', '송파구', '양천구', '영등포구'
              ];

              return Container(
                  height: 40.h,
                  child: SelectBottomModalScreen(selectItemIdx : 15, selectItemList : selectItemList,  callBack : (int? id, String text)=>{
                    widget.callBack(id,text),
                  }));
            }

            return SelectBottomModalScreen(selectItemIdx : null, selectItemList: [], callBack : (int? id, String text)=>{

            },);
          },
        );
      },
      child: Container(
            width: widget.containerWidth,
            height: 6.h,
            decoration: BoxDecoration(
              color: Colors.black,
              border: Border.all(color: widget.isSelected ? Colors.orange : Colors.grey, width: 1.5),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: Text('${widget.title}',
                style: TextStyle(
                    fontSize: 16.5,
                    color: widget.isSelected ? Colors.orange : Colors.grey,
                    fontFamily: 'EHSMB'
                ),
              ),
            ),
          ),
      );

  }
}
