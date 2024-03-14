import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:learning/pages/chat_page.dart';
import 'package:learning/pages/home_page.dart';
import 'package:learning/pages/profile_page.dart';

class NavController extends GetxController {
  RxInt index = 0.obs;

  var pages = [
    HomePage(user: FirebaseAuth.instance.currentUser),
    ChatPage(user: FirebaseAuth.instance.currentUser),
    ProfilePage(user: FirebaseAuth.instance.currentUser)
  ];
}
