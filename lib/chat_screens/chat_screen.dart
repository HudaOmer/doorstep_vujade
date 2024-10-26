import 'package:flutter/material.dart';
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import '../utils/colors.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final List<types.Message> messages = [
    types.TextMessage(
      author: const types.User(id: 'user1'),
      createdAt: DateTime.now().millisecondsSinceEpoch,
      id: 'msg1',
      text: 'Hello! How are you?',
    ),
    types.TextMessage(
      author: const types.User(id: 'user2'),
      createdAt: DateTime.now().millisecondsSinceEpoch + 1000,
      id: 'msg2',
      text: 'I\'m good, thanks! And you?',
    ),
    types.TextMessage(
      author: const types.User(id: 'user1'),
      createdAt: DateTime.now().millisecondsSinceEpoch + 2000,
      id: 'msg3',
      text: 'I\'m doing well. Just working on a Flutter app.',
    ),
  ];

  void _onSendPressed(types.PartialText message) {
    final newMessage = types.TextMessage(
      author: const types.User(id: 'user1'),
      createdAt: DateTime.now().millisecondsSinceEpoch,
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      text: message.text,
    );

    setState(() {
      messages.add(newMessage);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        iconTheme: IconThemeData(color: contrastColor),
        backgroundColor: Colors.white,
        title: const Center(
            child: Text('Chat    ', style: TextStyle(fontSize: 20))),
        leading: GestureDetector(
            onTap: () => Navigator.pop(context),
            child: const Icon(Icons.arrow_back_ios)),
      ),
      body: Chat(
        messages: messages.reversed.toList(),
        user: const types.User(id: 'user1'), // Current user
        onSendPressed: _onSendPressed,
        // showUserAvatars: true,
        showUserNames: true,
        theme: const DefaultChatTheme(
          messageBorderRadius: 12,
        ),
        textMessageBuilder: (message,
            {required int messageWidth, required bool showName}) {
          final isCurrentUser = message.author.id == 'user1';
          return Container(
            padding: const EdgeInsets.all(2),
            decoration: BoxDecoration(color: mediumGreyColor, boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  spreadRadius: 1,
                  blurRadius: 4,
                  offset: const Offset(0, -2)),
            ]),
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: isCurrentUser ? Colors.orange : Colors.white,
                // borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                message.text,
                style: TextStyle(
                    color: isCurrentUser ? Colors.white : Colors.black),
              ),
            ),
          );
        },
      ),
    );
  }
}
