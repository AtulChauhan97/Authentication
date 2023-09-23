
import 'package:authentication_project/firebase_service/firebase_services.dart';
import 'package:authentication_project/screens/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../screens/home_screen.dart';

class LoginController extends GetxController{

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

static void login(){
  Get.off(const LoginScreen());
}


static void home(){
  Get.off(const HomeScreen());
}

 void loginAuth()async{
  String email = emailController.text.toString();
  String password = passwordController.text.toString();

   User? user = await Auth.loginWithEmailAndPassword(email, password);

   if(user!= null){
     home();
   }
}

}
