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
    final currentUser = FirebaseAuth.instance.currentUser; // Get the current logged-in user
    final users = await FirebaseFirestore.instance.collection('Users').get();
    
    final List<Map<String, dynamic>> userList = [];
    for (var doc in users.docs) {
      Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
      if (currentUser!.email != data['email']) { // Check if the document is not the current user
        userList.add({
          'firstName': data['firstName'], // Assuming 'firstName' is a field in each user document
          'lastName': data['lastName'],
          'email': data['email'], // Assuming 'email' is a field in each user document
        });
      }
    }

    setState(() {
      _userList = userList;
    });
  }

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
            onTap: () => Get.to(() => ChatScreen(name: '${user['firstName']} ${user['lastName']}', email: user['email'])), // Navigate to chat screen
            leading: CircleAvatar(
              child: Text('${user['firstName'][0]}${user['lastName'][0]}'), // Initials of the user
            ),
            title: Text('${user['firstName']} ${user['lastName']}'), // Full name of the user
            subtitle: Text('Tap to chat', style: TextStyle(color: Colors.grey.withOpacity(0.5))),
          );
        },
      ),
    );
  }
}
