import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:regain_mobile/constants/colors.dart';
import 'package:regain_mobile/datasource/app_data_source.dart';
import 'package:regain_mobile/features/screens/chatfeatures/chat.dart';
import 'chat_service.dart';

class RoomListScreen extends StatelessWidget {
  final String userId;
  final dataSource = AppDataSource();
  late String ipAddress;

  RoomListScreen({Key? key, required this.userId}) : super(key: key);

  Future<List<Room>> fetchUserRooms() async {
    ipAddress = dataSource.ipAddPort;

    final response = await http
        .get(Uri.parse('https://$ipAddress/api/chat/user/$userId/rooms'));

    print('Response Code: ${response.statusCode}');
    print('Response Body: ${response.body}');

    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonResponse = json.decode(response.body);
      final List jsonRooms = jsonResponse['content'];

      List<Room> rooms = [];
      for (var roomJson in jsonRooms) {
        String roomId = roomJson['roomId'];
        String roomName =
            roomJson['roomName']; // Use roomName directly from the backend
        String lastMessage = roomJson['lastMessage'] ?? 'No messages yet';
        String timestamp = roomJson['timestamp'] ??
            '2023-01-01T00:00:00Z'; // Handle null timestamp

        rooms.add(Room(
          roomId: roomId,
          roomName: roomName, // Directly use roomName
          lastMessage: lastMessage,
          timestamp: timestamp,
        ));
      }

      return rooms;
    } else {
      throw Exception('Failed to load rooms');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chat Rooms'),
        automaticallyImplyLeading: false,
        foregroundColor: white,
        backgroundColor: green,
      ),
      body: FutureBuilder<List<Room>>(
        future: fetchUserRooms(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No chat rooms found'));
          } else {
            final rooms = snapshot.data!;
            return ListView.builder(
              itemCount: rooms.length,
              itemBuilder: (context, index) {
                final room = rooms[index];
                return Container(
                  margin: const EdgeInsets.symmetric(
                      vertical: 6.0, horizontal: 8.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 1,
                        blurRadius: 4,
                      ),
                    ],
                  ),
                  child: ListTile(
                    leading: const CircleAvatar(
                      backgroundColor: green,
                      child: Icon(
                        Icons.person,
                        color: white,
                      ),
                    ),
                    title: Text(
                      room.roomName,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                    subtitle: Text(room.lastMessage),
                    trailing: Text(room.timestampFormatted),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ChangeNotifierProvider(
                            create: (_) => ChatService(),
                            child: ChatScreen(
                              roomId: room.roomId,
                              userId: userId,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}

class Room {
  final String roomId;
  final String roomName;
  final String lastMessage;
  final String timestamp;

  Room({
    required this.roomId,
    required this.roomName,
    required this.lastMessage,
    required this.timestamp,
  });

  String get timestampFormatted {
    try {
      final dateTime = DateTime.parse(timestamp);
      return "${dateTime.hour}:${dateTime.minute}";
    } catch (e) {
      print("Invalid timestamp format: $timestamp");
      return 'Invalid Timestamp';
    }
  }
}
