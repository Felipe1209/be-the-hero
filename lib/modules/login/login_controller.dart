import 'package:be_the_hero/modules/login/widgets/sign_up_error_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginController{

  void login({required String email, required String password, required BuildContext context}){
    FirebaseAuth auth = FirebaseAuth.instance;
    auth.signInWithEmailAndPassword(email: email, password: password)
        .then((value) => Navigator.pushReplacementNamed(context, '/ong-home'))
        .catchError((error){
      print(error);
      showDialog(
          context: context,
          builder: (context){
            return SignupErrorWidget(title: 'Erro no login', content: 'E-mail e/ou senha inválidos. Tente novamente.');
          }
      );
    });
  }
}