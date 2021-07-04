import 'package:be_the_hero/modules/login/widgets/sign_up_error_widget.dart';
import 'package:be_the_hero/modules/shared/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignUpController{

  void signUp ({required UserModel user, required String password, required BuildContext context}) async{
    try{
      UserCredential result = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: user.email, password: password);
      CollectionReference users = FirebaseFirestore.instance.collection('users');
        users.doc(result.user!.uid).set({
          'name': user.name,
          'email' : user.email,
          'phone': user.phone,
          'city' : user.city,
          'state' : user.state
        });
      Navigator.pushReplacementNamed(context, '/ong-home');
    } on FirebaseAuthException catch (e) {
      if(e.code == 'email-already-in-use'){
        showDialog(
            context: context,
            builder: (context){
              return SignupErrorWidget(title: 'Erro no cadastro', content: 'Já existe uma conta cadastrada com este e-mail.');
            }
        );
      } else {
        showDialog(
            context: context,
            builder: (context){
              return SignupErrorWidget(title: 'Erro no cadastro', content: 'Houve um erro. Por gentileza, reinicie o app e tente novamente.');
            }
        );
      }
    }
  }


}