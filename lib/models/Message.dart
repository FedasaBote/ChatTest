import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Message {
  final String message;
  final String user_id;
  final String user_nickname;
  final String profile_url;
  Message({
    required this.message,
    required this.user_id,
    required this.user_nickname,
    required this.profile_url,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'message': message,
      'user_id': user_id,
      'user_nickname': user_nickname,
      'profile_url': profile_url,
    };
  }

  factory Message.fromMap(Map<String, dynamic> map) {
    return Message(
      message: map['message'] as String,
      user_id: map['user_id'] as String,
      user_nickname: map['user_nickname'] as String,
      profile_url: map['profile_url'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Message.fromJson(String source) => Message.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => this.toJson();
}
