import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:learning/components/user_tile.dart';
import 'package:learning/pages/chat_room.dart';
import 'package:learning/services/chat_service.dart';

class ChatPage extends StatefulWidget {
  final User? user;
  ChatPage({super.key, required this.user});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final ChatService _chatService = ChatService();

  bool showExpertsView = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            showExpertsView ? "Expert chats" : "User chats",
            style: TextStyle(fontWeight: FontWeight.w600),
          ),
        ),
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                showExpertsView = !showExpertsView;
              });
            },
            icon: Icon(Icons.swap_horiz),
          ),
        ],
      ),
      body: showExpertsView ? _buildExpertsList() : _buildUserList(),
    );
  }

  //User chats
  Widget _buildUserList() {
    return StreamBuilder(
      stream: _chatService.getUsersStream(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text("Error!");
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Text("Loading...");
        }
        List<Widget> userWidgets = [];
        List<dynamic> usersData = snapshot.data! as List<dynamic>;
        usersData.forEach((userData) {
          if (userData["email"] != FirebaseAuth.instance.currentUser!.email &&
              userData['type'] == 'student') {
            userWidgets.add(UserTile(
              text: userData["username"],
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ChatRoom(
                      receiverUsername: userData["username"],
                      receiverID: userData['uid'],
                    ),
                  ),
                );
              },
            ));
          }
        });
        return ListView(children: userWidgets);
      },
    );
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

  //Expert chats
  Widget _buildExpertsList() {
    return StreamBuilder(
      stream: _chatService.getUsersStream(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text(
              "Error!"); // Changed: Return Text widget instead of const Text
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Text(
              "Loading..."); // Changed: Return Text widget instead of const Text
        }
        List<Widget> expertWidgets = []; // Changed: Define a List<Widget>
        List<dynamic> usersData = snapshot.data! as List<dynamic>;
        usersData.forEach((userData) {
          if (userData["email"] != FirebaseAuth.instance.currentUser!.email &&
              userData['type'] == 'expert') {
            expertWidgets.add(UserTile(
              text: userData["username"],
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ChatRoom(
                      receiverUsername: userData["username"],
                      receiverID: userData['uid'],
                    ),
                  ),
                );
              },
            ));
          }
        });
        return ListView(
            children:
                expertWidgets); // Changed: Return ListView with expertWidgets
      },
    );
  }
}

Widget _buildExpertListItem(
    Map<String, dynamic> userData, BuildContext context) {
  if ((userData["email"] != FirebaseAuth.instance.currentUser!.email) &&
      userData['type'] == 'expert') {
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
