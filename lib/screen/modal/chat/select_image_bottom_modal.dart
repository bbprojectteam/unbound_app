import 'dart:io';

import 'package:badboys/utils/helpers.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SelectImageBottomModal extends StatefulWidget {
  const SelectImageBottomModal({
    super.key,
    required this.callBack,
  });

  final Function callBack;

  @override
  State<SelectImageBottomModal> createState() => _SelectImageBottomModalState();
}

class _SelectImageBottomModalState extends State<SelectImageBottomModal> {
  final ImagePicker picker = ImagePicker();
  Uint8List? _imageBytes = null;
  late FilePickerResult filePickerResult;

  Future<void> pickImageFromCamera() async {
    final XFile? photo = await picker.pickImage(source: ImageSource.camera);
    if (photo != null) {
      Uint8List? croppedImage = await Helpers.cropImage(photo.path);

      if (croppedImage != null) {
        filePickerResult = await Helpers.convertUint8ListToFilePickerResult(
          croppedImage,
          croppedImage.lengthInBytes,
        );

        setState(() {
          _imageBytes = croppedImage;
        });
      } else {
        print("이미지를 자르는 중 문제가 발생했습니다.");
      }

    }
    return null;
  }

  Future<void> _pickImage() async {
    try {

      final XFile? image = await picker.pickImage(source: ImageSource.gallery);

      if (image != null) {

        Uint8List? croppedImage = await Helpers.cropImage(image.path);

        if (croppedImage != null) {
          filePickerResult = await Helpers.convertUint8ListToFilePickerResult(
            croppedImage,
            croppedImage.lengthInBytes,
          );

          setState(() {
            _imageBytes = croppedImage;
          });
        } else {
          print("이미지를 자르는 중 문제가 발생했습니다.");
        }
      } else {
        print("이미지가 선택되지 않았습니다.");
      }
    } catch (e) {
      print("이미지 선택 또는 처리 중 오류 발생: $e");
    }
  }

  @override
  Widget build(BuildContext context) {


    return Container(
      width: 100.w,
      height: 20.h,
      color: Colors.black87,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () async {
                 await pickImageFromCamera();
                 await widget.callBack(_imageBytes);
                 Navigator.pop(context);
                },
                  child: Icon(
                    Icons.camera_alt_outlined,
                    size: 23.w,
                    color: Colors.white,)
              ),
              Text('카메라',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'EHSMB',
                ),
              ),
            ],
          ),

          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                  onTap: () async {
                    await _pickImage();
                    await widget.callBack(_imageBytes);
                    Navigator.pop(context);
                  },
                  child: Icon(Icons.image,size: 23.w,color: Colors.white,)),
              Text('이미지',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'EHSMB'
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
