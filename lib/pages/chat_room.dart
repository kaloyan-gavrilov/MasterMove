import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:learning/components/chat_bubble.dart';
import 'package:learning/components/textfield.dart';
import 'package:learning/services/chat_service.dart';

class ChatRoom extends StatelessWidget {
  final String receiverUsername;
  final String receiverID;
  ChatRoom(
      {super.key, required this.receiverUsername, required this.receiverID});

  //controllers
  final TextEditingController _messageController = TextEditingController();

  //services
  final ChatService _chatService = ChatService();

  //send message
  void sendMessage() async {
    if (_messageController.text.isNotEmpty) {
      await _chatService.sendMessage(receiverID, _messageController.text);

      _messageController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(receiverUsername),
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          //display all the messages
          Expanded(
            child: _buildMessageList(),
          ),

          //text input
          _buildUserInput()
        ],
      ),
    );
  }

  Widget _buildMessageList() {
    String senderID = FirebaseAuth.instance.currentUser!.uid;
    return StreamBuilder(
        stream: _chatService.getMessages(receiverID, senderID),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            Text("Error!");
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            Text("Loading...");
          }

          if (snapshot.data == null) {
            return Container();
          }

          return ListView(
            children: snapshot.data!.docs
                .map((doc) => _buildMessageItem(doc))
                .toList(),
          );
        });
  }

  Widget _buildMessageItem(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;

    //is current user
    bool isCurrentUser =
        data['senderID'] == FirebaseAuth.instance.currentUser!.uid;

    //align messages
    var alignment =
        isCurrentUser ? Alignment.centerRight : Alignment.centerLeft;

    return Container(
        alignment: alignment,
        child: ChatBubble(
          message: data['message'],
          isCurrentUser: isCurrentUser,
        ));
  }

  Widget _buildUserInput() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Row(
        children: [
          Expanded(
            child: MyTextField(
              controller: _messageController,
              hintText: "Type a message...",
              obscureText: false,
            ),
          ),
          Container(
            decoration: BoxDecoration(
                color: Color.fromRGBO(
                  255,
                  117,
                  24,
                  0.4,
                ),
                shape: BoxShape.circle),
            margin: EdgeInsets.only(right: 25),
            child: IconButton(
              onPressed: sendMessage,
              icon: Icon(
                Icons.arrow_upward,
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
    );
  }
}
