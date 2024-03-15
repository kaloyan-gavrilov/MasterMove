import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:learning/components/display_box.dart';
import 'package:learning/components/mybutton.dart';
import 'package:learning/pages/login_or_signup_page.dart';
import 'package:learning/pages/test_for_expert.dart';
// import 'package:learning/pages/login_or_signup_page.dart';
// import 'package:google_nav_bar/google_nav_bar.dart';
// import 'package:iconsax/iconsax.dart';

class ProfilePage extends StatelessWidget {
  final User? user;

  ProfilePage({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;

    //field change
    Future<void> editField(String field) async {
      String newValue = "";
      await showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: Text('Edit ' + field),
                content: TextField(
                  autofocus: false,
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                      hintText: 'Enter new $field',
                      hintStyle: TextStyle(color: Colors.grey)),
                  onChanged: (value) => {newValue = value},
                ),
                actions: [
                  //cancel button
                  TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: Text(
                        "Cancel",
                        style: TextStyle(color: Colors.blue.shade500),
                      )),
                  //save button
                  TextButton(
                      onPressed: () => Navigator.of(context).pop(newValue),
                      child: Text(
                        "Save",
                        style: TextStyle(color: Colors.blue.shade500),
                      ))
                ],
              ));

      //update firestore
      if (newValue.trim().length > 0) {
        await FirebaseFirestore.instance
            .collection('Users')
            .doc(user.email)
            .update({field: newValue});
      }
    }

    //change password
    final TextEditingController _oldPasswordController =
        TextEditingController();
    final TextEditingController _newPasswordController =
        TextEditingController();

    Future<void> changePassword(BuildContext context) async {
      String oldPassword = '';
      String newPassword = '';
      bool isPasswordChanged = false;

      await showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Change Password'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: _oldPasswordController,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: 'Old Password',
                ),
                onChanged: (value) {
                  oldPassword = value;
                },
              ),
              TextField(
                controller: _newPasswordController,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: 'New Password',
                ),
                onChanged: (value) {
                  newPassword = value;
                },
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text(
                "Cancel",
                style: TextStyle(color: Colors.blue.shade500),
              ),
            ),
            TextButton(
              onPressed: () async {
                try {
                  User? user = FirebaseAuth.instance.currentUser;
                  if (user != null) {
                    // Re-authenticate user
                    AuthCredential credential = EmailAuthProvider.credential(
                        email: user.email.toString(), password: oldPassword);
                    await user.reauthenticateWithCredential(credential);

                    // Change password
                    await user.updatePassword(newPassword);
                    isPasswordChanged = true;
                  }
                  Navigator.pop(context);
                } catch (e) {
                  showDialog(
                      context: context,
                      builder: (context) {
                        _oldPasswordController.clear();
                        _newPasswordController.clear();
                        return AlertDialog(
                          content: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              e.toString(),
                              style:
                                  TextStyle(color: Colors.white, fontSize: 18),
                            ),
                          ),
                          backgroundColor: Colors.deepPurple,
                        );
                      });
                }
              },
              child: Text(
                "Save",
                style: TextStyle(color: Colors.blue.shade500),
              ),
            ),
          ],
        ),
      );

      if (isPasswordChanged) {
        // Show success message or perform any other action upon successful password change
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Success'),
            content: Text('Password changed successfully!'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text('OK'),
              ),
            ],
          ),
        );
      }
    }

    void logUserOut() async {
      await FirebaseAuth.instance.signOut();
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const LoginOrSignupPage()));
    }

    return Scaffold(
      body: StreamBuilder<DocumentSnapshot>(
        stream: FirebaseFirestore.instance
            .collection("Users")
            .doc(user.email)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final userData = snapshot.data!.data() as Map<String, dynamic>;
            return SafeArea(
                child: Center(
              child: SingleChildScrollView(
                reverse: true,
                child: Column(children: [
                  const SizedBox(height: 68),

                  //avatar + name
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 40, right: 40, top: 50),
                    child: Row(
                      children: [
                        Image.asset(
                          'lib/images/avatar_icon.png',
                          height: 100,
                          width: 100,
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Column(
                          children: [
                            Text(
                              userData['username'],
                              style: GoogleFonts.roboto(
                                  textStyle: const TextStyle(
                                    fontSize: 24,
                                  ),
                                  fontWeight: FontWeight.w600),
                            ),
                            Text(
                              user.email.toString(),
                              style: GoogleFonts.roboto(
                                  textStyle: const TextStyle(
                                    fontSize: 15,
                                  ),
                                  fontWeight: FontWeight.w400),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),

                  SizedBox(
                    height: 60,
                  ),

                  //username box
                  DisplayBox(
                    text: userData['username'],
                    sectionName: "Username",
                    onTap: () => editField('username'),
                  ),

                  SizedBox(
                    height: 37,
                  ),

                  //password box
                  DisplayBox(
                    text: "",
                    sectionName: "Password",
                    onTap: () => changePassword(context),
                  ),

                  SizedBox(
                    height: 30,
                  ),

                  //Become an expert

                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: MyButton(
                        text: "Become expert",
                        onTap: () async {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      test_for_expert_list()));
                        }),
                  ),

                  //log out
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: MyButton(
                        text: "LOG OUT",
                        onTap: () async {
                          await FirebaseAuth.instance.signOut();
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const LoginOrSignupPage()));
                        }),
                  ),
                ]),
              ),
            ));
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
