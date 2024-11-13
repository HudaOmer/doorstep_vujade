import 'package:doorstep_vujade/global_widgets/custom_icon.dart';
import 'package:flutter/material.dart';
import '../global_widgets/custom_search_bar.dart';
import '../utils/colors.dart';
import 'chat_screen.dart';

double appbarheight = 80;

class AllChatsScreen extends StatelessWidget {
  const AllChatsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: appbarheight,
        iconTheme: IconThemeData(color: contrastColor),
        backgroundColor: Colors.white,
        title: const Center(
            child: Text('Chat      ', style: TextStyle(fontSize: 20))),
        leading: const Icon(Icons.arrow_back_ios),
      ),
      body: ListView(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
                width: MediaQuery.of(context).size.width * 0.88,
                child: const CustomSearchBar()),
          ],
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.04),
        const ChatListTile(
            sender: 'SomeOne',
            screen: ChatScreen(),
            profile: '',
            message: 'hello there how are you?'),
        const ChatListTile(
            sender: 'SomeOne3',
            screen: ChatScreen(),
            profile: 'assets/images/villa.jpeg',
            message: 'no'),
        const ChatListTile(
            sender: 'SomeOne4',
            screen: ChatScreen(),
            profile: '',
            message: 'bla bla'),
        const ChatListTile(
            sender: 'SomeOne2',
            screen: ChatScreen(),
            profile: '',
            message: 'ok'),
        SizedBox(height: MediaQuery.of(context).size.height * 0.05),
      ]),
    );
  }
}

class ChatListTile extends StatelessWidget {
  final String sender;
  final String profile;
  final String message;
  final bool? isRead;
  final int? unreadNo;
  final Widget screen;
  const ChatListTile(
      {super.key,
      required this.sender,
      required this.profile,
      required this.screen,
      required this.message,
      this.isRead,
      this.unreadNo});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListTile(
          title:
              Text(sender, style: const TextStyle(fontWeight: FontWeight.w500)),
          subtitle: Text(message,
              style: const TextStyle(fontWeight: FontWeight.w400)),
          leading: CircleAvatar(
              radius: 30,
              child: profile.isNotEmpty
                  ? SizedBox(
                      width: 60,
                      height: 60,
                      child:
                          CustomIcon(iconName: profile, height: 60, width: 60))
                  : const SizedBox(width: 30)),
          trailing: const Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text("2:00 PM",
                  style: TextStyle(
                      fontWeight: FontWeight.w500, color: Colors.grey)),
              Icon(Icons.done_all, size: 20, color: Colors.grey),
            ],
          ),
          onTap: () => Navigator.push(
              (context), MaterialPageRoute(builder: (context) => screen)),
        ));
  }
}
