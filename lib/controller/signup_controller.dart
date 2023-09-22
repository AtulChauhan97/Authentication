
import 'package:authentication_project/screens/home_screen.dart';
import 'package:authentication_project/screens/signup_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:authentication_project/firebase_service/firebase_services.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController{

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();


  void auth(){

    String email = emailController.text.toString();
    String password = passwordController.text.toString();
    String confirmPassword = confirmPasswordController.text.toString();
    Auth.registerWithEmailAndPassword(email, password);

  }


  void signup(){
    Get.off(const SignUpScreen());
  }

  void home(){
    Get.off(const HomeScreen());
  }

  }

