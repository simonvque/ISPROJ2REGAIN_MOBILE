import 'package:flutter/material.dart';
import 'package:regain_mobile/constants/colors.dart';
import 'package:regain_mobile/features/screens/profile/util/user_data.dart';
import 'app_bar.dart';

/* TO FIX:

- Put Stack widget inside the column; Separate profile pic from info so it wont move

*/
class SellerProfilePage extends StatelessWidget {
  const SellerProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final user = UserData().myUser;

    return Scaffold(
      appBar: buildAppBar(context, '', showReportButton: true),
      body: Stack(
        clipBehavior: Clip.none,
        children: [
          //Default CoverPhoto
          Container(
            width: MediaQuery.of(context).size.width * 1,
            height: MediaQuery.of(context).size.height * 0.10,
            color: green,
          ),

          //Profile Picture and Info
          Positioned(
            bottom: MediaQuery.of(context).size.height * -0.17,
            left: MediaQuery.of(context).size.width * 0.05,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 55,
                  backgroundColor: white,
                  child: CircleAvatar(
                    radius: 52,
                    backgroundImage: AssetImage(user.imagePath),
                  ),
                ),
                const Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //            const StyleUsernameTxt('Samantha Jones'),
                        //        StyleBodyTxt('@${user.username}'),
                      ],
                    ),
                    SizedBox(
                      width: 100,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //         StyleBodyTxt('Joined June 2024'),
                        SizedBox(height: 5),
                        //        StyleBodyTxt('Verified')
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                //const StyleBodyTxt('4.2'),
                //const StyleBodyTxt('junkshop name'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
