import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:revision_firebase_app/routes/routes.dart';
import 'package:revision_firebase_app/services/auth_service.dart';

class Splash extends StatelessWidget {
  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 2), () {
      log("Current User : ${AuthService.authService.currentUser}");
      (AuthService.authService.currentUser!=null) ?  Get.offNamed(Routes.home) :  Get.offNamed(Routes.login);
    });
    return Scaffold(
      body: Center(
        child: Text("Splash Screen"),
      ),
    );
  }
}
