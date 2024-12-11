import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:regain_mobile/datasource/app_data_source.dart';

class NotificationService with ChangeNotifier {
  final dataSource = AppDataSource();
  late String ipAddress;
  List<NotificationModel> _notifications = [];
  int _unreadCount = 0;

  List<NotificationModel> get notifications => _notifications;
  int get unreadCount => _unreadCount;

  /// Fetch unread notifications for a specific user
  Future<void> fetchUnreadNotifications(int userId) async {
    ipAddress = dataSource.ipAddPort;
    final url = Uri.parse('http://$ipAddress/api/notifications/$userId/unread');

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);

        // Update notifications and unread count
        _notifications =
            data.map((json) => NotificationModel.fromJson(json)).toList();
        _unreadCount = _notifications.length;

        notifyListeners();
      } else {
        _handleError('Failed to fetch notifications', response);
      }
    } catch (e) {
      print('Error fetching notifications: $e');
      _clearNotifications(); // Clear notifications on error
    }
  }

  /// Mark all notifications as read for a specific user
  Future<void> markAllAsRead(int userId) async {
    ipAddress = dataSource.ipAddPort;
    final url =
        Uri.parse('http://$ipAddress/api/notifications/$userId/markAllAsRead');

    try {
      final response = await http.post(url);

      if (response.statusCode == 200) {
        _markNotificationsAsRead();
      } else {
        _handleError('Failed to mark notifications as read', response);
      }
    } catch (e) {
      print('Error marking notifications as read: $e');
    }
  }

  /// Clear notifications and reset unread count
  void _clearNotifications() {
    _notifications = [];
    _unreadCount = 0;
    notifyListeners();
  }

  /// Mark all notifications as read locally
  void _markNotificationsAsRead() {
    _unreadCount = 0;
    for (var notification in _notifications) {
      notification.isRead = true;
    }
    notifyListeners();
  }

  /// Handle API errors with detailed logging
  void _handleError(String message, http.Response response) {
    throw Exception(
      '$message. Status code: ${response.statusCode}, Body: ${response.body}',
    );
  }

  Future<void> markNotificationAsRead(int notificationId) async {
    ipAddress = dataSource.ipAddPort;
    final url = Uri.parse(
        'http://$ipAddress/api/notifications/markAsRead/$notificationId');

    try {
      final response = await http.post(url);

      if (response.statusCode == 200) {
        // Update local state
        final notification =
            _notifications.firstWhere((n) => n.id == notificationId);
        notification.isRead = true;
        notifyListeners();
      } else {
        throw Exception('Failed to mark notification as read');
      }
    } catch (e) {
      print('Error marking notification as read: $e');
    }
  }
}

class NotificationModel {
  final int id;
  final String message;
  final int senderId;
  final String roomId;
  final DateTime timestamp;
  bool isRead;

  NotificationModel({
    required this.id,
    required this.message,
    required this.senderId,
    required this.roomId,
    required this.timestamp,
    required this.isRead,
  });

  factory NotificationModel.fromJson(Map<String, dynamic> json) {
    print(json);

    // Parse the timestamp string to a DateTime object
    DateTime parsedTimestamp;
    try {
      parsedTimestamp = DateTime.parse(json['timestamp']);
    } catch (e) {
      print('Error parsing timestamp: $e');
      parsedTimestamp = DateTime.now(); // Default to current time on error
    }

    return NotificationModel(
      id: json['id'],
      message: json['message'],
      senderId: json['senderId'],
      roomId: json['roomId'],
      timestamp: parsedTimestamp,
      isRead: json['isRead'] ?? false,
    );
  }
}
