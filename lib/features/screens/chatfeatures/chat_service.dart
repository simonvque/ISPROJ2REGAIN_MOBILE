import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:regain_mobile/datasource/app_data_source.dart';
import 'package:regain_mobile/datasource/data_source.dart';
import 'package:regain_mobile/provider/app_data_provider.dart';
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
    serverUrl = 'https://$ipAddress/api/chat';
  }

  // Store messages
  List<ChatMessage> messages = [];

  Future<void> connect(String roomId) async {
    this.roomId = roomId;

    // 1. Fetch chat history
    await fetchChatHistory();

    // 2. Now, connect to WebSocket
    stompClient = StompClient(
      config: StompConfig(
        url: 'wss://$ipAddress:443/ws-chat', // WebSocket URL

        onConnect: (frame) {
          print('Connected to WebSocket');
          subscribeToRoom();
        },
        onWebSocketError: (error) {
          print('WebSocket Error: $error');
          // Handle WebSocket error, show error to the user
        },
        onStompError: (frame) {
          print('STOMP Error: ${frame.body}');
          // Handle STOMP error, show error to the user
        },
      ),
    );

    stompClient.activate();
  }

  Future<void> fetchChatHistory() async {
    final url =
        '$serverUrl/room/$roomId/messages?page=0&size=50'; // Example pagination

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
      content: json['content'],
      senderId: json['senderId'].toString(),
      receiverId: json['receiverId'].toString(),
      senderUsername: json['senderUsername'],
      receiverUsername: json['receiverUsername'],
      roomId: json['roomId'],
      timestamp: json['timestamp'],
    );
  }

  String get timestampFormatted {
    try {
      final dateTime = DateTime.parse(timestamp);
      final now = DateTime.now();
      if (dateTime.day == now.day) {
        return "${dateTime.hour}:${dateTime.minute}";
      } else {
        return "${dateTime.month}/${dateTime.day} ${dateTime.hour}:${dateTime.minute}";
      }
    } catch (e) {
      print("Invalid timestamp format: $timestamp");
      return 'Invalid Timestamp';
    }
  }
}
