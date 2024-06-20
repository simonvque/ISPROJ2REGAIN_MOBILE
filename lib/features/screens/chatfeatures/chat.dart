import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:regain_mobile/profile/report_page.dart';

void main() {
  runApp(ChatApp());
}

class ChatApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
        appBarTheme: AppBarTheme(color: Color(0xFF12CF8A)),
      ),
      debugShowCheckedModeBanner: false,
      home: ChatPage(),
    );
  }
}

class ChatPage extends StatefulWidget {
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(CupertinoIcons.arrow_left, color: Colors.white),
          onPressed: () {
            // Add your onPressed code here!
          },
        ),
        title: Row(
          children: [
            CircleAvatar(
              backgroundImage:
                  AssetImage('assets/images/profile/profileSam.jpg'),
              radius: 20,
            ),
            SizedBox(width: 10),
            Text(
              '@sammysalami',
              style: TextStyle(
                color: Colors.white,
                fontSize: 15,
                fontFamily: 'Montserrat-Bold',
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.flag_outlined, color: Colors.white),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ReportPage()),
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                // Add your chat messages here
              ],
            ),
          ),
          Divider(height: 1, color: Colors.grey), // Line above the input field
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                IconButton(
                  icon: Icon(CupertinoIcons.add_circled_solid,
                      color: Colors.black87, size: 40),
                  onPressed: () {
                    // Add your onPressed code here!
                  },
                ),
                Expanded(
                  child: Container(
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.grey[200], // Grey background
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Message',
                        hintStyle: TextStyle(
                            fontFamily:
                                'Montserrat-Regular', // Change the font family here
                            fontSize: 16,
                            color: Colors.black),
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(CupertinoIcons.arrow_right_circle_fill,
                      color: Color(0xFF12CF8A), size: 40),
                  onPressed: () {
                    // Add your onPressed code here!
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
