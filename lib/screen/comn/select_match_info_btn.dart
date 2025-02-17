import 'package:badboys/modal/select_bottom_modal_screen.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SelectMatchInfoBtn extends StatefulWidget {
  const SelectMatchInfoBtn({
    super.key,
    required this.title,
    required this.listId,
    required this.callBack,
  });

  final String? title;
  final int? listId;
  final Function callBack;

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
                  child: SelectBottomModalScreen(selectItemIdx : 1, selectItemList : selectItemList, callBack : (int? id, String text)=>{
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
            } else if(widget.listId == 3) {
              List<String> selectItemList = ['남자만','여자만','상관없음'];

              return Container(
                height: 40.h,
                  child: SelectBottomModalScreen(selectItemIdx :2, selectItemList : selectItemList, callBack : (int? id, String text)=>{
                    widget.callBack(id,text),
              }));
            } else if(widget.listId == 4) {

              List<String> selectItemList = [
                '전체',
                '1000pts ~ 1100 pts',
                '1100pts ~ 1200 pts',
                '1200pts ~ 1300 pts',
                '1300pts ~ 1400 pts',
                '1400pts ~ 1500 pts',
                '1500pts ~ 1600 pts',
                '1600pts ~ 1700 pts',
                '1700pts ~ 1800 pts',
                '1800pts ~ 1900 pts',
                '1900pts ~ 2000 pts',
                '2000pts ~ 2100 pts',
                '2100pts ~ 2200 pts',
                '2200pts ~ 2300 pts',
                '2300pts ~ 2400 pts',
                '2400pts ~ 2500 pts',
                '2500pts ~ 2600 pts',
                '2600pts ~ 2700 pts',
                '2700pts ~ 2800 pts',
                '2800pts ~ 2900 pts',
                '2900pts ~ 3000 pts',
              ];

              return Container(
                  height: 40.h,
                  child: SelectBottomModalScreen(selectItemIdx :5, selectItemList : selectItemList, callBack : (int? id, String text)=>{
                    widget.callBack(id,text),
                  }));
            } else if(widget.listId == 5) {

            }

            return SelectBottomModalScreen(selectItemIdx : null, selectItemList: [], callBack : (int? id, String text)=>{

            });
          },
        );
      },
      child: Container(
        padding: EdgeInsets.only(
            left: 10, right: 10, top: 5, bottom: 5),
        decoration: BoxDecoration(
          color: Color(0xff333333),
          borderRadius: BorderRadius.circular(50),
          border:
          Border.all(color: Color(0xff333333), width: 2.5),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              '${widget.title}',
              style: TextStyle(
                color: Colors.white,
                fontSize: 13,
              ),
            ),
            Icon(
              Icons.arrow_drop_down_sharp,
              color: Colors.white,
              size: 15,
            ),
          ],
        ),
      ),
    );
  }
}
