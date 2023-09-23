

import 'package:firebase_auth/firebase_auth.dart';


class Auth{

static final FirebaseAuth auth = FirebaseAuth.instance;

static Future<void>  registerWithEmailAndPassword(String email, String password)async{

    await auth.createUserWithEmailAndPassword(email: email, password: password);

}

static Future<User?> loginWithEmailAndPassword(String email, String password)async{

  final UserCredential userCredential = await auth.signInWithEmailAndPassword(email: email, password: password);
   return userCredential.user;

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