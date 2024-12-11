import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:regain_mobile/model/rating_model.dart';
import 'package:regain_mobile/provider/app_data_provider.dart';
import 'package:regain_mobile/provider/rating_provider.dart';
import 'package:regain_mobile/themes/app_bar.dart';

class MyCommentsPage extends StatefulWidget {
  @override
  _MyCommentsPageState createState() => _MyCommentsPageState();
}

class _MyCommentsPageState extends State<MyCommentsPage> {
  late RatingProvider _ratingProvider;
  late int currentUserId;

  @override
  void initState() {
    super.initState();
    _ratingProvider = Provider.of<RatingProvider>(context, listen: false);
  }

  Future<List<Rating>> _fetchRatings() async {
    final appDataProvider = Provider.of<AppDataProvider>(context, listen: false);
    currentUserId = appDataProvider.userId;

    return await _ratingProvider.getRatingsSentByUser(currentUserId);
  }

  Future<void> _editComment(Rating rating) async {
    final TextEditingController commentController =
        TextEditingController(text: rating.comments);

    //the dialog
    final bool? isUpdated = await showDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Edit Comment'),
          content: TextField(
            controller: commentController,
            maxLines: 3,
            decoration: InputDecoration(hintText: 'Edit your comment'),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(false); 
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () async {
                final newComment = commentController.text;
                if (newComment.isNotEmpty) {
                  await _ratingProvider.updateComment(rating.ratingId, newComment);
                  Navigator.of(context).pop(true);
                }
              },
              child: Text('Save'),
            ),
          ],
        );
      },
    );

    if (isUpdated == true) {
      setState(() {});
    }
  }

@override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: buildAppBar(
      context,
      'My Reviews',
    ),
    body: FutureBuilder<List<Rating>>(
      future: _fetchRatings(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return Center(child: Text('No reviews found.'));
        } else {
          final ratings = snapshot.data!;

          return SingleChildScrollView(
            child: Column(
              children: ratings.map((rating) {
                final String formattedDateCreated =
                    DateFormat('yyyy-MM-dd').format(rating.dateCreated);
                final String? formattedDateEdited = rating.dateEdited != null
                    ? DateFormat('yyyy-MM-dd').format(rating.dateEdited!)
                    : null;

                return ListTile(
                  title: Text('Date Created: $formattedDateCreated'),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Rating: ${rating.rateValue}'),
                      Text(
                            'Comment: ${rating.comments}',
                            maxLines: 2, 
                            overflow: TextOverflow.ellipsis, 
                          ),                  
                      if (formattedDateEdited != null)
                        Text('Edited'),
                    ],
                  ),
                  trailing: IconButton(
                    icon: Icon(Icons.edit),
                    onPressed: () => _editComment(rating),
                  ),
                );
              }).toList(),
            ),
          );
        }
      },
    ),
  );
}
}