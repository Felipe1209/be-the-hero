
import 'package:be_the_hero/modules/shared/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class CreateCaseController{
  FirebaseAuth auth = FirebaseAuth.instance;
  late UserModel user;

  saveCase({required String name, required String description, required String value}) async{
    CollectionReference cases = FirebaseFirestore.instance.collection('cases');
    await cases.add({
      'ong_id' : auth.currentUser!.uid,
      'ong_name' : user.name,
      'name' : name,
      'description' : description,
      'value' : value
    })
    .then((value) => print("Case Added"))
    .catchError((error) => print("Failed to add case: $error"));
  }

  editCase({required String id, required String name, required String description, required String value}) async{
    CollectionReference cases = FirebaseFirestore.instance.collection('cases');
    await cases.doc(id).update({
      'name' : name,
      'description' : description,
      'value' : value
    })
    .then((value) => print("Case Updated"))
    .catchError((error) => print("Failed to update case: $error"));
  }

  getUserData() async{
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    DocumentSnapshot snapshot = await users.doc('${auth.currentUser!.uid}').get();
    Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;
    user = UserModel.fromMap(data);
  }

}