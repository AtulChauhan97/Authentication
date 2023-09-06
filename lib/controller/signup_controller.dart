
import 'package:authentication_project/screens/home_screen.dart';
import 'package:authentication_project/screens/signup_screen.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController{

  void signup(){
    Get.off(const SignUpScreen());
  }

  void home(){
    Get.off(const HomeScreen());
  }


}