// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// import 'package:learning/pages/login_or_signup_page.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:iconsax/iconsax.dart';
import 'package:learning/services/nav_controller.dart';
import 'package:get/get.dart';

class NavBar extends StatefulWidget {
  // final User? user;

  NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  // final user = FirebaseAuth.instance.currentUser!;

  // void logUserOut() async {
  //   await FirebaseAuth.instance.signOut();
  //   Navigator.push(context,
  //       MaterialPageRoute(builder: (context) => const LoginOrSignupPage()));
  // }

  @override
  Widget build(BuildContext context) {
    NavController controller = Get.put(NavController());

    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.grey[800],
      //   automaticallyImplyLeading: false,
      //   actions: [
      //     IconButton(
      //       onPressed: (logUserOut),
      //       icon: const Icon(Icons.logout),
      //       color: Colors.white,
      //     ),
      //   ],
      // ),
      body: Obx(() => controller.pages[controller.index.value]),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 13),
        child: GNav(
            gap: 8,
            padding: EdgeInsets.all(16),
            tabBackgroundColor: Color.fromRGBO(255, 117, 24, 0.4),
            onTabChange: (index) {
              controller.index.value = index;
            },
            tabs: [
              GButton(
                icon: Iconsax.home,
                text: "Home",
              ),
              GButton(
                icon: Iconsax.message,
                text: "Chat",
              ),
              GButton(
                icon: Iconsax.user,
                text: "Profile",
              ),
            ]),
      ),
    );
  }
}
