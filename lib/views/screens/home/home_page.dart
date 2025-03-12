import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:revision_firebase_app/routes/routes.dart';
import 'package:revision_firebase_app/services/auth_service.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
        actions: [
          IconButton(
            onPressed: () async {
              log("Btn is clicked...");
              await AuthService.authService.logout().then((value) {
                Get.offNamed(Routes.login);
              },);
            },
            icon: Icon(Icons.logout),
          )
        ],
      ),
    );
  }
}
