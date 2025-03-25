import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:responsive_sizer/responsive_sizer.dart';


class SelectLocaleBottomModal extends StatefulWidget {
  const SelectLocaleBottomModal({super.key});

  @override
  State<SelectLocaleBottomModal> createState() => _SelectLocaleBottomModalState();
}

class _SelectLocaleBottomModalState extends State<SelectLocaleBottomModal> {

  late InAppWebViewController? _webViewController;

  @override
  Widget build(BuildContext context) {


    return Container(
      width: 100.w,
      height: 90.h,
      color: Colors.black,
      child: InAppWebView(
        initialUrlRequest: URLRequest( url: Uri.parse("assets/html/map.html")),
        onWebViewCreated: (InAppWebViewController controller) {
          _webViewController = controller;
        },
        initialOptions: InAppWebViewGroupOptions(
          crossPlatform: InAppWebViewOptions(
            javaScriptEnabled: true, // JavaScript 허용
          ),
        ),
        onLoadHttpError: (controller, url, statusCode, description) {
          print("HTTP Error: $description (Code: $statusCode)");  // HTTP 오류 확인
        },
        // console.log 메시지를 받을 때 호출되는 콜백
        onConsoleMessage: (controller, consoleMessage) {
          // 콘솔 메시지에서 전달된 정보를 Flutter에서 사용
          String address = consoleMessage.message;
          print("선택한 주소: $address");
        },
      ),
    );
  }
}
