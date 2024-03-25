import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:freshly/features/shop/screens/chat/chat.dart';
import 'package:get/get.dart';

import '../../../../utils/constants/colors.dart';

class MessageScreen extends StatefulWidget {
  const MessageScreen({super.key});

  @override
  State<MessageScreen> createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  List<Map<String, dynamic>> _userList = [];

  @override
  void initState() {
    super.initState();
    fetchUsers();
  }

  void fetchUsers() async {
    final users = await FirebaseFirestore.instance.collection('Users').get();
    // Assuming each user document contains fields 'name' and 'uid'

    final List<Map<String, dynamic>> userList = [];
    for (var doc in users.docs) {
      userList.add({
        'firstName': doc['firstName'], // Assuming 'name' is a field in each user document
        'lastName': doc['lastName'],
        'email': doc['email'], // Document ID
      });
    }

    setState(() {
      _userList = userList;
    });
  }

  final FirebaseAuth _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Center(child: Text('Messages', style: TextStyle(fontFamily: 'DM Serif', fontSize: 30, fontWeight: FontWeight.normal))),
      ),
      body: ListView.builder(
        itemCount: _userList.length,
        itemBuilder: (context, index) {
          final user = _userList[index];
          return ListTile(
            onTap: () => Get.to(() => ChatScreen(email: '${user['firstName']} ${user['lastName']}')), // Pass the user ID to the chat screen
            leading: CircleAvatar(
              child: Text('${user['firstName'][0]}${user['lastName'][0]}'),
            ),
            title: Text('${user['firstName']} ${user['lastName']}'),
            subtitle: Text('Tap to chat', style: TextStyle(color: MColors.dark.withOpacity(0.5))),
          );
        },
      ),
    );
  }
}
