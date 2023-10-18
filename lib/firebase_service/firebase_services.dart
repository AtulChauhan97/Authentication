

import 'package:authentication_project/controller/login_controller.dart';
import 'package:authentication_project/controller/task_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';



class Auth{

static final FirebaseAuth auth = FirebaseAuth.instance;
static final GoogleSignIn googleSignIn = GoogleSignIn();

static Future<void>  registerWithEmailAndPassword(String email, String password)async{

    await auth.createUserWithEmailAndPassword(email: email, password: password);

}

static Future<User?> loginWithEmailAndPassword(String email, String password)async{

  final UserCredential userCredential = await auth.signInWithEmailAndPassword(email: email, password: password);
   return userCredential.user;

}

static Future<void> signInWithGoogle() async {
  try {
    final GoogleSignInAccount? googleSignInAccount =
    await googleSignIn.signIn();
    final GoogleSignInAuthentication googleSignInAuthentication =
    await googleSignInAccount!.authentication;
    final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,);
     final UserCredential userCredential =await auth.signInWithCredential(credential);
     debugPrint(userCredential.user?.displayName);
     debugPrint(userCredential.user?.email);
     debugPrint(userCredential.user?.phoneNumber);

     if(userCredential !=null){
       TaskController.allTask();
     }
  } catch (error) {
    print(error);
  }
}

 static Future<void> signOutFromGoogle() async {
  await googleSignIn.signOut();
}

static Future<void> logOut()async{
 await auth.signOut();

}


static bool isLogIn(){

  if(auth.currentUser!= null){
    return true;
  }else{
    return false;
  }
}
}