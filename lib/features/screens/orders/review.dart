import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:regain_mobile/datasource/app_data_source.dart';
import 'package:regain_mobile/features/screens/orders/my_orders_page.dart';
import 'package:regain_mobile/features/validations/form_validators.dart';
import 'package:regain_mobile/model/response_model.dart';
import 'package:regain_mobile/provider/app_data_provider.dart';
import 'package:regain_mobile/provider/rating_provider.dart';
import 'package:http/http.dart' as http;
import 'package:regain_mobile/routes/route_manager.dart';
import 'package:regain_mobile/themes/app_bar.dart';
import 'package:regain_mobile/themes/elements/button_styles.dart';

class ReviewsPage extends StatefulWidget {
  final String sellerUsername; // Receive sellerUsername as a parameter

  const ReviewsPage({super.key, required this.sellerUsername});

  @override
  State<ReviewsPage> createState() => _ReviewPageState();
}

class _ReviewPageState extends State<ReviewsPage> {
  final _reviewKey = GlobalKey<FormState>();
  final _feedbackController = TextEditingController();
  int _rating = 0;
  late int currentUserId;
  final dataSource = AppDataSource();
  late String ipAddress = dataSource.ipAddPort;
  String? errorText;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final appDataProvider =
        Provider.of<AppDataProvider>(context, listen: false);
    currentUserId = appDataProvider.userId;
  }

  Future<void> _submitRating() async {
    // if (_rating == 0 || _feedbackController.text.isEmpty) {
    //   ScaffoldMessenger.of(context).showSnackBar(
    //     const SnackBar(content: Text('Feedback cannot be empty.')),
    //   );
    //   return;
    // }
    if (_reviewKey.currentState!.validate() && _rating != 0) {
      try {
        final sellerId =
            await _fetchSellerIdByUsername(widget.sellerUsername, ipAddress);

        final ratingPayload = {
          'ratedUserId': sellerId,
          'ratedByUserId': currentUserId,
          'rateValue': _rating,
          'comments': _feedbackController.text,
        };

        ResponseModel response =
            await Provider.of<RatingProvider>(context, listen: false)
                .addRating(ratingPayload);

        _showDialog(response);
      } catch (error) {
        print('Error: $error');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to submit rating: $error')),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Stars cannot be empty')),
      );
    }
  }

  void _showDialog(ResponseModel response) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(response.statusCode == 200 ? 'Success' : 'Failure'),
          content: Text(
            response.statusCode == 200
                ? 'Review submitted successfully!'
                : 'Failed to submit review: ${response.message}',
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                //Navigator.of(context).pop();
                if (response.statusCode == 200) {
                  Navigator.of(context)
                      .pushReplacementNamed(RouteManager.routeNavMenu);
                  // Navigator.of(context)
                  //     .pushReplacementNamed(RouteManager.routeNavMenu);
                }
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, 'Submit Review'),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _reviewKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'How was your experience with ${widget.sellerUsername}?',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 24),
              StarRating(
                onRatingChanged: (rating) {
                  setState(() {
                    _rating = rating;
                  });
                },
              ),
              const SizedBox(height: 24),
              TextFormField(
                controller: _feedbackController,
                decoration: const InputDecoration(
                  errorMaxLines: 3,
                  labelText: 'Write Feedback',
                  border: OutlineInputBorder(),
                ),
                validator: (value) =>
                    Validators.ReportValidation(value, fieldName: 'feedback'),
              ),
              const SizedBox(height: 48),
              RegainButtons(
                text: 'Submit',
                onPressed: _submitRating,
                type: ButtonType.filled,
                size: ButtonSize.large,
                txtSize: BtnTxtSize.large,
              ),
              Consumer<RatingProvider>(
                builder: (context, ratingProvider, child) {
                  return ratingProvider.isLoading
                      ? const CircularProgressIndicator()
                      : Container();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class StarRating extends StatefulWidget {
  final Function(int) onRatingChanged;

  const StarRating({super.key, required this.onRatingChanged});

  @override
  _StarRatingState createState() => _StarRatingState();
}

class _StarRatingState extends State<StarRating> {
  int _rating = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(5, (index) {
        return IconButton(
          iconSize: 40.0,
          icon: Icon(
            index < _rating ? Icons.star : Icons.star_border,
            color: index < _rating ? Colors.amber : Colors.grey,
          ),
          onPressed: () {
            setState(() {
              _rating = index + 1;
            });
            widget.onRatingChanged(_rating);
          },
        );
      }),
    );
  }
}

Future<int> _fetchSellerIdByUsername(String username, String ipAdd) async {
  final url = Uri.parse('http://$ipAdd/api/user/seller/by-username/$username');

  final response = await http.get(url);

  if (response.statusCode == 200) {
    final sellerData = jsonDecode(response.body);
    if (sellerData != null && sellerData.containsKey('response')) {
      return sellerData['response'];
    } else {
      throw Exception('Seller ID not found in response');
    }
  } else {
    throw Exception('Failed to fetch seller ID. Error: ${response.body}');
  }
}
