
import 'package:authentication_project/controller/login_controller.dart';
import 'package:authentication_project/firebase_service/firebase_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {

  void logOutUser() {
    Get.defaultDialog(
        title: "Alert",
        content: const Text("Do you want to logout here"),
        actions: [
          TextButton(
            onPressed: () {
              Get.back();
            },
            child: Text("No"),
          ),
          TextButton(
            onPressed: () {
              Auth.logOut();
              LoginController.login();
            },
            child: Text("Yes"),
          ),
        ]);
  }

}
