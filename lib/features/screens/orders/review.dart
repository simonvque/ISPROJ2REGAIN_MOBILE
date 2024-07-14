import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:regain_mobile/constants/sizes.dart';

import '../../../themes/elements/button_styles.dart';

void main() {
  runApp(const ReviewsPage());
}

class ReviewsPage extends StatefulWidget {
  const ReviewsPage({super.key});

  @override
  State<ReviewsPage> createState() => _ReviewPageState();
}

class _ReviewPageState extends State<ReviewsPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(CupertinoIcons.arrow_left, color: Colors.white),
            onPressed: () {},
          ),
          title: const Text(
            'Write Review',
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'Montserrat-Bold',
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                 Text(
                  'Seller',
                  style: Theme.of(context).textTheme.titleLarge
                ),
                const SizedBox(height: ReGainSizes.spaceBtwItems),
                 Row(
                  children: [
                    const CircleAvatar(
                      radius: 30,
                      backgroundImage:
                          NetworkImage('https://via.placeholder.com/150'),
                    ),
                    const SizedBox(width: ReGainSizes.spaceBtwItems),
                    Text(
                      '@username',
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                  ],
                ),
                const SizedBox(height: ReGainSizes.defaultSpace),
                Text(
                  'How was your experience?',
                  style: Theme.of(context).textTheme.titleLarge
                ),
                const SizedBox(height: ReGainSizes.spaceBtwItems),
                StarRating(
                  onRatingChanged: (rating) {
                    // Handle the rating change
                  },
                ),
                const SizedBox(height: ReGainSizes.spaceBtwItems),
                Text(
                  'Write Feedback',
                  style: Theme.of(context).textTheme.titleLarge
                ),
                const SizedBox(height: 16),
                const TextField(
                  maxLines: 5,
                  maxLength: 1000,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(), // Default border style
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Color(0xFF12CF8A),
                          width: 2.0), // Green border when focused
                    ),
                    hintText: 'Add feedback here...',
                  ),
                ),

                const SizedBox(height: 110),

                RegainButtons(
                  text: 'Submit',
                  onPressed: () {
                    // Add your confirmation logic here
                  },
                  type: ButtonType.filled,
                  size: ButtonSize.large,
                ),

              ],
            ),
          ),
        ),
      ),
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
        appBarTheme: const AppBarTheme(color: Color(0xFF12CF8A)),
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
    return Padding(
      padding: const EdgeInsets.only(left: 16.0),
      child: Row(
        children: List.generate(5, (index) {
          return IconButton(
            iconSize: 40.0,
            icon: Icon(
              index < _rating ? Icons.star : Icons.star,
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
      ),
    );
  }
}
