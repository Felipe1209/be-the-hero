import 'package:be_the_hero/modules/ong/ong_home/ong_home_state.dart';
import 'package:be_the_hero/modules/shared/models/case_model.dart';
import 'package:be_the_hero/modules/shared/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'ong_home_controller.g.dart';

class OngHomeController = _OngHomeControllerBase with _$OngHomeController;

abstract class _OngHomeControllerBase with Store{
  FirebaseAuth auth = FirebaseAuth.instance;
  List<CaseModel> casesList = [];
  late UserModel user;

  @observable
  OngHomeState state = OngHomeStateEmpty();

  @action
  getCases() async{
    try{
      state = OngHomeStateLoading();
      casesList.clear();
      await getUserData();
      await getDocs();
      state = OngHomeStateSuccess(cases: casesList);
    }catch(e){
      state = OngHomeStateFailure(message: e.toString());
    }

  }

  getUserData() async{
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    DocumentSnapshot snapshot = await users.doc('${auth.currentUser!.uid}').get();
    Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;
    user = UserModel.fromMap(data);
  }

  getDocs() async{
    CollectionReference cases = FirebaseFirestore.instance.collection('cases');
    QuerySnapshot snapshot = await cases.where('ong_id', isEqualTo: auth.currentUser!.uid).get();
    for(var item in snapshot.docs){
      Map<String, dynamic> data = item.data() as Map<String, dynamic>;
      data['id'] = item.id;
      CaseModel caseModel = CaseModel.fromMap(data);
      casesList.add(caseModel);
    }
  }

  Future deleteCase({required int position}) async{
    CollectionReference cases = FirebaseFirestore.instance.collection('cases');
    await cases
        .doc('${casesList[position].id}')
        .delete()
        .then((value) => print("Case Deleted"))
        .catchError((error) => print("Failed to delete case: $error"));
    getCases();
  }

  signOut(BuildContext context){
    auth.signOut();
    Navigator.pushReplacementNamed(context, '/login');
  }

}