import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

void addExpToFirebase() async {
  User? currentUser = FirebaseAuth.instance.currentUser;
  DocumentSnapshot<Map<String, dynamic>> userDoc = await FirebaseFirestore
      .instance
      .collection("Users")
      .doc(currentUser!.email)
      .get();

  int currentExp = (userDoc.data()?['exp'] ?? 0) as int;

  int newExp = currentExp + 10;

  await FirebaseFirestore.instance
      .collection("Users")
      .doc(currentUser.email)
      .set({
    'exp': newExp,
  }, SetOptions(merge: true));
}
