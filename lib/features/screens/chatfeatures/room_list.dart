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
        .get(Uri.parse('http://$ipAddress/api/chat/user/$userId/rooms'));

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
        // Determine receiverId
        String userId1 = roomJson['userId1'].toString(); // First participant
        String userId2 = roomJson['userId2'].toString(); // Second participant
        String receiverId = userId1 == userId ? userId2 : userId1;
        print('userId1: $userId1, userId2: $userId2, currentUserId: $userId');

        if (receiverId.isEmpty) {
          print('Error: receiverId could not be determined');
          continue; // Skip this room if receiverId is invalid
        }

        rooms.add(Room(
          roomId: roomId,
          roomName: roomName, // Directly use roomName
          lastMessage: lastMessage,
          timestamp: timestamp,
          receiverId: receiverId,
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
                              receiverId: room.receiverId, // Pass receiverId
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
  final String receiverId;

  Room({
    required this.roomId,
    required this.roomName,
    required this.lastMessage,
    required this.timestamp,
    required this.receiverId,
  });

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
