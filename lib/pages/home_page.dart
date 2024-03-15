import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:learning/components/course_view.dart';
import 'package:learning/pages/course_1/info_page.dart';
import 'package:learning/pages/login_or_signup_page.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:iconsax/iconsax.dart';
import 'package:learning/services/level_function.dart';
import 'package:learning/services/nav_controller.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  final User? user;

  HomePage({super.key, required this.user});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final user = FirebaseAuth.instance.currentUser!;

  void logUserOut() async {
    await FirebaseAuth.instance.signOut();
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => const LoginOrSignupPage()));
  }

  @override
  Widget build(BuildContext context) {
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
      body: StreamBuilder<DocumentSnapshot>(
        stream: FirebaseFirestore.instance
            .collection("Users")
            .doc(user.email)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final userData = snapshot.data!.data() as Map<String, dynamic>;

            //calculate user level
            int userExp = userData['exp'];
            LevelInfo userLevel = calculateLevel(userExp);

            return Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20, top: 30),
                      child: Text(
                        'Hi, ' + userData["username"] + '!',
                        style: TextStyle(
                          fontSize: 32,
                          fontFamily: 'Roboto',
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 20, top: 40),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Color.fromRGBO(255, 117, 24, 0.4),
                            borderRadius: BorderRadius.circular(10)),
                        padding: EdgeInsets.all(10),
                        child: CircularProgressIndicator(
                          color: Colors.white,
                          backgroundColor: Colors.blueGrey,
                          value: userLevel.remainingExp /
                              ((userLevel.level + 2) * 10),
                        ),
                      ),
                    ),
                  ],
                ),
                CourseTile(
                  title: 'Basics of Chess',
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => InfoPage()));
                  },
                  imageAddress: 'lib/images/course_tile_bg.jpg',
                ),
              ],
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text("Error: " + snapshot.error.toString()),
            );
          } else {
            return Center();
          }
        },
      ),
    );
  }
}

class NavBar extends StatefulWidget {
  // final User? user;

  NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  @override
  Widget build(BuildContext context) {
    NavController controller = Get.put(NavController());

    return Scaffold(
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
