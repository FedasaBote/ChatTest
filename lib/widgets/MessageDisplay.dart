import 'package:flutter/material.dart';
import 'package:gangnam_spot_chat/models/Message.dart';
import 'package:gangnam_spot_chat/widgets/MyMessage.dart';
import 'package:gangnam_spot_chat/widgets/OthersMessage.dart';

class MessageDisplay extends StatelessWidget {
  final Message message;
  const MessageDisplay({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    if (message.user_id == '') {
      return MyMessage(message: message.message);
    }
    return OthersMessage(message: message);
  }
}