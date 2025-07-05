import 'package:badboys/auth/auth_service.dart';
import 'package:badboys/controller/global_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class LogoutButton extends StatefulWidget {
  const LogoutButton({super.key});

  @override
  State<LogoutButton> createState() => _LogoutButtonState();
}

class _LogoutButtonState extends State<LogoutButton> {

  late GlobalController globalController;

  @override
  void initState() {
    super.initState();
    globalController = Get.find<GlobalController>();
  }

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: () async {
        AuthService _authService = AuthService();
        globalController.bottomNavigatorIndex.value = 0;
        await _authService.signOut();
        Get.toNamed('/splash');
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
              '로그아웃',
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
