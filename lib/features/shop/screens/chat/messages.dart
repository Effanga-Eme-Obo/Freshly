import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:freshly/features/shop/screens/chat/chat.dart';
import 'package:provider/provider.dart';

import '../../../../resources/auth_services.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  /// instance of auth
  final FirebaseAuth _auth = FirebaseAuth.instance;

  /// sign user out
  void signOut(){
    /// get auth service
    final authService = Provider.of<AuthService>(context, listen: false);

    authService.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Messages', style: TextStyle(fontFamily: 'DM Serif', fontSize: 30, fontWeight: FontWeight.normal)),
        automaticallyImplyLeading: false,
      ),
      body: _buildUserList(),
    );
  }

  /// build user list
  Widget _buildUserList(){
    return StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('Users').snapshots(),
        builder: (context, snapshot){
          if(snapshot.hasError){
            return const Text('error');
          }
          if(snapshot.connectionState == ConnectionState.waiting){
            return const Text('loading...');
          }
          return ListView(
            children: snapshot.data!.docs.map<Widget>((doc) => _buildUserListItem(doc)).toList(),
          );
        }
    );
  }

  // build individual list items
  Widget _buildUserListItem(DocumentSnapshot document){
    Map<String, dynamic> data = document.data()! as Map<String, dynamic>;

    // display all users except current user
    if(_auth.currentUser!.email != data['email']){
      return ListTile(
        leading: CircleAvatar(
          child: Text('${data['firstName'][0]}'.toUpperCase()),
        ),
        title: Text('${data['firstName']} ${data['lastName']}'),
        onTap: (){
          // pass the clicked user's UID to the chat page
          Navigator.push(context, MaterialPageRoute(
            builder: (context) => ChatPage(receiverUserEmail: data['email'], receiverUserId: data['uid'], receiverDisplayName: '${data['firstName']} ${data['lastName']}'),
          ));
        },
      );
    } else {
      /// return empty container
      return Container();
    }
  }
}