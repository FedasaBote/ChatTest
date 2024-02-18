import 'dart:convert';

import 'package:gangnam_spot_chat/models/Message.dart';
import 'package:http/http.dart' as http;

class HttpHelper {
  static getMessages() async {
    final resp = await http.get(
      Uri.parse('https://api-BC823AD1-FBEA-4F08-8F41-CF0D9D280FBF.sendbird.com/v3/open_channels/sendbird_open_channel_14092_bf4075fbb8f12dc0df3ccc5c653f027186ac9211/messages?message_ts=1484202848298'),
      headers: {
        "API-Token" : "f93b05ff359245af400aa805bafd2a091a173064"
      },
    );
    final messagesObj = jsonDecode(resp.body)["messages"] as List;
    final List<Message> messages = [];
    messagesObj.forEach((messageObj) {
      final user = messageObj['user'];
      messages.add(Message(message: messageObj['message'], user_id: user['user_id'], user_nickname: user['nickname'], profile_url: user['profile_url']));
    });
    return messages;
  }
}
