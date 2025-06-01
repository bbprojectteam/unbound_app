import 'package:daum_postcode_search/widget.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class DaumPostCodeSearchModal extends StatefulWidget {
  const DaumPostCodeSearchModal({
    super.key,
  });

  @override
  State<DaumPostCodeSearchModal> createState() => _DaumPostCodeSearchModalState();
}

class _DaumPostCodeSearchModalState extends State<DaumPostCodeSearchModal> {

  @override
  void initState() {
    super.initState();
  }

  bool _isError = false;
  String? errorMessage;

  @override
  Widget build(BuildContext context) {

    DaumPostcodeSearch daumPostcodeSearch = DaumPostcodeSearch(
      onConsoleMessage: (_, message) {
        print(message);
      },
      onLoadError: (controller, uri, errorCode, message) => setState(
            () {
          _isError = true;
          errorMessage = message;
        },
      ),
      onLoadHttpError: (controller, uri, errorCode, message) => setState(
            () {
          _isError = true;
          errorMessage = message;
        },
      ),
    );

    return Column(
      children: [
        SizedBox(
          height: 7.h,
        ),
        Expanded(
          child: daumPostcodeSearch,
        ),
        Visibility(
          visible: _isError,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(errorMessage ?? ""),
              ElevatedButton(
                child: Text("Refresh"),
                onPressed: () {
                  daumPostcodeSearch.controller?.reload();
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
