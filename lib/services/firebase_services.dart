import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseServices {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final User? user = FirebaseAuth.instance.currentUser;
  final userCollectionRef = FirebaseFirestore.instance.collection('users');
  Future signIn({required String email, required String password}) async{
    await auth
        .signInWithEmailAndPassword(email: email, password: password)
        .then((value) => print('user logged in successfully'))
        .catchError((error) => print(error));
  }

  Future signOut() async{
    await auth.signOut();
  }

  Future createAcoount(
      {required String email, required String password, required String name}) async{
    await auth.createUserWithEmailAndPassword(email: email, password: password)
        .then((value) => print('user account created successfully'))
        .catchError((error) => print(error));
    await userCollectionRef.doc(user!.uid).set({
      'id' : user!.uid,
      'name': name,
      'email': email,
      // 'date' : Timestamp.fromDate(DateTime.),
    }).then((value) => print('user data added successfully'))
        .catchError((error) => print(error));
  }

  addUserData(String gender, int age, int currentWeight, int targetWeight, int heightInCM) async {
    await userCollectionRef.doc(user!.uid).update({
      'gender' : gender,
      'age' : age,
      'currentWeight' : currentWeight,
      'targetWeight' : targetWeight,
      'heightInCM' : heightInCM,
    }).then((value) => print('user data added successfully'))
        .catchError((error) => print(error));
  }

  Future<String> getName() async{
    var data = await userCollectionRef.doc(user!.uid).get();
    return data['name'];
  }

}
