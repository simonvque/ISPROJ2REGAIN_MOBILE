import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:regain_mobile/features/screens/chatfeatures/chat.dart';
import 'package:regain_mobile/features/screens/chatfeatures/notificationservice.dart';
import 'package:regain_mobile/provider/app_data_provider.dart';
import 'package:intl/intl.dart';

class NotificationListScreen extends StatefulWidget {
  @override
  _NotificationListScreenState createState() => _NotificationListScreenState();
}

class _NotificationListScreenState extends State<NotificationListScreen> {
  late Future<void> _fetchNotificationsFuture;

  @override
  void initState() {
    super.initState();
    _fetchNotificationsFuture =
        Provider.of<NotificationService>(context, listen: false)
            .fetchUnreadNotifications(
      Provider.of<AppDataProvider>(context, listen: false).userId!,
    );
  }

  @override
  Widget build(BuildContext context) {
    final notifications =
        Provider.of<NotificationService>(context).notifications;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Notifications'),
      ),
      body: FutureBuilder<void>(
        future: _fetchNotificationsFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(
              child: Text(
                'Error loading notifications: ${snapshot.error}',
              ),
            );
          }

          return notifications.isEmpty
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.notifications_off,
                          size: 80, color: Colors.grey),
                      const SizedBox(height: 16),
                      const Text(
                        'No notifications available',
                        style: TextStyle(fontSize: 18, color: Colors.grey),
                      ),
                    ],
                  ),
                )
              : ListView.builder(
                  itemCount: notifications.length,
                  itemBuilder: (context, index) {
                    final notification = notifications[index];
                    String formattedTimestamp = DateFormat('yyyy-MM-dd HH:mm')
                        .format(notification.timestamp);

                    return ListTile(
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 8),
                      leading: Icon(
                        notification.isRead
                            ? Icons.done
                            : Icons.notifications_active,
                        color: notification.isRead
                            ? Colors.grey
                            : Colors.blueAccent,
                      ),
                      title: Text(
                        notification.message,
                        style: TextStyle(
                          fontWeight: notification.isRead
                              ? FontWeight.normal
                              : FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(formattedTimestamp),
                      onTap: () async {
                        // Mark notification as read
                        await Provider.of<NotificationService>(context,
                                listen: false)
                            .markNotificationAsRead(notification.id);

                        // Navigate to chat screen
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ChatScreen(
                              roomId: notification.roomId.toString(),
                              userId: Provider.of<AppDataProvider>(context,
                                      listen: false)
                                  .userId!
                                  .toString(),
                              receiverId: notification.senderId.toString(),
                            ),
                          ),
                        ).then((_) {
                          // Reload notifications after navigating back
                          setState(() {
                            _fetchNotificationsFuture =
                                Provider.of<NotificationService>(context,
                                        listen: false)
                                    .fetchUnreadNotifications(
                              Provider.of<AppDataProvider>(context,
                                      listen: false)
                                  .userId!,
                            );
                          });
                        });
                      },
                    );
                  },
                );
        },
      ),
    );
  }
}
