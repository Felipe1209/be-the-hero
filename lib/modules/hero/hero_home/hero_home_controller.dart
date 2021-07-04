import 'package:be_the_hero/modules/shared/models/case_model.dart';
import 'package:be_the_hero/modules/shared/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mobx/mobx.dart';
import 'hero_home_state.dart';

part 'hero_home_controller.g.dart';

class HeroHomeController = _HeroHomeControllerBase with _$HeroHomeController;

abstract class _HeroHomeControllerBase with Store{
  FirebaseAuth auth = FirebaseAuth.instance;
  List<CaseModel> caseList = [];
  List<UserModel> ongList = [];

  @observable
  HeroHomeState state = HeroHomeStateEmpty();

  @action
  loadCases() async{
    try{
      state = HeroHomeStateLoading();
      await getCases();
      state = HeroHomeStateSuccess(cases: caseList);
    }catch(e){
      state = HeroHomeStateFailure(message: e.toString());
    }
  }

  getCases() async{
    CollectionReference cases = FirebaseFirestore.instance.collection('cases');
    CollectionReference users = FirebaseFirestore.instance.collection('users');

    QuerySnapshot snapshot = await cases.get();
    for(var item in snapshot.docs){
      Map<String, dynamic> data = item.data() as Map<String, dynamic>;
      data['id'] = item.id;
      caseList.add(CaseModel.fromMap(data));
    }

    for(var item in caseList){
      DocumentSnapshot snapshot = await users.doc(item.ongId).get();
      Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;
      ongList.add(UserModel.fromMap(data)) ;
    }
  }
}