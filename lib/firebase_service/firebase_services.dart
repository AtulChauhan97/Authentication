

import 'package:firebase_auth/firebase_auth.dart';


class Auth{

static final FirebaseAuth auth = FirebaseAuth.instance;

static Future<void>  registerWithEmailAndPassword(String email, String password)async{

    await auth.createUserWithEmailAndPassword(email: email, password: password);

}

}