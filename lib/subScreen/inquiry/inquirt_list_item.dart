import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class InquirtListItem extends StatefulWidget {
  const InquirtListItem({
    super.key,
    required this.inquiryTitle,
    required this.inquiryDetails,  // 상세 내용 추가
    required this.isInquiryCd,
  });

  final String? inquiryTitle;
  final String? inquiryDetails;  // 상세 내용을 받기 위한 추가 변수
  final int? isInquiryCd;  // 상세 내용을 받기 위한 추가 변수

  @override
  State<InquirtListItem> createState() => _InquirtListItemState();
}

class _InquirtListItemState extends State<InquirtListItem> {
  bool _isExpanded = false;  // 컨테이너가 확장되었는지 여부를 추적
  bool _isContentVisible = false;  // 애니메이션 후 콘텐츠를 보여줄지 여부

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _isExpanded = !_isExpanded;  // 탭 시 확장 상태 토글
        });
        if (_isExpanded) {
          // 애니메이션이 끝난 후에 콘텐츠를 보이게 하려면 일정 시간 딜레이
          Future.delayed(Duration(milliseconds: 300), () {
            setState(() {
              _isContentVisible = true;
            });
          });
        } else {
          setState(() {
            _isContentVisible = false;
          });
        }
      },
      child: Container(
        width: 100.w,
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(width: 1.3, color: Colors.grey), // 아래쪽 테두리
          ),
        ),
        child: Column(
          children: [
            // 상단 고정 영역 (Inquiry Title)
            Container(
              width: 100.w,
              height: 7.h,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          'assets/images/intro.png',
                          width: 40,
                          height: 40,
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(width: 10),
                      Container(
                        width: 57.w,
                        child: Text(
                          widget.inquiryTitle!,
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 17,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                    ],
                  ),
                  if(widget.isInquiryCd != null)...[
                    Text(
                      widget.isInquiryCd == 1 ? '답변완료' : '확인중',
                      style: TextStyle(
                        color: widget.isInquiryCd == 1 ? Colors.grey : Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 15,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],

                  Icon(
                    _isExpanded
                        ? Icons.keyboard_arrow_up
                        : Icons.keyboard_arrow_down, // 확장/축소 상태에 따라 아이콘 변경
                    size: 40,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
            // 확장/축소되는 영역 (내용)
            AnimatedContainer(
              duration: Duration(milliseconds: 300), // 애니메이션 지속 시간
              curve: Curves.easeInOut, // 애니메이션 곡선
              width: 100.w,
              height: _isExpanded ? 20.h : 0, // 확장/축소되는 높이
              padding: EdgeInsets.all(10),
              child: _isExpanded && _isContentVisible
                  ? Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '문의 내용',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(height: 5,),
                  Text(
                    '매칭이 잘 안되는 거 같아요.',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(height: 20,),

                  Container(
                    width: 98.w,
                    height: 1,
                    color: Colors.white,
                  ),
                  SizedBox(height: 20,),
                  Text(
                    '답변',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Text(
                    widget.inquiryDetails!,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),

                ],
              )
                  : SizedBox.shrink(), // 축소 상태에서는 아무것도 보이지 않음
            ),
          ],
        ),
      ),
    );
  }
}
