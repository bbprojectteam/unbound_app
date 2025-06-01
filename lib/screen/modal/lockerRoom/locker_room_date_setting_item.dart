import 'package:badboys/screen/modal/comn/select_bottom_modal.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class LockerRoomDateSettingItem extends StatefulWidget {
  const LockerRoomDateSettingItem({
    super.key,
    required this.selectItem,
    required this.selectItemList,
    required this.containerWidth,
    required this.callBack,
  });

  final String selectItem;
  final List<String> selectItemList;
  final double containerWidth;
  final Function callBack;


  @override
  State<LockerRoomDateSettingItem> createState() => _LockerRoomDateSettingItemState();
}

class _LockerRoomDateSettingItemState extends State<LockerRoomDateSettingItem> {


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        showModalBottomSheet(
            context: context,
            builder: (BuildContext context) {
              return SizedBox(
                height: 40.h,
                child: SelectBottomModal(
                    selectItemIdx: int.parse(widget.selectItem),
                    selectItemList: widget.selectItemList,
                    callBack: (int? id, String text) => {
                      widget.callBack(id, text),
                    }),
              );
            });
      },
      child: Container(
        width: widget.containerWidth,
        height: 5.h,
        decoration: BoxDecoration(
          border: Border.all(
              color: Colors.orange,width: 1.5),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            widget.selectItem,
            style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontFamily: 'EHSMB'
            ),
          ),
        ),
      ),
    );
  }
}
