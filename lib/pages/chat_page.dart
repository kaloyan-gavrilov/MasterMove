// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:learning/components/user_tile.dart';
import 'package:learning/pages/chat_room.dart';
import 'package:learning/services/chat_service.dart';
// import 'package:learning/pages/login_or_signup_page.dart';
// import 'package:google_nav_bar/google_nav_bar.dart';
// import 'package:iconsax/iconsax.dart';

class ChatPage extends StatelessWidget {
  final User? user;
  ChatPage({super.key, required this.user});

  final ChatService _chatService = ChatService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            "Chats",
            style: TextStyle(fontWeight: FontWeight.w600),
          ),
        ),
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
      ),
      body: _buildUserList(),
    );
  }

  Widget _buildUserList() {
    return StreamBuilder(
        stream: _chatService.getUsersStream(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Text("Error!");
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Text("Loading...");
          }
          return ListView(
            children: snapshot.data!
                .map<Widget>(
                    (userData) => _buildUserListItem(userData, context))
                .toList(),
          );
        });
  }

  Widget _buildUserListItem(
      Map<String, dynamic> userData, BuildContext context) {
    if (userData["email"] != FirebaseAuth.instance.currentUser!.email) {
      return UserTile(
          text: userData["username"],
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ChatRoom(
                          receiverUsername: userData["username"],
                          receiverID: userData['uid'],
                        )));
          });
    } else {
      return Container();
    }
  }
}
