import 'package:flutter/material.dart';
import 'package:freshly/utils/constants/colors.dart';

class ChatBubble extends StatelessWidget {
  final String message;
  final bool isSender;
  const ChatBubble({super.key, required this.message, required this.isSender});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: isSender ? BorderRadius.only(topLeft: Radius.circular(25), bottomLeft: Radius.circular(25), bottomRight: Radius.circular(25)) : BorderRadius.only(topRight: Radius.circular(25), bottomLeft: Radius.circular(25), bottomRight: Radius.circular(25)),
        color: isSender ? MColors.success.withOpacity(0.3) : MColors.grey.withOpacity(0.5),
      ),
      child: Text(
        message,
        style: TextStyle(
          fontSize: 16,
          color: isSender ? MColors.accentColor : Colors.black,
        ),
      ),
    );
  }
}
