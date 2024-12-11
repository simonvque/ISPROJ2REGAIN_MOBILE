import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:regain_mobile/constants/colors.dart';
import 'chat_service.dart';

class ChatScreen extends StatefulWidget {
  final String roomId;
  final String userId;
  final String receiverId; // Add receiverId

  const ChatScreen({
    Key? key,
    required this.roomId,
    required this.userId,
    required this.receiverId,
  }) : super(key: key);

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  late ChatService chatService;
  final TextEditingController messageController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Ensure the provider is available
    WidgetsBinding.instance.addPostFrameCallback((_) {
      chatService = Provider.of<ChatService>(context, listen: false);
      chatService.connect(
          widget.roomId, widget.userId, context); // Connect only once here
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chat'),
        backgroundColor: green,
        foregroundColor: white,
      ),
      body: Consumer<ChatService>(
        builder: (context, chatService, child) {
          return Column(
            children: [
              // Display messages using Consumer
              Expanded(
                child: chatService.messages.isEmpty
                    ? const Center(child: Text('No messages yet.'))
                    : ListView.builder(
                        itemCount: chatService.messages.length,
                        itemBuilder: (context, index) {
                          final message = chatService.messages[index];
                          final isSentByUser =
                              message.senderId == widget.userId;
                          return ListTile(
                            title: Align(
                              alignment: isSentByUser
                                  ? Alignment.centerRight
                                  : Alignment.centerLeft,
                              child: Container(
                                padding: const EdgeInsets.all(10.0),
                                constraints: BoxConstraints(
                                  maxWidth: MediaQuery.of(context).size.width *
                                      0.60, // Limit the bubble width
                                ),
                                decoration: BoxDecoration(
                                  color: isSentByUser
                                      ? green100
                                      : Colors.grey[300],
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      message.senderUsername,
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: isSentByUser ? black : black,
                                      ),
                                    ),
                                    const SizedBox(height: 16),
                                    Text(
                                      message.content,
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: isSentByUser ? black : black,
                                        letterSpacing: 0.25,
                                        height: 1.5,
                                      ),
                                    ),
                                    const SizedBox(height: 16),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Text(
                                          message.timestampFormatted,
                                          style: const TextStyle(
                                            fontSize: 10,
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
              ),

              // Text input and Send button
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: messageController,
                        decoration: const InputDecoration(
                          hintText: 'Type a message...',
                          border: OutlineInputBorder(),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: green,
                              width: 2.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                    IconButton(
                      color: green600,
                      icon: const Icon(Icons.send),
                      onPressed: () {
                        if (messageController.text.isNotEmpty && mounted) {
                          chatService.sendMessage(
                            widget.userId, // senderId
                            messageController.text, // content
                            widget.receiverId, // receiverId
                          );
                          messageController.clear();
                        }
                      },
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    chatService.stompClient.deactivate();
    messageController.dispose();
    super.dispose();
  }
}
