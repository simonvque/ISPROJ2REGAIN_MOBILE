import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../constants/colors.dart';
import 'ChatModel.dart';
import 'InboxCard.dart';

void main() {
  runApp(const InboxScreen());
}

class InboxScreen extends StatefulWidget{
  const InboxScreen({
    super.key,
  });

  @override
  _InboxScreensState createState() => _InboxScreensState();
}


class _InboxScreensState extends State<InboxScreen> {

  List<ChatModel> chats = [
    ChatModel(
      name: "test",
      message: "Lorem ipsum dolor sit amet",
      time: "4:00",
      icon: "person.svg"
    ),ChatModel(
      name: "username",
      message: "Lorem ipsum dolor sit amet",
      time: "4:00",
      icon: "person.svg"
    ),ChatModel(
      name: "testing",
      message: "Lorem ipsum dolor sit amet",
      time: "4:00",
      icon: "person.svg"
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Chat',
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'Montserrat-Bold',
            ),
          ),
          actions: [
            IconButton(icon: const Icon(CupertinoIcons.square_pencil, color: white,),onPressed: () {},)
          ],
        ),
        body: ListView.builder(
          itemCount: chats.length,
          itemBuilder: (context, index) => InboxCard(chatModel: chats[index]),
        ),
      ),
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
        appBarTheme: const AppBarTheme(color: green),
      ),
    );
  }
}
