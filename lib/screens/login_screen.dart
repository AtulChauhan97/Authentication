import 'package:authentication_project/controller/login_controller.dart';
import 'package:authentication_project/controller/signup_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../firebase_service/firebase_services.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  SignUpController signUpController = Get.put(SignUpController());
  LoginController loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: height * .5,
                width: width,
                decoration: BoxDecoration(
                    color: Colors.blue.shade900,
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(250),
                      bottomRight: Radius.circular(250),
                    )),
                child: Column(
                  children: [
                    SizedBox(
                      height: height * 0.08,
                    ),
                    emailArea(),
                    SizedBox(
                      height: height * 0.02,
                    ),
                    passwordArea(),
                    SizedBox(
                      height: height * 0.15,
                    ),
                    SizedBox(
                      height: height * .06,
                      width: width * .6,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white),
                          onPressed: () {
                            loginController.loginAuth();
                            loginController.isLogin.value = true;
                          },
                          child: Obx(() => loginController.isLogin.value
                              ? const CircularProgressIndicator(
                                  backgroundColor: Colors.blue,
                                  color: Colors.white,
                                )
                              : Text(
                                  "LOG IN",
                                  style: TextStyle(
                                      color: Colors.blue.shade900,
                                      fontSize: 20),
                                ))),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: height * .06,
              ),
              const Text(
                "or",
                style: TextStyle(fontSize: 25),
              ),
              SizedBox(
                height: height * .08,
              ),
              TextButton(
                  onPressed: () {
                    signUpController.signup();
                  },
                  child: Text(
                    "SIGN UP",
                    style: TextStyle(
                        color: Colors.blue.shade900,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  )),
              const SizedBox(height: 10,),
              signInButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget emailArea() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 21.0),
      child: TextFormField(
        controller: loginController.emailController,
        decoration: InputDecoration(
            contentPadding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
            hintText: "Email",
            filled: true,
            fillColor: Colors.white,
            prefixIcon: const Icon(
              Icons.email,
              color: Colors.grey,
            ),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(50),
                borderSide: const BorderSide(color: Colors.white)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(50),
                borderSide: const BorderSide(color: Colors.white))),
      ),
    );
  }

  Widget passwordArea() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 21.0),
      child: TextFormField(
        controller: loginController.passwordController,
        decoration: InputDecoration(
            contentPadding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
            hintText: "Password",
            filled: true,
            fillColor: Colors.white,
            prefixIcon: const Icon(
              Icons.lock,
              color: Colors.grey,
            ),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(40),
                borderSide: const BorderSide(color: Colors.white)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(40),
                borderSide: const BorderSide(color: Colors.white))),
      ),
    );
  }

  Widget   signInButton() {
    return SizedBox(
      width: 280,
      height: 50,
      child: ElevatedButton(
        onPressed: () async{
         await Auth.signInWithGoogle();
        },
        child:  Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset('assets/ic_google_logo.png',height: 40,),
             const SizedBox(width: 5,),
             Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                'Login with Google',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.blue.shade900,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
