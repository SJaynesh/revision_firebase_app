import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/users_model.dart';

class FireStoreService {
  FireStoreService._();

  static FireStoreService fireStoreService = FireStoreService._();
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  void addUserData({required UserModel user}) {
    firestore.collection('Users').doc(user.email).set(user.toMap);
  }
}
