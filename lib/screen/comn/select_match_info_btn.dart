import 'package:badboys/modal/select_bottom_modal_screen.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SelectMatchInfoBtn extends StatelessWidget {
  const SelectMatchInfoBtn({
    super.key,
    required this.title,
    required this.listId,
  });

  final String? title;
  final int? listId;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          context: context,
          builder: (BuildContext context) {

            if(listId == 1) {
              List<String> firstItemList = ['서울', '대전', '양산', '익산', '부산', '진주', '인천', '대구', '광주', '울산', '천안', '수원', '성남', '창원', '포항', '김해', '안산', '구미', '전주', '동탄'];
              List<String> secondItemList = [
                '강남구', '강동구', '강북구', '강서구', '관악구', '광진구', '구로구', '금천구',
                '노원구', '도봉구', '동대문구', '동작구', '마포구', '서대문구', '서초구', '성동구',
                '성북구', '송파구', '양천구', '영등포구'
              ];

            return SelectBottomModalScreen(firstSelectIdx : 1, secondSelectIdx : 2,firstItemList : firstItemList, secondItemList: secondItemList,);
            } else if(listId == 2) {
              List<String> firstItemList = ['남자','여자'];
              return SelectBottomModalScreen(firstSelectIdx : 1, secondSelectIdx : 2,firstItemList : firstItemList,secondItemList: [],);
            } else if(listId == 3) {
              return SelectBottomModalScreen(firstSelectIdx : 1, secondSelectIdx : null,firstItemList : [],secondItemList: [],);
            } else if(listId == 4) {
              return SelectBottomModalScreen(firstSelectIdx : 1, secondSelectIdx : null,firstItemList : [],secondItemList: [],);
            }

            return SelectBottomModalScreen(firstSelectIdx : null, secondSelectIdx : null,firstItemList: [],secondItemList: [],);
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
              '$title',
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
