import 'package:authentication_project/controller/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

  LoginController loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
            child: Column(children: [
        Container(
            alignment: Alignment.bottomCenter,
            height: height * .25,
            width: width,
            decoration: BoxDecoration(
                color: Colors.blue.shade900,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(250),
                  bottomRight: Radius.circular(250),
                )),
            child: Padding(
              padding: const EdgeInsets.only(bottom: 22.0),
              child: TextButton(
                  onPressed: () {
                    loginController.login();
                  },
                  child: const Text(
                    "LOG IN",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  )),
            ),
        ),
        SizedBox(
            height: height * .05,
        ),
        Text(
            "SIGN UP",
            style: TextStyle(
                color: Colors.blue.shade800,
                fontSize: 30,
                fontWeight: FontWeight.bold),
        ),
        SizedBox(
            height: height * .10,
        ),
              emailArea(),
              SizedBox(
                height: height * .02,
              ),
              passwordArea(),
              SizedBox(
                height: height * .02,
              ),
              confirmPasswordArea(),
              SizedBox(
                height: height * .10,
              ),
              SizedBox(
                height: height*.06,
                width: width*.6,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.blue.shade900),
                    onPressed: () {
                      loginController.home();
                    },
                    child: const Text("SIGN UP",
                      style: TextStyle(color: Colors.white, fontSize: 20),)),
              ),
      ]),
          )
      ),
    );
  }

  Widget emailArea() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 21.0),
      child: TextFormField(
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
                borderSide: const BorderSide(color: Colors.black)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(50),
                borderSide: const BorderSide(color: Colors.black))),
      ),
    );
  }

  Widget passwordArea() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 21.0),
      child: TextFormField(
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
                borderSide: const BorderSide(color: Colors.black))),
      ),
    );
  }

  Widget confirmPasswordArea() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 21.0),
      child: TextFormField(
        decoration: InputDecoration(
            contentPadding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
            hintText: "Confirm password",
            filled: true,
            fillColor: Colors.white,
            prefixIcon: const Icon(
              Icons.lock,
              color: Colors.grey,
            ),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(40),
                borderSide: const BorderSide(color: Colors.black)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(40),
                borderSide: const BorderSide(color: Colors.black))),
      ),
    );
  }
}
