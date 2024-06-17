import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(ReviewsPage());
}

class ReviewsPage extends StatefulWidget {
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
                const Text(
                  'Seller',
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'Montserrat-Bold',
                  ),
                ),
                SizedBox(height: 16),
                const Row(
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundImage:
                          NetworkImage('https://via.placeholder.com/150'),
                    ),
                    SizedBox(width: 16),
                    Text(
                      '@username',
                      style: TextStyle(
                        fontSize: 12,
                        fontFamily: 'Montserrat-Medium',
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 24),
                const Text(
                  'How was your experience?',
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'Montserrat-Bold',
                  ),
                ),
                SizedBox(height: 16),
                StarRating(
                  onRatingChanged: (rating) {
                    // Handle the rating change
                  },
                ),
                SizedBox(height: 24),
                const Text(
                  'Write Feedback',
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'Montserrat-Bold',
                  ),
                ),
                SizedBox(height: 16),
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
                SizedBox(height: 110),
                Container(
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 1.0),
                    child: ElevatedButton(
                      onPressed: () {
                        // Add your confirmation logic here
                      },
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: Color(0xFF12CF8A),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        minimumSize: Size(double.infinity, 50),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Text(
                          'Submit',
                          style: TextStyle(
                              fontSize: 15, fontFamily: 'Montserrat-ExtraBold'),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
        appBarTheme: AppBarTheme(color: Color(0xFF12CF8A)),
      ),
    );
  }
}

class StarRating extends StatefulWidget {
  final Function(int) onRatingChanged;

  StarRating({required this.onRatingChanged});

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
