import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:freshly/features/shop/screens/chat/widgets/chat_bubbles.dart';
import 'package:freshly/utils/constants/colors.dart';

import '../../../../resources/chat_services.dart';


class ChatPage extends StatefulWidget {
  final String receiverUserEmail;
  final String receiverUserId;
  final String receiverDisplayName;
  ChatPage({super.key, required this.receiverUserEmail, required this.receiverUserId, required this.receiverDisplayName});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final TextEditingController _messageController = TextEditingController();
  final ChatService _chatService = ChatService();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  void sendMessages() async {
    if(_messageController.text.isNotEmpty){
      await _chatService.sendMessage(widget.receiverUserId, _messageController.text);

      _messageController.clear();
    }
  }

  final user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CircleAvatar(
              child: Text(widget.receiverDisplayName.substring(0, 1).toUpperCase()),
            ),
            SizedBox(width: 10),
            Text(widget.receiverDisplayName),
          ],
        ),
      ),
      body: Column(
        children: [
          /// messages
          Expanded(
            child: _buildMessageList(),
          ),

          /// user input
          _buildMessageInput()
        ],
      ),
    );
  }

  /// build message list
  Widget _buildMessageList(){
    return StreamBuilder(
      stream: _chatService.getMessages(
          widget.receiverUserId,
          _firebaseAuth.currentUser!.uid
      ),
      builder: (context, snapshot){
        if(snapshot.hasError){
          return Text('Error${snapshot.error}');
        }
        if(snapshot.connectionState == ConnectionState.waiting){
          return Text('loading...');
        }
        return ListView(
          children: snapshot.data!.docs.map((document) => _buildMessageItem(document)).toList(),
        );
      },
    );
  }
  /// build message item
  Widget _buildMessageItem(DocumentSnapshot document){
    Map<String, dynamic> data = document.data() as Map<String, dynamic>;
    bool isSender = data['senderId'] == _firebaseAuth.currentUser!.uid;

    // align messages
    var alignment = (data['senderId'] == _firebaseAuth.currentUser!.uid ? Alignment.centerRight : Alignment.centerLeft);

    return Container(
      alignment: alignment,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: (data['senderId'] == _firebaseAuth.currentUser!.uid ? CrossAxisAlignment.end : CrossAxisAlignment.start),
          mainAxisAlignment: (data['senderId'] == _firebaseAuth.currentUser!.uid ? MainAxisAlignment.end : MainAxisAlignment.start),
          children: [
            //Text(data['senderEmail']),
            ChatBubble(
              message: data['message'],
              isSender: isSender,
            ),
          ],
        ),
      ),
    );
  }
  /// build message input
  Widget _buildMessageInput(){
    return Container(
      padding: EdgeInsets.all(8),
      child: Row(
        children: [
          // textfield
          Expanded(
            child: TextField(
              controller: _messageController,
              decoration: InputDecoration(
                hintText: 'Message...',
                hintStyle: TextStyle(fontSize: 17),
              ),
            ),
          ),

          // send button
          IconButton(onPressed: sendMessages, icon: Icon(Icons.send_rounded, color: MColors.accentColor)),
        ],
      ),
    );
  }
}