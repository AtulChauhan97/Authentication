
import 'package:authentication_project/screens/login_screen.dart';
import 'package:get/get.dart';

import '../screens/home_screen.dart';

class LoginController extends GetxController{

  void login(){
    Get.off(const LoginScreen());
  }


  void home(){
    Get.off(const HomeScreen());
  }
}