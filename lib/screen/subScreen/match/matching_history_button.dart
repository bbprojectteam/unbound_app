import 'package:badboys/router/app_bottom_modal_router.dart';
import 'package:flutter/material.dart';

class MatchingHistoryButton extends StatefulWidget {
  const MatchingHistoryButton({
    super.key,
  });


  @override
  State<MatchingHistoryButton> createState() => _MatchingHistoryButtonState();
}

class _MatchingHistoryButtonState extends State<MatchingHistoryButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:() async {
        AppBottomModalRouter.fnModalRouter(context,5);
      },
      child: Container(
        decoration: BoxDecoration(
            color: Colors.black,
            border: Border.all(width: 1.5,color: Colors.orange),
            borderRadius: BorderRadius.circular(10)
        ),
        child: Container(
          child: Center(
            child: Text(
              '내 매칭 리스트',
              style: TextStyle(
                  color: Colors.orange,
                  fontSize: 19,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'EHSMB'

              ),
            ),
          ),
        ),
      ),
    );
  }
}
