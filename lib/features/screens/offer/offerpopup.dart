import 'package:flutter/material.dart';

class OfferPricePopup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: SingleChildScrollView(
        child: contentBox(context),
      ),
    );
  }

  contentBox(context) {
    return Container(
      padding: EdgeInsets.all(20),
      constraints: BoxConstraints(maxWidth: 400), // Adjust maxWidth as needed
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Row(
            children: [
              CircleAvatar(
                backgroundImage: AssetImage(
                    'assets/images/profile/profileSam.jpg'), // Replace with your image asset
                radius: 20,
              ),
              SizedBox(width: 10),
              Expanded(
                child: Text(
                  '@sammysalami is selling this for PHP 100',
                  style: TextStyle(
                    fontSize: 12,
                    fontFamily: 'Montserrat-Bold',
                  ),
                ),
              ),
            ],
          ),
          Divider(height: 20, color: Colors.grey),
          SizedBox(height: 10),
          Text(
            'Enter offer value:',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              fontFamily: 'Montserrat-Bold',
            ),
          ),
          SizedBox(height: 10),
          TextField(
            decoration: InputDecoration(
              hintText: 'Type your offer here',
              hintStyle: TextStyle(
                  fontFamily:
                      'Montserrat-Regular', // Change the font family here
                  fontSize: 16,
                  color: Colors.black),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.green),
              ),
            ),
          ),
          SizedBox(height: 20),
          ElevatedButton(
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
                'Place Offer',
                style:
                    TextStyle(fontSize: 12, fontFamily: 'Montserrat-ExtraBold'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
