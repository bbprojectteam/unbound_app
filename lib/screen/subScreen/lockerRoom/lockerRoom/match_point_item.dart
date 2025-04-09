import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';


class MatchPointItem extends StatefulWidget {
  const MatchPointItem({
    super.key,
    required this.matchPointText,
    required this.matchPointEditStatusYn,
    required this.containerWidth,

  });

  final String matchPointText;
  final String matchPointEditStatusYn;
  final double containerWidth;


  @override
  State<MatchPointItem> createState() => _MatchPointItemState();
}

class _MatchPointItemState extends State<MatchPointItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.containerWidth,
      height: 5.h,
      decoration: BoxDecoration(
        border: Border.all(color: widget.matchPointEditStatusYn == 'Y' ? Colors.orange : Colors.grey, width: 1.5),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: Text(
          '${widget.matchPointText}',
          style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontFamily: 'EHSMB'
          ),
        ),
      ),
    );
  }
}
