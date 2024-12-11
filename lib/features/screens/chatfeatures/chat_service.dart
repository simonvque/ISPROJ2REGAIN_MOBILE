import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:regain_mobile/datasource/app_data_source.dart';
import 'package:stomp_dart_client/stomp_dart_client.dart';
import 'package:flutter/material.dart';

class ChatService with ChangeNotifier {
  final dataSource = AppDataSource();
  late String? ipAddress;
  late StompClient stompClient;
  late String roomId;

  // final String serverUrl = 'http://192.168.1.24:9191/api/chat'; // REST API URL
  late String serverUrl;

  ChatService() {
    ipAddress = dataSource.ipAddPort;
    serverUrl = 'http://$ipAddress/api/chat';
  }

  // Store messages
  List<ChatMessage> messages = [];

  Future<void> connect(
      String roomId, String userId, BuildContext context) async {
    this.roomId = roomId;

    // Fetch chat history first
    await fetchChatHistory();

    // Initialize WebSocket
    stompClient = StompClient(
      config: StompConfig(
        url: 'ws://$ipAddress/ws-chat', // WebSocket URL
        onConnect: (frame) {
          print('Connected to WebSocket');
          subscribeToRoom(); // Subscribe to the chat room
          subscribeToNotifications(userId, context); // Pass context here
        },
        onWebSocketError: (error) {
          print('WebSocket Error: $error');
        },
        onStompError: (frame) {
          print('STOMP Error: ${frame.body}');
        },
      ),
    );

    stompClient.activate();
  }

  Future<void> fetchChatHistory() async {
    final url =
        '$serverUrl/room/$roomId/messages?page=0&size=100'; // Example pagination

    try {
      // Clear previous messages to avoid showing old data
      messages.clear();
      notifyListeners();

      final response = await http.get(Uri.parse(url));
      print("Fetching chat history from: $url");
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');

      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonResponse = json.decode(response.body);
        final List messagesList = jsonResponse['content'] ?? [];

        if (messagesList.isNotEmpty) {
          messages =
              messagesList.map((data) => ChatMessage.fromJson(data)).toList();
          notifyListeners(); // Notify listeners after chat history is fetched
        } else {
          print('No messages found for this room.');
        }
      } else {
        print('Failed to load chat history: ${response.statusCode}');
        throw Exception('Failed to load chat history');
      }
    } catch (e) {
      print('Error fetching chat history: $e');
      // Optionally, show an error dialog or Snackbar here
    }
  }

  void subscribeToRoom() {
    stompClient.subscribe(
      destination: '/topic/chatroom/$roomId',
      callback: (frame) {
        if (frame.body != null) {
          handleIncomingMessage(frame.body!);
        }
      },
    );
  }

  void handleIncomingMessage(String frameBody) {
    try {
      final jsonMessage = jsonDecode(frameBody);
      print('Incoming message: $jsonMessage');
      final newMessage = ChatMessage.fromJson(jsonMessage);
      // Check if the message is already in the list
      // if (!messages
      //     .any((message) => message.timestamp == newMessage.timestamp)) {
      messages.add(newMessage); // Add only if it's not already in the list
      notifyListeners(); // Notify listeners after receiving a new message
      // }
    } catch (e) {
      print('Error processing message: $e');
    }
  }

  void sendMessage(String senderId, String messageContent, String receiverId) {
    if (roomId.isEmpty) {
      print("Cannot send message. Room ID is empty.");
      return;
    }

    final Map<String, dynamic> message = {
      'senderId': senderId,
      'receiverId': receiverId,
      'content': messageContent,
      'roomId': roomId,
    };

    final messageJson = jsonEncode(message);
    print('Sending message: $messageJson');

    try {
      stompClient.send(
        destination: '/app/chat.sendMessage',
        body: messageJson,
      );
    } catch (e) {
      print('Error sending message: $e');
      // Handle the error, show message to user if needed
    }
  }

  void subscribeToNotifications(String userId, BuildContext context) {
    stompClient.subscribe(
      destination: '/queue/notifications/$userId',
      callback: (frame) {
        if (frame.body != null) {
          handleNotification(frame.body!, context); // Pass context here
        }
      },
    );
  }

  void handleNotification(String notificationJson, BuildContext context) {
    try {
      // Parse and display the notification
      final notification = jsonDecode(notificationJson);
      print('Notification received: $notification');

      final sender = notification['sender'] ?? 'Unknown';
      final message = notification['content'] ?? '';
      final timestamp = notification['timestamp'] ?? '';

      // Pass the context to showNotification
      showNotification(context, "Message from $sender", message, timestamp);
    } catch (e) {
      print('Error processing notification: $e');
    }
  }

  void showNotification(
      BuildContext context, String title, String message, String timestamp) {
    // Use the context to show the notification
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
            Text(message),
            Text(timestamp,
                style: const TextStyle(fontSize: 10, color: Colors.grey)),
          ],
        ),
        duration: const Duration(seconds: 3),
      ),
    );
  }

  @override
  void dispose() {
    if (stompClient.isActive) {
      stompClient.deactivate();
    }
    super.dispose();
  }
}

class ChatMessage {
  final String content;
  final String senderId;
  final String receiverId;
  final String senderUsername;
  final String receiverUsername;
  final String roomId;
  final String timestamp;

  ChatMessage({
    required this.content,
    required this.senderId,
    required this.receiverId,
    required this.senderUsername,
    required this.receiverUsername,
    required this.roomId,
    required this.timestamp,
  });

  factory ChatMessage.fromJson(Map<String, dynamic> json) {
    return ChatMessage(
      content: json['content'] ?? '',
      senderId: json['senderId']?.toString() ?? '',
      receiverId: json['receiverId']?.toString() ?? '',
      senderUsername: json['senderUsername'] ?? 'Unknown',
      receiverUsername: json['receiverUsername'] ?? 'Unknown',
      roomId: json['roomId'] ?? '',
      timestamp: json['timestamp'] ?? '',
    );
  }

  String get timestampFormatted {
    try {
      // Parse the timestamp as UTC
      final dateTime = DateTime.parse(timestamp).toLocal();
      final now = DateTime.now();

      // Format the time with leading zeros
      final hour = dateTime.hour.toString().padLeft(2, '0');
      final minute = dateTime.minute.toString().padLeft(2, '0');

      if (dateTime.year == now.year &&
          dateTime.month == now.month &&
          dateTime.day == now.day) {
        // If the timestamp is today
        return "$hour:$minute";
      } else {
        // If the timestamp is not today
        final month = dateTime.month.toString().padLeft(2, '0');
        final day = dateTime.day.toString().padLeft(2, '0');
        return "$month/$day $hour:$minute";
      }
    } catch (e) {
      print("Invalid timestamp format: $timestamp");
      return 'Invalid Timestamp';
    }
  }
}
